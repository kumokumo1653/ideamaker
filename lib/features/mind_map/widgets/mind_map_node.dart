import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/features/mind_map/entities/entities.dart';

enum MindMapAction {
  addChild,
  addSibling;

  LTRB getPosition(RenderBox node) {
    final nodeOffset = node.localToGlobal(Offset.zero);
    switch (this) {
      case MindMapAction.addChild:
        return LTRB(
          left: nodeOffset.dx + node.size.width,
          top: nodeOffset.dy,
        );
      case MindMapAction.addSibling:
        return LTRB(
          left: nodeOffset.dx,
          top: nodeOffset.dy + node.size.height,
        );
    }
  }
}

class LTRB {
  LTRB({this.left, this.top, this.right, this.bottom});
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
}

class MindMapNode extends HookConsumerWidget {
  const MindMapNode({
    required this.node,
    required this.onChangedTitle,
    this.onTapAddChild,
    this.onTapAddSibling,
    super.key,
  });

  final TreeNode node;
  final void Function(String) onChangedTitle;
  final VoidCallback? onTapAddChild;
  final VoidCallback? onTapAddSibling;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final nodeKey = useMemoized(GlobalKey.new, []);

    final addChildOverlay = useState<OverlayEntry?>(null);
    final addSiblingOverlay = useState<OverlayEntry?>(null);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // insert overlay for add child
        if (onTapAddChild != null && addChildOverlay.value == null) {
          addChildOverlay.value = OverlayEntry(
            builder: (context) => _MindMapActionOverlay(
              nodeKey: nodeKey,
              action: MindMapAction.addChild,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: onTapAddChild,
                ),
              ),
            ),
          );
          Overlay.of(context).insert(addChildOverlay.value!);
        }
      });
      return () => addChildOverlay.value?.remove();
    }, [onTapAddChild == null]);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // insert overlay for add sibling
        if (onTapAddSibling != null && addSiblingOverlay.value == null) {
          addSiblingOverlay.value = OverlayEntry(
            builder: (context) => _MindMapActionOverlay(
              nodeKey: nodeKey,
              action: MindMapAction.addSibling,
              child: IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: onTapAddSibling,
              ),
            ),
          );
          Overlay.of(context).insert(addSiblingOverlay.value!);
        }
      });
      return () => addSiblingOverlay.value?.remove();
    }, [onTapAddSibling == null]);

    return Card(
      key: nodeKey,
      child: SizedBox(
        width: 200,
        child: TextField(
          decoration: const InputDecoration(border: InputBorder.none),
          controller: controller,
          onChanged: onChangedTitle,
        ),
      ),
    );
  }
}

class _MindMapActionOverlay extends HookConsumerWidget {
  const _MindMapActionOverlay({
    required this.nodeKey,
    required this.child,
    required this.action,
  });

  final GlobalKey nodeKey;
  final Widget child;
  final MindMapAction action;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodeRenderObject =
        nodeKey.currentContext?.findRenderObject() as RenderBox?;

    if (nodeRenderObject == null) {
      assert(true, 'Node key context is not available');
      return const SizedBox.shrink();
    }
    final position = action.getPosition(nodeRenderObject);
    return Positioned(
      left: position.left,
      top: position.top,
      right: position.right,
      bottom: position.bottom,
      height: nodeRenderObject.size.height,
      child: child,
    );
  }
}

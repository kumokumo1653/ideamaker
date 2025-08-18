import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';

class MindMapNode extends HookConsumerWidget {
  const MindMapNode({
    required this.node,
    required this.onChangedTitle,
    required this.onTapAddChild,
    this.onTapRemove,
    this.hasActions = false,
    this.onTapAddSibling,
    super.key,
  });

  final TreeNode node;
  final bool hasActions;
  final void Function(String) onChangedTitle;
  final VoidCallback onTapAddChild;
  final VoidCallback? onTapAddSibling;
  final VoidCallback? onTapRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: node.title);
    final nodeKey = useMemoized(GlobalKey.new);
    final overlayEntry = useState<OverlayEntry?>(null);

    void handleCloseOverlay() {
      if (overlayEntry.value != null) {
        overlayEntry.value!.remove();
        overlayEntry.value = null;
      }
    }

    void handleTapActions() {
      // Show action overlay
      final renderBox =
          nodeKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) return;
      if (overlayEntry.value != null) return;
      overlayEntry.value = OverlayEntry(
        builder: (context) => _MindMapActionOverlay(
          left: renderBox.localToGlobal(Offset.zero).dx + renderBox.size.width,
          top: renderBox.localToGlobal(Offset.zero).dy,
          onTapAddChild: () {
            onTapAddChild();
            handleCloseOverlay();
          },
          onTapAddSibling: onTapAddSibling != null
              ? () {
                  onTapAddSibling!();
                  handleCloseOverlay();
                }
              : null,
          onTapRemove: onTapRemove != null
              ? () {
                  onTapRemove!();
                  handleCloseOverlay();
                }
              : null,
          onCloseOverlay: handleCloseOverlay,
        ),
      );
      Overlay.of(context).insert(overlayEntry.value!);
    }

    useEffect(() {
      return handleCloseOverlay;
    }, []);
    return Card(
      key: nodeKey,
      child: Row(
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 200),
            padding: const EdgeInsets.all(8),
            child: IntrinsicWidth(
              child: TextField(
                decoration: const InputDecoration(border: InputBorder.none),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: controller,
                onChanged: onChangedTitle,
              ),
            ),
          ),
          if (hasActions) ...[
            IconButton(
              icon: const Icon(Icons.pending),
              onPressed: handleTapActions,
            ),
          ],
        ],
      ),
    );
  }
}

class _MindMapActionOverlay extends HookConsumerWidget {
  const _MindMapActionOverlay({
    required this.left,
    required this.top,
    required this.onTapAddChild,
    required this.onTapRemove,
    required this.onCloseOverlay,
    this.onTapAddSibling,
  });

  final double left;
  final double top;
  final VoidCallback onTapAddChild;
  final VoidCallback? onTapAddSibling;
  final VoidCallback? onTapRemove;
  final VoidCallback onCloseOverlay;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: onCloseOverlay,
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        Positioned(
          left: left,
          top: top,
          child: Card(
            child: IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(l10n.mind_map_overlay_add_child_button),
                    onTap: onTapAddChild,
                    leading: const Icon(Icons.add_circle),
                  ),
                  if (onTapAddSibling != null) ...[
                    ListTile(
                      title: Text(
                        l10n.mind_map_overlay_add_sibling_button,
                      ),
                      onTap: onTapAddSibling,
                      leading: const Icon(Icons.add_circle),
                    ),
                  ],
                  if (onTapRemove != null) ...[
                    ListTile(
                      title: Text(l10n.mind_map_overlay_remove_button),
                      onTap: onTapRemove,
                      leading: const Icon(Icons.remove_circle),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

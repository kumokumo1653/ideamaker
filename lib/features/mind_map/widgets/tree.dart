import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum TreeSlot { node, leaves }

class Tree extends SlottedMultiChildRenderObjectWidget<TreeSlot, RenderBox> {
  const Tree({
    required this.node,
    required this.leaves,
    this.branchSpacing = 100,
    this.branchColor = Colors.red,
    this.branchWidth = 2.0,
    super.key,
  });

  final Widget node;
  final List<Widget> leaves;
  final double branchSpacing;
  final Color branchColor;
  final double branchWidth;

  @override
  Iterable<TreeSlot> get slots => TreeSlot.values;

  @override
  Widget? childForSlot(TreeSlot slot) {
    return switch (slot) {
      TreeSlot.node => node,
      TreeSlot.leaves =>
        leaves.isEmpty
            ? null
            : _Leaves(
                branchPaint: Paint()
                  ..color = branchColor
                  ..strokeWidth = branchWidth
                  ..style = PaintingStyle.stroke,
                branchSpacing: branchSpacing / 2,
                children: leaves,
              ),
    };
  }

  @override
  SlottedContainerRenderObjectMixin<TreeSlot, RenderBox> createRenderObject(
    BuildContext context,
  ) {
    return _RenderTree(
      branchSpacing: branchSpacing / 2,
      branchPaint: Paint()
        ..color = branchColor
        ..strokeWidth = branchWidth
        ..style = PaintingStyle.stroke,
    );
  }
}

class _RenderTree extends RenderBox
    with SlottedContainerRenderObjectMixin<TreeSlot, RenderBox> {
  _RenderTree({required this.branchSpacing, required this.branchPaint});

  final double branchSpacing;
  final Paint branchPaint;
  RenderBox? get _node => childForSlot(TreeSlot.node);
  RenderBox? get _leaves => childForSlot(TreeSlot.leaves);
  @override
  void performLayout() {
    const childConstraints = BoxConstraints();

    final node = _node;
    final leaves = _leaves;

    assert(node != null, 'parent must be provided to Tree.');

    // layout parent node
    var nodeSize = Size.zero;
    var leavesSize = Size.zero;
    if (node != null) {
      node.layout(childConstraints, parentUsesSize: true);
      nodeSize = node.size;
      // layout leaf nodes
      if (leaves != null) {
        leaves.layout(childConstraints, parentUsesSize: true);
        leavesSize = leaves.size;

        // position the node and leaves based on their sizes
        if (node.size.height < leavesSize.height) {
          _positionChild(leaves, Offset(nodeSize.width + branchSpacing, 0));
          _positionChild(
            node,
            Offset(0, (leavesSize.height - nodeSize.height) / 2),
          );
        } else {
          _positionChild(node, Offset.zero);
          _positionChild(
            leaves,
            Offset(
              nodeSize.width + branchSpacing,
              (nodeSize.height - leavesSize.height) / 2,
            ),
          );
        }
      } else {
        _positionChild(node, Offset.zero);
      }
    }

    // calculate the size of the Tree widget
    final childWidth = leavesSize == Size.zero
        ? nodeSize.width
        : nodeSize.width + branchSpacing + leavesSize.width;
    final childSize = Size(
      childWidth,
      nodeSize.height > leavesSize.height ? nodeSize.height : leavesSize.height,
    );

    size = constraints.constrain(childSize);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final node = _node;
    final leaves = _leaves;

    assert(node != null, 'parent must be provided to Tree.');
    if (node != null) {
      _paintChild(node, context, offset);
    }
    if (leaves != null) {
      _paintChild(leaves, context, offset);
    }

    // paint branch lines
    if (leaves == null || node == null) {
      return;
    }
    final nodeOffset = _getChildOffset(node, offset);
    final branchPath = Path()
      ..moveTo(
        nodeOffset.dx + node.size.width,
        nodeOffset.dy + node.size.height / 2,
      )
      ..lineTo(
        nodeOffset.dx + node.size.width + branchSpacing,
        nodeOffset.dy + node.size.height / 2,
      );
    context.canvas.drawPath(
      branchPath,
      branchPaint,
    );
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    for (final child in children) {
      final parentData = child.parentData! as BoxParentData;
      final isHit = result.addWithPaintOffset(
        offset: parentData.offset,
        position: position,
        hitTest: (BoxHitTestResult result, Offset transformed) {
          return child.hitTest(result, position: transformed);
        },
      );
      if (isHit) {
        return true;
      }
    }
    return false;
  }
}

class _Leaves extends MultiChildRenderObjectWidget {
  const _Leaves({
    required super.children,
    required this.branchSpacing,
    required this.branchPaint,
  });

  final double branchSpacing;
  final Paint branchPaint;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderLeaves(
      branchSpacing: branchSpacing,
      branchPaint: branchPaint,
    );
  }
}

class _LeavesParentData extends ContainerBoxParentData<RenderBox> {}

class _RenderLeaves extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _LeavesParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _LeavesParentData> {
  _RenderLeaves({required this.branchSpacing, required this.branchPaint});

  final double branchSpacing;
  final Paint branchPaint;

  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! _LeavesParentData) {
      child.parentData = _LeavesParentData();
    }
  }

  @override
  void performLayout() {
    const childConstraints = BoxConstraints();

    var maxWidth = 0.0;
    var totalHeight = 0.0;

    // layout each child
    for (final child in getChildrenAsList()) {
      child.layout(childConstraints, parentUsesSize: true);
      _positionChild(child, Offset(branchSpacing, totalHeight));
      // update the total height and max width
      totalHeight += child.size.height;
      maxWidth = maxWidth > child.size.width ? maxWidth : child.size.width;
    }

    // calculate the size of the leaves
    size = constraints.constrain(Size(branchSpacing + maxWidth, totalHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (childCount == 0) {
      return;
    }
    if (childCount == 1) {
      final child = firstChild!;
      final childOffset = _getChildOffset(child, offset);
      _paintChild(child, context, offset);
      // paint branch line
      final branchPath = Path()
        ..moveTo(
          offset.dx,
          offset.dy + size.height / 2,
        )
        ..lineTo(
          offset.dx + branchSpacing,
          childOffset.dy + child.size.height / 2,
        );
      context.canvas.drawPath(branchPath, branchPaint);
      return;
    }
    final children = getChildrenAsList();
    var turningStart = Offset.zero;
    var turningEnd = Offset.zero;
    const radius = 10.0;
    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final childOffset = _getChildOffset(child, offset);

      _paintChild(child, context, offset);

      // paint branch lines
      final turningSpacing = i == 0 || i == children.length - 1 ? radius : 0.0;
      if (i == 0) {
        turningStart = Offset(
          offset.dx,
          childOffset.dy + child.size.height / 2,
        );
      } else if (i == children.length - 1) {
        turningEnd = Offset(
          offset.dx,
          childOffset.dy + child.size.height / 2,
        );
      }
      final branchPath = Path()
        ..moveTo(
          offset.dx + turningSpacing,
          childOffset.dy + child.size.height / 2,
        )
        ..lineTo(
          offset.dx + branchSpacing,
          childOffset.dy + child.size.height / 2,
        );

      context.canvas.drawPath(branchPath, branchPaint);
    }
    final branchPath = Path()
      ..arcTo(
        Rect.fromLTWH(turningStart.dx, turningStart.dy, radius * 2, radius * 2),
        3 / 2 * pi,
        -pi / 2,
        true,
      )
      ..arcTo(
        Rect.fromLTWH(
          turningEnd.dx,
          turningEnd.dy - radius * 2,
          radius * 2,
          radius * 2,
        ),
        pi,
        -pi / 2,
        false,
      );
    context.canvas.drawPath(branchPath, branchPaint);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }
}

void _positionChild(RenderBox child, Offset offset) {
  (child.parentData! as BoxParentData).offset = offset;
}

void _paintChild(RenderBox child, PaintingContext context, Offset offset) {
  context.paintChild(child, _getChildOffset(child, offset));
}

Offset _getChildOffset(RenderBox child, Offset offset) {
  final childParentData = child.parentData! as BoxParentData;
  return childParentData.offset + offset;
}

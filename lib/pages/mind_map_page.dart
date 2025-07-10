import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/features/mind_map/widgets/mind_map_node.dart';

class MindMapPage extends HookConsumerWidget {
  const MindMapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mind Map Page'),
          ],
        ),
      ),
    );
  }
}

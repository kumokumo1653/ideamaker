import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idea_maker/core/entities/entities.dart';
import 'package:idea_maker/core/widgets/widgets.dart';
import 'package:idea_maker/features/mind_map/controllers/controllers.dart';
import 'package:idea_maker/l10n/l10n_provider.dart';
import 'package:idea_maker/routers/router.dart';
import 'package:intl/intl.dart';

class MindMapListPage extends HookConsumerWidget {
  const MindMapListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final mindMapListState = ref.watch(mindMapListControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.mind_map_list_title),
      ),
      body: AsyncWidget<List<MindMapSummary>>(
        mindMapListState,
        builder: (mindMaps) {
          // If the list is empty
          if (mindMaps.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.mind_map_list_empty_message,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => const MindMapPageRoute().go(context),
                    child: Text(l10n.mind_map_list_create_new),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: mindMaps.length,
            itemBuilder: (context, index) {
              final mindMap = mindMaps[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(mindMap.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.mind_map_list_tile_node_count(mindMap.nodeCount),
                      ),
                      Text(
                        l10n.mind_map_list_tile_updated_at(
                          DateFormat.yMd().add_Hms().format(mindMap.updatedAt),
                        ),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _showDeleteConfirmDialog(
                      context,
                      ref,
                      mindMap,
                    ),
                  ),
                  onTap: () => MindMapPageRoute(treeId: mindMap.id).go(context),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const MindMapPageRoute().go(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Show delete confirmation dialog
  void _showDeleteConfirmDialog(
    BuildContext context,
    WidgetRef ref,
    MindMapSummary mindMap,
  ) {
    final l10n = ref.read(l10nProvider);
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.mind_map_list_delete_confirm_title),
        content: Text(
          l10n.mind_map_list_delete_confirm_message(mindMap.title),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.common_cancel_button),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref
                  .read(mindMapListControllerProvider.notifier)
                  .deleteMindMap(mindMap.id);
            },
            child: Text(
              l10n.mind_map_list_delete_confirm_delete_button,
            ),
          ),
        ],
      ),
    );
  }
}

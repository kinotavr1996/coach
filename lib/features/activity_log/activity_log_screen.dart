import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../shared/localization/app_localizations.dart';

class ActivityLogScreen extends ConsumerWidget {
  const ActivityLogScreen({super.key});

  static const routeName = '/activity-log';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(activityLogsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('activityLogTitle')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: logsAsync.when(
          data: (logs) {
            if (logs.isEmpty) {
              return const Center(child: Text('No activity yet.'));
            }
            return ListView.separated(
              itemCount: logs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final log = logs[index];
                final date = log.createdAt.toLocal().toIso8601String().substring(0, 16);
                return Card(
                  child: ListTile(
                    title: Text('${log.actionType} • ${log.entityType}'),
                    subtitle: Text(date),
                  ),
                );
              },
            );
          },
          error: (err, _) => Center(child: Text('Error: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

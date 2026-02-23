import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/export_report.dart';
import '../../shared/localization/app_localizations.dart';

class ExportScreen extends ConsumerWidget {
  const ExportScreen({super.key});

  static const routeName = '/export';

  Future<void> _export(BuildContext context, WidgetRef ref) async {
    final profile = ref.read(profileStreamProvider).value;
    final northStar = ref.read(northStarStreamProvider).value;
    final goals = ref.read(goalsStreamProvider).value ?? [];
    final checkIns = ref.read(checkInsStreamProvider).value ?? [];

    final exportService = ref.read(exportServiceProvider);
    final path = await exportService.exportSummary(
      profile: profile,
      northStar: northStar,
      goals: goals,
      checkIns: checkIns,
    );

    final report = ExportReport(
      period: DateTime.now().toIso8601String().substring(0, 10),
      format: 'markdown',
      filePath: path,
      createdAt: DateTime.now(),
    );
    await ref.read(coachRepositoryProvider).saveExportReport(report);

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Export saved: $path')));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exportsAsync = ref.watch(exportReportsStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.t('exportTitle'))),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('export_run'),
        onPressed: () => _export(context, ref),
        icon: const Icon(Icons.file_download_outlined),
        label: Text(context.l10n.t('exportSummary')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: exportsAsync.when(
          data: (exports) {
            if (exports.isEmpty) {
              return const Center(
                child: Text('No exports yet. Tap to create one.'),
              );
            }
            return ListView.separated(
              itemCount: exports.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final export = exports[index];
                return Card(
                  child: ListTile(
                    key: Key('export_item_$index'),
                    title: Text('Export ${export.period}'),
                    subtitle: Text(export.filePath),
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

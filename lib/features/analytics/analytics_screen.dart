import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/goal.dart';
import '../../shared/localization/app_localizations.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  static const routeName = '/analytics';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(goalsStreamProvider);
    final checkinsAsync = ref.watch(checkInsStreamProvider);
    final activeRole = ref.watch(activeRoleContextProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('analyticsTitle')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: goalsAsync.when(
          data: (goals) {
            return checkinsAsync.when(
              data: (checkins) {
                final visibleGoals = activeRole == null
                    ? goals
                    : goals
                        .where((goal) =>
                            goal.roleContextId == activeRole.id || goal.roleContextId == null)
                        .toList();
                final visibleCheckins = activeRole == null
                    ? checkins
                    : checkins
                        .where((checkIn) =>
                            checkIn.roleContextId == activeRole.id || checkIn.roleContextId == null)
                        .toList();
                final totalGoals = visibleGoals.length;
                final activeGoals =
                    visibleGoals.where((g) => g.status == GoalStatus.active).length;
                final doneGoals = visibleGoals.where((g) => g.status == GoalStatus.done).length;
                final progressAvg = visibleCheckins.isEmpty
                    ? 0
                    : visibleCheckins.map((c) => c.progressPercent).reduce((a, b) => a + b) /
                        visibleCheckins.length;
                final sortedCheckins = [...visibleCheckins]
                  ..sort((a, b) => b.date.compareTo(a.date));
                final lastCheckIn = sortedCheckins.isEmpty ? null : sortedCheckins.first;

                return ListView(
                  children: [
                    const Text(
                      'Progress overview',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _MetricCard(
                      label: 'Total goals',
                      value: totalGoals.toString(),
                    ),
                    _MetricCard(
                      label: 'Active goals',
                      value: activeGoals.toString(),
                    ),
                    _MetricCard(
                      label: 'Completed goals',
                      value: doneGoals.toString(),
                    ),
                    _MetricCard(
                      label: 'Avg check-in progress',
                      value: '${progressAvg.toStringAsFixed(0)}%',
                    ),
                    if (lastCheckIn != null)
                      _MetricCard(
                        label: 'Last check-in',
                        value: lastCheckIn.date.toLocal().toIso8601String().substring(0, 10),
                      ),
                    const SizedBox(height: 24),
                    const Text(
                      'Insights',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      visibleCheckins.isEmpty
                          ? 'Add check-ins to unlock insights.'
                          : 'You are averaging ${progressAvg.toStringAsFixed(0)}% progress. Keep momentum by scheduling next actions.',
                    ),
                  ],
                );
              },
              error: (err, _) => Center(child: Text('Error: $err')),
              loading: () => const Center(child: CircularProgressIndicator()),
            );
          },
          error: (err, _) => Center(child: Text('Error: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

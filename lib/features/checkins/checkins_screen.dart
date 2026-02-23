import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/check_in.dart';
import '../../shared/localization/app_localizations.dart';

class CheckinsScreen extends ConsumerWidget {
  const CheckinsScreen({super.key});

  static const routeName = '/checkins';

  void _openCreateCheckInSheet(BuildContext context) {
    showModalBottomSheet<CheckIn>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const CreateCheckInSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkinsAsync = ref.watch(checkInsStreamProvider);
    final activeRole = ref.watch(activeRoleContextProvider).value;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.t('checkinsTitle'))),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('checkins_new'),
        onPressed: () => _openCreateCheckInSheet(context),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.t('newCheckIn')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: checkinsAsync.when(
          data: (checkins) {
            final visibleCheckins = activeRole == null
                ? checkins
                : checkins
                      .where(
                        (checkIn) =>
                            checkIn.roleContextId == activeRole.id ||
                            checkIn.roleContextId == null,
                      )
                      .toList();
            final missedSummary = _MissedCheckInsSummary.fromCheckIns(
              visibleCheckins,
              DateTime.now(),
            );
            final items = <Widget>[
              if (missedSummary.showAlert)
                _MissedCheckinsBanner(summary: missedSummary),
              if (visibleCheckins.isEmpty)
                _EmptyCheckinsState(message: context.l10n.t('noCheckins'))
              else
                ...visibleCheckins.map(
                  (checkIn) => _CheckInCard(checkIn: checkIn),
                ),
            ];
            return ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) => items[index],
            );
          },
          error: (err, _) => Center(child: Text('Error: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class CreateCheckInSheet extends ConsumerStatefulWidget {
  const CreateCheckInSheet({super.key});

  @override
  ConsumerState<CreateCheckInSheet> createState() => _CreateCheckInSheetState();
}

class _CreateCheckInSheetState extends ConsumerState<CreateCheckInSheet> {
  final _formKey = GlobalKey<FormState>();
  final _blockersController = TextEditingController();
  final _lessonsController = TextEditingController();

  CheckInCadence _cadence = CheckInCadence.weekly;
  double _progress = 0;

  @override
  void dispose() {
    _blockersController.dispose();
    _lessonsController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final roleContext = ref.read(activeRoleContextProvider).value;
    final checkIn = CheckIn(
      roleContextId: roleContext?.id,
      cadence: _cadence,
      date: DateTime.now(),
      progressPercent: _progress.round(),
      blockers: _blockersController.text.trim(),
      lessons: _lessonsController.text.trim(),
      updatedAt: DateTime.now(),
    );
    await ref.read(coachRepositoryProvider).saveCheckIn(checkIn);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _runAiSummary() async {
    final ai = ref.read(aiServiceProvider);
    final input = [
      'Progress: ${_progress.round()}%',
      if (_blockersController.text.trim().isNotEmpty)
        'Blockers: ${_blockersController.text.trim()}',
      if (_lessonsController.text.trim().isNotEmpty)
        'Lessons: ${_lessonsController.text.trim()}',
    ].join('\n');
    final response = await ai.summarizeCheckIn(input);
    if (!mounted) {
      return;
    }
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.t('aiSummaryTitle')),
        content: Text(response),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.l10n.t('close')),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.t('newCheckIn'),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<CheckInCadence>(
                initialValue: _cadence,
                decoration: InputDecoration(
                  labelText: context.l10n.t('cadenceLabel'),
                ),
                items: [
                  DropdownMenuItem(
                    value: CheckInCadence.daily,
                    child: Text(context.l10n.t('cadenceDaily')),
                  ),
                  DropdownMenuItem(
                    value: CheckInCadence.weekly,
                    child: Text(context.l10n.t('cadenceWeekly')),
                  ),
                  DropdownMenuItem(
                    value: CheckInCadence.monthly,
                    child: Text(context.l10n.t('cadenceMonthly')),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _cadence = value);
                  }
                },
              ),
              const SizedBox(height: 12),
              Text(
                '${context.l10n.t('checkinProgress')}: ${_progress.round()}%',
              ),
              Slider(
                value: _progress,
                min: 0,
                max: 100,
                divisions: 20,
                label: _progress.round().toString(),
                onChanged: (value) => setState(() => _progress = value),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _blockersController,
                decoration: InputDecoration(
                  labelText: context.l10n.t('checkinBlockersLabel'),
                  hintText: context.l10n.t('checkinBlockersHint'),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _lessonsController,
                decoration: InputDecoration(
                  labelText: context.l10n.t('checkinLessonsLabel'),
                  hintText: context.l10n.t('checkinLessonsHint'),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              FilledButton(
                key: const Key('checkin_save'),
                onPressed: _save,
                child: Text(context.l10n.t('saveCheckIn')),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _runAiSummary,
                icon: const Icon(Icons.auto_awesome_outlined),
                label: Text(context.l10n.t('aiSummaryTitle')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckInCard extends StatelessWidget {
  const _CheckInCard({required this.checkIn});

  final CheckIn checkIn;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_cadenceLabel(context, checkIn.cadence).toUpperCase()} • ${checkIn.date.toLocal().toIso8601String().substring(0, 10)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${context.l10n.t('checkinProgress')}: ${checkIn.progressPercent}%',
            ),
            if (checkIn.blockers.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                '${context.l10n.t('checkinBlockersLabel')}: ${checkIn.blockers}',
              ),
            ],
            if (checkIn.lessons.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                '${context.l10n.t('checkinLessonsLabel')}: ${checkIn.lessons}',
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EmptyCheckinsState extends StatelessWidget {
  const _EmptyCheckinsState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message, textAlign: TextAlign.center));
  }
}

class _MissedCheckinsBanner extends StatelessWidget {
  const _MissedCheckinsBanner({required this.summary});

  final _MissedCheckInsSummary summary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cadenceOrder = CheckInCadence.values;
    final chips = cadenceOrder
        .where((cadence) => summary.byCadence.containsKey(cadence))
        .map(
          (cadence) => Chip(
            label: Text(
              '${_cadenceLabel(context, cadence)}: ${summary.byCadence[cadence]}',
            ),
          ),
        )
        .toList();

    return Card(
      color: colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DefaultTextStyle.merge(
          style: TextStyle(color: colorScheme.onTertiaryContainer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.t('missedCheckinsTitle'),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${context.l10n.t('missedCheckinsTotal')}: ${summary.total}',
              ),
              if (chips.isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(spacing: 8, runSpacing: 8, children: chips),
              ],
              const SizedBox(height: 8),
              Text(context.l10n.t('missedCheckinsAdvice')),
            ],
          ),
        ),
      ),
    );
  }
}

class _MissedCheckInsSummary {
  const _MissedCheckInsSummary({required this.total, required this.byCadence});

  final int total;
  final Map<CheckInCadence, int> byCadence;

  bool get showAlert => total >= 2;

  static _MissedCheckInsSummary fromCheckIns(
    List<CheckIn> checkIns,
    DateTime now,
  ) {
    if (checkIns.isEmpty) {
      return const _MissedCheckInsSummary(total: 0, byCadence: {});
    }
    final latestByCadence = <CheckInCadence, DateTime>{};
    for (final checkIn in checkIns) {
      final existing = latestByCadence[checkIn.cadence];
      if (existing == null || checkIn.date.isAfter(existing)) {
        latestByCadence[checkIn.cadence] = checkIn.date;
      }
    }

    final byCadence = <CheckInCadence, int>{};
    final today = DateUtils.dateOnly(now);
    for (final entry in latestByCadence.entries) {
      final lastDate = DateUtils.dateOnly(entry.value);
      final diffDays = today.difference(lastDate).inDays;
      final missed = _calculateMissed(diffDays, entry.key);
      if (missed > 0) {
        byCadence[entry.key] = missed;
      }
    }
    final total = byCadence.values.fold<int>(0, (sum, value) => sum + value);
    return _MissedCheckInsSummary(total: total, byCadence: byCadence);
  }
}

int _calculateMissed(int diffDays, CheckInCadence cadence) {
  if (diffDays <= 1) {
    return 0;
  }
  final intervalDays = switch (cadence) {
    CheckInCadence.daily => 1,
    CheckInCadence.weekly => 7,
    CheckInCadence.monthly => 30,
  };
  final overdueDays = diffDays - 1;
  return overdueDays ~/ intervalDays;
}

String _cadenceLabel(BuildContext context, CheckInCadence cadence) {
  switch (cadence) {
    case CheckInCadence.daily:
      return context.l10n.t('cadenceDaily');
    case CheckInCadence.weekly:
      return context.l10n.t('cadenceWeekly');
    case CheckInCadence.monthly:
      return context.l10n.t('cadenceMonthly');
  }
}

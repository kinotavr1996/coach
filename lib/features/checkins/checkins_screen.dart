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
      appBar: AppBar(
        title: Text(context.l10n.t('checkinsTitle')),
      ),
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
                    .where((checkIn) =>
                        checkIn.roleContextId == activeRole.id || checkIn.roleContextId == null)
                    .toList();
            if (visibleCheckins.isEmpty) {
              return const Center(
                child: Text(
                  'No check-ins yet.\nTap “New check-in” to create one.',
                  textAlign: TextAlign.center,
                ),
              );
            }
            return ListView.separated(
              itemCount: visibleCheckins.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final checkIn = visibleCheckins[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${checkIn.cadence.storageValue.toUpperCase()} • ${checkIn.date.toLocal().toIso8601String().substring(0, 10)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text('Progress: ${checkIn.progressPercent}%'),
                        if (checkIn.blockers.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text('Blockers: ${checkIn.blockers}'),
                        ],
                        if (checkIn.lessons.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text('Lessons: ${checkIn.lessons}'),
                        ],
                      ],
                    ),
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
        title: const Text('AI summary'),
        content: Text(response),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
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
              const Text(
                'New check-in',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<CheckInCadence>(
                initialValue: _cadence,
                decoration: const InputDecoration(labelText: 'Cadence'),
                items: const [
                  DropdownMenuItem(value: CheckInCadence.daily, child: Text('Daily')),
                  DropdownMenuItem(value: CheckInCadence.weekly, child: Text('Weekly')),
                  DropdownMenuItem(value: CheckInCadence.monthly, child: Text('Monthly')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _cadence = value);
                  }
                },
              ),
              const SizedBox(height: 12),
              Text('Progress: ${_progress.round()}%'),
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
                decoration: const InputDecoration(
                  labelText: 'Blockers',
                  hintText: 'What slowed you down?',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _lessonsController,
                decoration: const InputDecoration(
                  labelText: 'Lessons / Insights',
                  hintText: 'What did you learn?',
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
                label: const Text('AI summary'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

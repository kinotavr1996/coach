import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/goal.dart';
import '../../shared/localization/app_localizations.dart';

/// Goals screen.
///
/// Shows a list of goals created using GROW + SMART fields.
class GoalsScreen extends ConsumerWidget {
  const GoalsScreen({super.key});

  static const routeName = '/goals';

  void _openCreateGoalSheet(BuildContext context) {
    showModalBottomSheet<Goal>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const CreateGoalSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(goalsStreamProvider);
    final activeRole = ref.watch(activeRoleContextProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('goalsTitle')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('goals_new'),
        onPressed: () => _openCreateGoalSheet(context),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.t('newGoal')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: goalsAsync.when(
          data: (goals) {
            final visibleGoals = activeRole == null
                ? goals
                : goals.where((goal) => goal.roleContextId == activeRole.id || goal.roleContextId == null).toList();
            if (visibleGoals.isEmpty) {
              return const Center(
                child: Text(
                  'No goals yet.\nTap “New goal” to create one using GROW + SMART.',
                  textAlign: TextAlign.center,
                ),
              );
            }
            return ListView.separated(
              itemCount: visibleGoals.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final goal = visibleGoals[index];
                return Dismissible(
                  key: ValueKey(goal.id ?? goal.title),
                  background: Container(
                    color: Colors.red.withValues(alpha: 0.1),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16),
                    child: const Icon(Icons.delete, color: Colors.red),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    if (goal.id != null) {
                      ref.read(coachRepositoryProvider).deleteGoal(goal.id!);
                    }
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            goal.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('Priority: ${goal.priority.storageValue.toUpperCase()}'),
                          Text('Status: ${goal.status.storageValue}'),
                          if (goal.growGoal.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text('G: ${goal.growGoal}'),
                          ],
                          if (goal.growReality.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text('R: ${goal.growReality}'),
                          ],
                          if (goal.growOptions.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text('O: ${goal.growOptions}'),
                          ],
                          if (goal.growWayForward.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text('W: ${goal.growWayForward}'),
                          ],
                          if (goal.smartSpecific.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text('SMART – Specific: ${goal.smartSpecific}'),
                          ],
                          if (goal.smartMeasurable.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text('Measurable: ${goal.smartMeasurable}'),
                          ],
                          if (goal.smartAchievable.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text('Achievable: ${goal.smartAchievable}'),
                          ],
                          if (goal.smartRelevant.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text('Relevant: ${goal.smartRelevant}'),
                          ],
                          if (goal.smartTimeBound.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text('Time-bound: ${goal.smartTimeBound}'),
                          ],
                          if (goal.resources.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text('Resources: ${goal.resources}'),
                          ],
                          if (goal.obstacles.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text('Obstacles: ${goal.obstacles}'),
                          ],
                        ],
                      ),
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

class CreateGoalSheet extends ConsumerStatefulWidget {
  const CreateGoalSheet({super.key});

  @override
  ConsumerState<CreateGoalSheet> createState() => _CreateGoalSheetState();
}

class _CreateGoalSheetState extends ConsumerState<CreateGoalSheet> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _growGoalController = TextEditingController();
  final _growRealityController = TextEditingController();
  final _growOptionsController = TextEditingController();
  final _growWayForwardController = TextEditingController();
  final _smartSpecificController = TextEditingController();
  final _smartMeasurableController = TextEditingController();
  final _smartAchievableController = TextEditingController();
  final _smartRelevantController = TextEditingController();
  final _smartTimeBoundController = TextEditingController();
  final _resourcesController = TextEditingController();
  final _obstaclesController = TextEditingController();

  GoalPriority _priority = GoalPriority.p2;
  GoalStatus _status = GoalStatus.active;
  DateTime? _deadline;

  @override
  void dispose() {
    _titleController.dispose();
    _growGoalController.dispose();
    _growRealityController.dispose();
    _growOptionsController.dispose();
    _growWayForwardController.dispose();
    _smartSpecificController.dispose();
    _smartMeasurableController.dispose();
    _smartAchievableController.dispose();
    _smartRelevantController.dispose();
    _smartTimeBoundController.dispose();
    _resourcesController.dispose();
    _obstaclesController.dispose();
    super.dispose();
  }

  Future<void> _pickDeadline() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _deadline ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        _deadline = picked;
      });
    }
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final roleContext = ref.read(activeRoleContextProvider).value;
    final goal = Goal(
      roleContextId: roleContext?.id,
      title: _titleController.text.trim(),
      priority: _priority,
      status: _status,
      growGoal: _growGoalController.text.trim(),
      growReality: _growRealityController.text.trim(),
      growOptions: _growOptionsController.text.trim(),
      growWayForward: _growWayForwardController.text.trim(),
      smartSpecific: _smartSpecificController.text.trim(),
      smartMeasurable: _smartMeasurableController.text.trim(),
      smartAchievable: _smartAchievableController.text.trim(),
      smartRelevant: _smartRelevantController.text.trim(),
      smartTimeBound: _smartTimeBoundController.text.trim(),
      deadline: _deadline,
      resources: _resourcesController.text.trim(),
      obstacles: _obstaclesController.text.trim(),
      updatedAt: DateTime.now(),
    );

    await ref.read(coachRepositoryProvider).saveGoal(goal);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _runAiSuggestion() async {
    final ai = ref.read(aiServiceProvider);
    final title = _titleController.text.trim();
    if (title.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enter a goal title first.')),
        );
      }
      return;
    }
    final input = [
      'Title: $title',
      if (_growGoalController.text.trim().isNotEmpty)
        'GROW Goal: ${_growGoalController.text.trim()}',
      if (_growRealityController.text.trim().isNotEmpty)
        'Reality: ${_growRealityController.text.trim()}',
      if (_growOptionsController.text.trim().isNotEmpty)
        'Options: ${_growOptionsController.text.trim()}',
      if (_growWayForwardController.text.trim().isNotEmpty)
        'Way Forward: ${_growWayForwardController.text.trim()}',
    ].join('\n');
    final response = await ai.refineGoal(input);
    if (!mounted) {
      return;
    }
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('AI suggestion'),
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
                'New goal (GROW + SMART)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('goal_title'),
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Goal title',
                  hintText: 'Short name for this goal',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: _runAiSuggestion,
                icon: const Icon(Icons.auto_awesome_outlined),
                label: const Text('AI refine goal'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<GoalPriority>(
                initialValue: _priority,
                decoration: const InputDecoration(labelText: 'Priority'),
                items: const [
                  DropdownMenuItem(value: GoalPriority.p0, child: Text('P0')),
                  DropdownMenuItem(value: GoalPriority.p1, child: Text('P1')),
                  DropdownMenuItem(value: GoalPriority.p2, child: Text('P2')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _priority = value);
                  }
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<GoalStatus>(
                initialValue: _status,
                decoration: const InputDecoration(labelText: 'Status'),
                items: const [
                  DropdownMenuItem(value: GoalStatus.active, child: Text('Active')),
                  DropdownMenuItem(value: GoalStatus.paused, child: Text('Paused')),
                  DropdownMenuItem(value: GoalStatus.done, child: Text('Done')),
                  DropdownMenuItem(value: GoalStatus.archived, child: Text('Archived')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _status = value);
                  }
                },
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _pickDeadline,
                icon: const Icon(Icons.calendar_today_outlined),
                label: Text(
                  _deadline == null
                      ? 'Set deadline'
                      : 'Deadline: ${_deadline!.toLocal().toIso8601String().substring(0, 10)}',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'GROW',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _growGoalController,
                decoration: const InputDecoration(
                  labelText: 'G – Goal',
                  hintText: 'What do you want to achieve?',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _growRealityController,
                decoration: const InputDecoration(
                  labelText: 'R – Reality',
                  hintText: 'Where are you now? What is the context?',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _growOptionsController,
                decoration: const InputDecoration(
                  labelText: 'O – Options',
                  hintText: 'What options and strategies do you see?',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _growWayForwardController,
                decoration: const InputDecoration(
                  labelText: 'W – Way Forward',
                  hintText: 'What will you do? When?',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              const Text(
                'SMART',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _smartSpecificController,
                decoration: const InputDecoration(
                  labelText: 'Specific',
                  hintText: 'Make the goal precise and concrete.',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _smartMeasurableController,
                decoration: const InputDecoration(
                  labelText: 'Measurable',
                  hintText: 'How will you measure success?',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _smartAchievableController,
                decoration: const InputDecoration(
                  labelText: 'Achievable',
                  hintText: 'Is it realistic but challenging?',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _smartRelevantController,
                decoration: const InputDecoration(
                  labelText: 'Relevant',
                  hintText: 'How does it connect to your North Star / KPIs?',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _smartTimeBoundController,
                decoration: const InputDecoration(
                  labelText: 'Time-bound',
                  hintText: 'What is the deadline or time frame?',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              const Text(
                'Resources & Obstacles',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _resourcesController,
                decoration: const InputDecoration(
                  labelText: 'Resources',
                  hintText: 'What resources do you have or need?',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _obstaclesController,
                decoration: const InputDecoration(
                  labelText: 'Obstacles',
                  hintText: 'What can get in the way?',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 20),
              FilledButton(
                key: const Key('goal_save'),
                onPressed: _handleSave,
                child: Text(context.l10n.t('saveGoal')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

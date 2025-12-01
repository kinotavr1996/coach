import 'package:flutter/material.dart';

/// Goals screen.
///
/// Shows a simple in-memory list of goals created using GROW + SMART fields.
class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  static const routeName = '/goals';

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<GoalData> _goals = [];

  void _openCreateGoalSheet() {
    showModalBottomSheet<GoalData>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CreateGoalSheet(
          onSave: (goal) {
            setState(() {
              _goals.add(goal);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goals – GROW & SMART'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openCreateGoalSheet,
        icon: const Icon(Icons.add),
        label: const Text('New goal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: _goals.isEmpty
            ? const Center(
                child: Text(
                  'No goals yet.\nTap “New goal” to create one using GROW + SMART.',
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.separated(
                itemCount: _goals.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final goal = _goals[index];
                  return Card(
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
                          if (goal.growGoal.isNotEmpty) ...[
                            const SizedBox(height: 4),
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
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class CreateGoalSheet extends StatefulWidget {
  const CreateGoalSheet({super.key, required this.onSave});

  final void Function(GoalData goal) onSave;

  @override
  State<CreateGoalSheet> createState() => _CreateGoalSheetState();
}

class _CreateGoalSheetState extends State<CreateGoalSheet> {
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
    super.dispose();
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final goal = GoalData(
      title: _titleController.text.trim(),
      growGoal: _growGoalController.text.trim(),
      growReality: _growRealityController.text.trim(),
      growOptions: _growOptionsController.text.trim(),
      growWayForward: _growWayForwardController.text.trim(),
      smartSpecific: _smartSpecificController.text.trim(),
      smartMeasurable: _smartMeasurableController.text.trim(),
      smartAchievable: _smartAchievableController.text.trim(),
      smartRelevant: _smartRelevantController.text.trim(),
      smartTimeBound: _smartTimeBoundController.text.trim(),
    );

    widget.onSave(goal);
    Navigator.of(context).pop();
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
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _handleSave,
                child: const Text('Save goal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoalData {
  GoalData({
    required this.title,
    required this.growGoal,
    required this.growReality,
    required this.growOptions,
    required this.growWayForward,
    required this.smartSpecific,
    required this.smartMeasurable,
    required this.smartAchievable,
    required this.smartRelevant,
    required this.smartTimeBound,
  });

  final String title;
  final String growGoal;
  final String growReality;
  final String growOptions;
  final String growWayForward;
  final String smartSpecific;
  final String smartMeasurable;
  final String smartAchievable;
  final String smartRelevant;
  final String smartTimeBound;
}


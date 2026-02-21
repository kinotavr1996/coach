import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/reminder.dart';
import '../../shared/localization/app_localizations.dart';

class RemindersScreen extends ConsumerStatefulWidget {
  const RemindersScreen({super.key});

  static const routeName = '/reminders';

  @override
  ConsumerState<RemindersScreen> createState() => _RemindersScreenState();
}

class _RemindersScreenState extends ConsumerState<RemindersScreen> {
  bool _requestedPermissions = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_requestedPermissions) {
      _requestedPermissions = true;
      ref.read(notificationServiceProvider).requestPermissions();
    }
  }

  void _openCreateReminderSheet(BuildContext context) {
    showModalBottomSheet<Reminder>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const CreateReminderSheet(),
      ),
    );
  }

  Future<void> _toggleReminder(Reminder reminder, bool enabled) async {
    final repo = ref.read(coachRepositoryProvider);
    final updated = reminder.copyWith(isEnabled: enabled, updatedAt: DateTime.now());
    final id = await repo.saveReminder(updated);
    final notifier = ref.read(notificationServiceProvider);
    if (enabled) {
      await notifier.scheduleReminder(id, updated);
    } else {
      await notifier.cancel(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final remindersAsync = ref.watch(remindersStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('remindersTitle')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('reminders_new'),
        onPressed: () => _openCreateReminderSheet(context),
        icon: const Icon(Icons.add_alert_outlined),
        label: Text(context.l10n.t('newReminder')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: remindersAsync.when(
          data: (reminders) {
            if (reminders.isEmpty) {
              return const Center(
                child: Text('No reminders yet. Tap “New reminder” to add one.'),
              );
            }
            return ListView.separated(
              itemCount: reminders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final reminder = reminders[index];
                final time = _formatTime(reminder.hour, reminder.minute);
                final cadence = reminder.cadence == ReminderCadence.daily
                    ? 'Daily'
                    : 'Weekly (${_weekdayLabel(reminder.weekday)})';
                return Card(
                  child: ListTile(
                    title: Text(reminder.title),
                    subtitle: Text('$cadence • $time'),
                    trailing: Switch(
                      value: reminder.isEnabled,
                      onChanged: (value) => _toggleReminder(reminder, value),
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

  String _formatTime(int hour, int minute) {
    final paddedMinute = minute.toString().padLeft(2, '0');
    return '$hour:$paddedMinute';
  }

  String _weekdayLabel(int? weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return 'Mon';
    }
  }
}

class CreateReminderSheet extends ConsumerStatefulWidget {
  const CreateReminderSheet({super.key});

  @override
  ConsumerState<CreateReminderSheet> createState() => _CreateReminderSheetState();
}

class _CreateReminderSheetState extends ConsumerState<CreateReminderSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  ReminderCadence _cadence = ReminderCadence.daily;
  int _weekday = DateTime.monday;
  TimeOfDay _time = const TimeOfDay(hour: 9, minute: 0);

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null) {
      setState(() => _time = picked);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final reminder = Reminder(
      title: _titleController.text.trim(),
      body: _bodyController.text.trim(),
      cadence: _cadence,
      hour: _time.hour,
      minute: _time.minute,
      weekday: _cadence == ReminderCadence.weekly ? _weekday : null,
      isEnabled: true,
      updatedAt: DateTime.now(),
    );

    final repo = ref.read(coachRepositoryProvider);
    final id = await repo.saveReminder(reminder);
    await ref.read(notificationServiceProvider).scheduleReminder(id, reminder);

    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reminder scheduled.')),
      );
    }
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
                'New reminder',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Weekly check-in reminder',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter a reminder title.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  hintText: 'Open the app and log progress.',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<ReminderCadence>(
                initialValue: _cadence,
                decoration: const InputDecoration(labelText: 'Cadence'),
                items: const [
                  DropdownMenuItem(value: ReminderCadence.daily, child: Text('Daily')),
                  DropdownMenuItem(value: ReminderCadence.weekly, child: Text('Weekly')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _cadence = value);
                  }
                },
              ),
              if (_cadence == ReminderCadence.weekly) ...[
                const SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  initialValue: _weekday,
                  decoration: const InputDecoration(labelText: 'Weekday'),
                  items: const [
                    DropdownMenuItem(value: DateTime.monday, child: Text('Monday')),
                    DropdownMenuItem(value: DateTime.tuesday, child: Text('Tuesday')),
                    DropdownMenuItem(value: DateTime.wednesday, child: Text('Wednesday')),
                    DropdownMenuItem(value: DateTime.thursday, child: Text('Thursday')),
                    DropdownMenuItem(value: DateTime.friday, child: Text('Friday')),
                    DropdownMenuItem(value: DateTime.saturday, child: Text('Saturday')),
                    DropdownMenuItem(value: DateTime.sunday, child: Text('Sunday')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _weekday = value);
                    }
                  },
                ),
              ],
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _pickTime,
                icon: const Icon(Icons.schedule),
                label: Text('Time: ${_time.format(context)}'),
              ),
              const SizedBox(height: 20),
              FilledButton(
                key: const Key('reminder_save'),
                onPressed: _save,
                child: Text(context.l10n.t('saveReminder')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

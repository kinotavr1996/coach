import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../shared/localization/app_localizations.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  static const routeName = '/calendar';

  Future<void> _exportCalendar(BuildContext context, WidgetRef ref) async {
    final goals = ref.read(goalsStreamProvider).value ?? [];
    final path = await ref.read(calendarServiceProvider).exportGoalsToIcs(goals);
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Calendar file saved: $path')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('calendarTitle')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Export deadlines to calendar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'This creates an .ics file with all goal deadlines. Import it into your calendar app.',
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => _exportCalendar(context, ref),
              child: const Text('Export .ics file'),
            ),
          ],
        ),
      ),
    );
  }
}

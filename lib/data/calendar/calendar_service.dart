import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/models/goal.dart';

class CalendarService {
  Future<String> exportGoalsToIcs(List<Goal> goals) async {
    final buffer = StringBuffer();
    buffer.writeln('BEGIN:VCALENDAR');
    buffer.writeln('VERSION:2.0');
    buffer.writeln('PRODID:-//ClarityCoach//EN');

    for (final goal in goals.where((g) => g.deadline != null)) {
      final date = _formatDate(goal.deadline!);
      buffer.writeln('BEGIN:VEVENT');
      buffer.writeln('UID:goal-${goal.id ?? goal.title.hashCode}@claritycoach');
      buffer.writeln('DTSTAMP:${_formatDateTime(DateTime.now().toUtc())}');
      buffer.writeln('DTSTART;VALUE=DATE:$date');
      buffer.writeln('SUMMARY:${_escape(goal.title)}');
      buffer.writeln('END:VEVENT');
    }

    buffer.writeln('END:VCALENDAR');

    final documentsDir = await getApplicationDocumentsDirectory();
    final fileName = 'clarity_coach_goals_${DateTime.now().toIso8601String().substring(0, 10)}.ics';
    final file = File(p.join(documentsDir.path, fileName));
    await file.writeAsString(buffer.toString());
    return file.path;
  }

  String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year$month$day';
  }

  String _formatDateTime(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');
    final second = date.second.toString().padLeft(2, '0');
    final buffer = StringBuffer()
      ..write(year)
      ..write(month)
      ..write(day)
      ..write('T')
      ..write(hour)
      ..write(minute)
      ..write(second)
      ..write('Z');
    return buffer.toString();
  }

  String _escape(String input) {
    return input.replaceAll(',', '\\,').replaceAll(';', '\\;');
  }
}

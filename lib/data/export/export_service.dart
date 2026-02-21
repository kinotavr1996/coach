import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/models/check_in.dart';
import '../../domain/models/goal.dart';
import '../../domain/models/north_star.dart';
import '../../domain/models/profile.dart';

class ExportService {
  Future<String> exportSummary({
    required Profile? profile,
    required NorthStar? northStar,
    required List<Goal> goals,
    required List<CheckIn> checkIns,
  }) async {
    final buffer = StringBuffer();
    buffer.writeln('# ClarityCoach Summary');
    buffer.writeln('');

    if (profile != null) {
      buffer.writeln('## Profile');
      buffer.writeln('- Role: ${profile.role}');
      if (profile.vision.isNotEmpty) {
        buffer.writeln('- Vision: ${profile.vision}');
      }
      if (profile.responsibility.isNotEmpty) {
        buffer.writeln('- Responsibility: ${profile.responsibility}');
      }
      if (profile.kpis.isNotEmpty) {
        buffer.writeln('- KPIs: ${profile.kpis}');
      }
      buffer.writeln('');
    }

    if (northStar != null) {
      buffer.writeln('## North Star');
      buffer.writeln('- Title: ${northStar.title}');
      if (northStar.description.isNotEmpty) {
        buffer.writeln('- Description: ${northStar.description}');
      }
      if (northStar.keyword.isNotEmpty) {
        buffer.writeln('- Keyword: ${northStar.keyword}');
      }
      buffer.writeln('');
    }

    buffer.writeln('## Goals');
    if (goals.isEmpty) {
      buffer.writeln('- No goals yet.');
    } else {
      for (final goal in goals) {
        buffer.writeln('- ${goal.title} (${goal.status.storageValue})');
      }
    }
    buffer.writeln('');

    buffer.writeln('## Check-ins');
    if (checkIns.isEmpty) {
      buffer.writeln('- No check-ins yet.');
    } else {
      for (final checkIn in checkIns) {
        buffer.writeln(
          '- ${checkIn.cadence.storageValue.toUpperCase()} ${checkIn.date.toLocal().toIso8601String().substring(0, 10)} • ${checkIn.progressPercent}%',
        );
      }
    }

    final documentsDir = await getApplicationDocumentsDirectory();
    final fileName = 'clarity_coach_export_${DateTime.now().toIso8601String().substring(0, 10)}.md';
    final file = File(p.join(documentsDir.path, fileName));
    await file.writeAsString(buffer.toString());
    return file.path;
  }
}

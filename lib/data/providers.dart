import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/activity_log.dart' as domain;
import '../domain/models/check_in.dart' as domain;
import '../domain/models/export_report.dart' as domain;
import '../domain/models/goal.dart' as domain;
import '../domain/models/north_star.dart' as domain;
import '../domain/models/partner_account.dart' as domain;
import '../domain/models/profile.dart' as domain;
import '../domain/models/reminder.dart' as domain;
import '../domain/models/role_context.dart' as domain;
import '../domain/models/template.dart' as domain;
import 'ai/ai_service.dart';
import 'local/app_database.dart';
import 'notifications/notification_service.dart';
import 'export/export_service.dart';
import 'calendar/calendar_service.dart';
import 'audio/background_music_service.dart';
import 'repositories/coach_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final coachRepositoryProvider = Provider<CoachRepository>((ref) {
  return CoachRepository(ref.watch(appDatabaseProvider));
});

final profileStreamProvider = StreamProvider<domain.Profile?>((ref) {
  return ref.watch(coachRepositoryProvider).watchProfile();
});

final northStarStreamProvider = StreamProvider<domain.NorthStar?>((ref) {
  return ref.watch(coachRepositoryProvider).watchNorthStar();
});

final goalsStreamProvider = StreamProvider<List<domain.Goal>>((ref) {
  return ref.watch(coachRepositoryProvider).watchGoals();
});

final roleContextsStreamProvider = StreamProvider<List<domain.RoleContext>>((ref) {
  return ref.watch(coachRepositoryProvider).watchRoleContexts();
});

final activeRoleContextProvider = StreamProvider<domain.RoleContext?>((ref) {
  return ref.watch(coachRepositoryProvider).watchActiveRoleContext();
});

final checkInsStreamProvider = StreamProvider<List<domain.CheckIn>>((ref) {
  return ref.watch(coachRepositoryProvider).watchCheckIns();
});

final remindersStreamProvider = StreamProvider<List<domain.Reminder>>((ref) {
  return ref.watch(coachRepositoryProvider).watchReminders();
});

final activityLogsStreamProvider = StreamProvider<List<domain.ActivityLog>>((ref) {
  return ref.watch(coachRepositoryProvider).watchActivityLogs();
});

final partnerAccountsStreamProvider = StreamProvider<List<domain.PartnerAccount>>((ref) {
  return ref.watch(coachRepositoryProvider).watchPartnerAccounts();
});

final templatesStreamProvider = StreamProvider<List<domain.Template>>((ref) {
  return ref.watch(coachRepositoryProvider).watchTemplates();
});

final exportReportsStreamProvider = StreamProvider<List<domain.ExportReport>>((ref) {
  return ref.watch(coachRepositoryProvider).watchExportReports();
});

final aiServiceProvider = Provider<AiService>((ref) {
  const apiKey = String.fromEnvironment('GEMINI_API_KEY');
  return GeminiAiService(apiKey: apiKey);
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService.instance;
});

final exportServiceProvider = Provider<ExportService>((ref) {
  return ExportService();
});

final calendarServiceProvider = Provider<CalendarService>((ref) {
  return CalendarService();
});

final backgroundMusicProvider = Provider<BackgroundMusicService>((ref) {
  final service = BackgroundMusicService();
  ref.onDispose(service.dispose);
  return service;
});

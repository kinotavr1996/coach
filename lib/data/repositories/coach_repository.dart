import 'package:drift/drift.dart';

import '../../domain/models/activity_log.dart' as domain;
import '../../domain/models/check_in.dart' as domain;
import '../../domain/models/export_report.dart' as domain;
import '../../domain/models/goal.dart' as domain;
import '../../domain/models/north_star.dart' as domain;
import '../../domain/models/partner_account.dart' as domain;
import '../../domain/models/profile.dart' as domain;
import '../../domain/models/reminder.dart' as domain;
import '../../domain/models/role_context.dart' as domain;
import '../../domain/models/template.dart' as domain;
import '../local/app_database.dart' as db;

class CoachRepository {
  CoachRepository(this._db);

  final db.AppDatabase _db;

  Stream<domain.Profile?> watchProfile() {
    final query = (_db.select(_db.profiles)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.updatedAt, mode: OrderingMode.desc),
          ])
          ..limit(1))
        .watchSingleOrNull();
    return query.map(_profileFromRow);
  }

  Future<int> saveProfile(domain.Profile profile) async {
    final now = DateTime.now();
    final companion = db.ProfilesCompanion(
      id: profile.id == null ? const Value.absent() : Value(profile.id!),
      role: Value(profile.role),
      scope: Value(profile.scope),
      vision: Value(profile.vision),
      responsibility: Value(profile.responsibility),
      mission: Value(profile.mission),
      kpis: Value(profile.kpis),
      stakeholders: Value(profile.stakeholders),
      values: Value(profile.values),
      updatedAt: Value(now),
    );
    if (profile.id == null) {
      final id = await _db.into(_db.profiles).insert(companion);
      final existingRoles = await _db.select(_db.roleContexts).get();
      if (existingRoles.isEmpty) {
        final roleCompanion = db.RoleContextsCompanion(
          profileId: Value(id),
          name: Value(profile.role),
          description: Value(profile.scope),
          isActive: const Value(true),
          updatedAt: Value(now),
        );
        await _db.into(_db.roleContexts).insert(roleCompanion);
      }
      await addActivityLog('profile_created', 'profile', id);
      return id;
    }
    await _db.into(_db.profiles).insertOnConflictUpdate(companion);
    await addActivityLog('profile_saved', 'profile', profile.id);
    return profile.id!;
  }

  Stream<domain.NorthStar?> watchNorthStar() {
    final query = (_db.select(_db.northStars)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.updatedAt, mode: OrderingMode.desc),
          ])
          ..limit(1))
        .watchSingleOrNull();
    return query.map(_northStarFromRow);
  }

  Future<void> saveNorthStar(domain.NorthStar northStar) async {
    final now = DateTime.now();
    final companion = db.NorthStarsCompanion(
      id: northStar.id == null ? const Value.absent() : Value(northStar.id!),
      roleContextId: Value(northStar.roleContextId),
      title: Value(northStar.title),
      description: Value(northStar.description),
      horizon: Value(northStar.horizon.storageValue),
      keyword: Value(northStar.keyword),
      emotion: Value(northStar.emotion),
      imagePath: Value(northStar.imagePath),
      updatedAt: Value(now),
    );
    await _db.into(_db.northStars).insertOnConflictUpdate(companion);
    await addActivityLog('north_star_saved', 'north_star', northStar.id);
  }

  Stream<List<domain.Goal>> watchGoals() {
    return _db.select(_db.goals).watch().map(
          (rows) => rows.map(_goalFromRow).toList(),
        );
  }

  Stream<List<domain.RoleContext>> watchRoleContexts() {
    return _db.select(_db.roleContexts).watch().map(
          (rows) => rows.map(_roleContextFromRow).toList(),
        );
  }

  Stream<domain.RoleContext?> watchActiveRoleContext() {
    final query = (_db.select(_db.roleContexts)
          ..where((tbl) => tbl.isActive.equals(true))
          ..limit(1))
        .watchSingleOrNull();
    return query.map(_roleContextFromRowNullable);
  }

  Future<int> saveRoleContext(domain.RoleContext context) async {
    final now = DateTime.now();
    final companion = db.RoleContextsCompanion(
      id: context.id == null ? const Value.absent() : Value(context.id!),
      profileId: Value(context.profileId),
      name: Value(context.name),
      description: Value(context.description),
      isActive: Value(context.isActive),
      updatedAt: Value(now),
    );
    if (context.id == null) {
      final id = await _db.into(_db.roleContexts).insert(companion);
      await addActivityLog('role_context_created', 'role_context', id);
      return id;
    }
    await _db.into(_db.roleContexts).insertOnConflictUpdate(companion);
    await addActivityLog('role_context_updated', 'role_context', context.id);
    return context.id!;
  }

  Future<void> setActiveRoleContext(int id) async {
    await _db.transaction(() async {
      await (_db.update(_db.roleContexts)..where((tbl) => tbl.isActive.equals(true)))
          .write(const db.RoleContextsCompanion(isActive: Value(false)));
      await (_db.update(_db.roleContexts)..where((tbl) => tbl.id.equals(id)))
          .write(const db.RoleContextsCompanion(isActive: Value(true)));
    });
    await addActivityLog('role_context_activated', 'role_context', id);
  }

  Future<void> saveGoal(domain.Goal goal) async {
    final now = DateTime.now();
    final companion = db.GoalsCompanion(
      id: goal.id == null ? const Value.absent() : Value(goal.id!),
      roleContextId: Value(goal.roleContextId),
      northStarId: Value(goal.northStarId),
      title: Value(goal.title),
      priority: Value(goal.priority.storageValue),
      status: Value(goal.status.storageValue),
      growGoal: Value(goal.growGoal),
      growReality: Value(goal.growReality),
      growOptions: Value(goal.growOptions),
      growWayForward: Value(goal.growWayForward),
      smartSpecific: Value(goal.smartSpecific),
      smartMeasurable: Value(goal.smartMeasurable),
      smartAchievable: Value(goal.smartAchievable),
      smartRelevant: Value(goal.smartRelevant),
      smartTimeBound: Value(goal.smartTimeBound),
      deadline: Value(goal.deadline),
      resources: Value(goal.resources),
      obstacles: Value(goal.obstacles),
      updatedAt: Value(now),
    );
    await _db.into(_db.goals).insertOnConflictUpdate(companion);
    await addActivityLog('goal_saved', 'goal', goal.id);
  }

  Future<void> deleteGoal(int id) async {
    await (_db.delete(_db.goals)..where((tbl) => tbl.id.equals(id))).go();
    await addActivityLog('goal_deleted', 'goal', id);
  }

  Stream<List<domain.CheckIn>> watchCheckIns() {
    return _db.select(_db.checkIns).watch().map(
          (rows) => rows.map(_checkInFromRow).toList(),
        );
  }

  Future<void> saveCheckIn(domain.CheckIn checkIn) async {
    final now = DateTime.now();
    final companion = db.CheckInsCompanion(
      id: checkIn.id == null ? const Value.absent() : Value(checkIn.id!),
      roleContextId: Value(checkIn.roleContextId),
      cadence: Value(checkIn.cadence.storageValue),
      date: Value(checkIn.date),
      progressPercent: Value(checkIn.progressPercent),
      blockers: Value(checkIn.blockers),
      lessons: Value(checkIn.lessons),
      updatedAt: Value(now),
    );
    await _db.into(_db.checkIns).insertOnConflictUpdate(companion);
    await addActivityLog('checkin_saved', 'checkin', checkIn.id);
  }

  Stream<List<domain.Reminder>> watchReminders() {
    return _db.select(_db.reminders).watch().map(
          (rows) => rows.map(_reminderFromRow).toList(),
        );
  }

  Future<int> saveReminder(domain.Reminder reminder) async {
    final now = DateTime.now();
    final companion = db.RemindersCompanion(
      id: reminder.id == null ? const Value.absent() : Value(reminder.id!),
      title: Value(reminder.title),
      body: Value(reminder.body),
      cadence: Value(reminder.cadence.storageValue),
      hour: Value(reminder.hour),
      minute: Value(reminder.minute),
      weekday: Value(reminder.weekday),
      channel: const Value('local'),
      isEnabled: Value(reminder.isEnabled),
      updatedAt: Value(now),
    );
    if (reminder.id == null) {
      final id = await _db.into(_db.reminders).insert(companion);
      await addActivityLog('reminder_created', 'reminder', id);
      return id;
    }
    await _db.into(_db.reminders).insertOnConflictUpdate(companion);
    await addActivityLog('reminder_updated', 'reminder', reminder.id);
    return reminder.id!;
  }

  Future<void> deleteReminder(int id) async {
    await (_db.delete(_db.reminders)..where((tbl) => tbl.id.equals(id))).go();
    await addActivityLog('reminder_deleted', 'reminder', id);
  }

  Stream<List<domain.ActivityLog>> watchActivityLogs() {
    final query = (_db.select(_db.activityLogs)
          ..orderBy([
            (tbl) => OrderingTerm(expression: tbl.createdAt, mode: OrderingMode.desc),
          ]))
        .watch();
    return query.map((rows) => rows.map(_activityLogFromRow).toList());
  }

  Future<void> addActivityLog(String actionType, String entityType, int? entityId) async {
    final companion = db.ActivityLogsCompanion(
      actionType: Value(actionType),
      entityType: Value(entityType),
      entityId: Value(entityId),
      status: const Value('ok'),
      createdAt: Value(DateTime.now()),
    );
    await _db.into(_db.activityLogs).insert(companion);
  }

  Stream<List<domain.PartnerAccount>> watchPartnerAccounts() {
    return _db.select(_db.partnerAccounts).watch().map(
          (rows) => rows.map(_partnerFromRow).toList(),
        );
  }

  Future<int> savePartnerAccount(domain.PartnerAccount account) async {
    final now = DateTime.now();
    final companion = db.PartnerAccountsCompanion(
      id: account.id == null ? const Value.absent() : Value(account.id!),
      email: Value(account.email),
      accessLevel: Value(account.accessLevel),
      reportSchedule: Value(account.reportSchedule),
      isEnabled: Value(account.isEnabled),
      createdAt: Value(account.createdAt),
      updatedAt: Value(now),
    );
    if (account.id == null) {
      final id = await _db.into(_db.partnerAccounts).insert(companion);
      await addActivityLog('partner_added', 'partner', id);
      return id;
    }
    await _db.into(_db.partnerAccounts).insertOnConflictUpdate(companion);
    await addActivityLog('partner_updated', 'partner', account.id);
    return account.id!;
  }

  Future<void> deletePartnerAccount(int id) async {
    await (_db.delete(_db.partnerAccounts)..where((tbl) => tbl.id.equals(id))).go();
    await addActivityLog('partner_deleted', 'partner', id);
  }

  Stream<List<domain.Template>> watchTemplates() {
    return _db.select(_db.templates).watch().map(
          (rows) => rows.map(_templateFromRow).toList(),
        );
  }

  Future<void> seedTemplatesIfNeeded() async {
    final existing = await _db.select(_db.templates).get();
    if (existing.isNotEmpty) {
      return;
    }
    final defaults = <db.TemplatesCompanion>[
      const db.TemplatesCompanion(
        type: Value('role'),
        title: Value('Founder / CEO'),
        content: Value('Vision: Scale a profitable company. KPIs: MRR growth, NPS. Values: clarity, focus.'),
        tags: Value('role,executive'),
      ),
      const db.TemplatesCompanion(
        type: Value('goal'),
        title: Value('Improve Sales Pipeline'),
        content: Value('SMART: Increase qualified leads by 20% in 90 days.'),
        tags: Value('goal,sales'),
      ),
      const db.TemplatesCompanion(
        type: Value('goal'),
        title: Value('Build Self-Managing Team'),
        content: Value('SMART: Document 5 core processes and delegate ownership by end of quarter.'),
        tags: Value('goal,team'),
      ),
    ];
    await _db.batch((batch) {
      batch.insertAll(_db.templates, defaults);
    });
    await addActivityLog('templates_seeded', 'template', null);
  }

  Stream<List<domain.ExportReport>> watchExportReports() {
    return _db.select(_db.exportReports).watch().map(
          (rows) => rows.map(_exportReportFromRow).toList(),
        );
  }

  Future<int> saveExportReport(domain.ExportReport report) async {
    final companion = db.ExportReportsCompanion(
      id: report.id == null ? const Value.absent() : Value(report.id!),
      period: Value(report.period),
      format: Value(report.format),
      filePath: Value(report.filePath),
      createdAt: Value(report.createdAt),
    );
    if (report.id == null) {
      return _db.into(_db.exportReports).insert(companion);
    }
    await _db.into(_db.exportReports).insertOnConflictUpdate(companion);
    return report.id!;
  }

  domain.Profile? _profileFromRow(db.Profile? row) {
    if (row == null) {
      return null;
    }
    return domain.Profile(
      id: row.id,
      role: row.role,
      scope: row.scope,
      vision: row.vision,
      responsibility: row.responsibility,
      mission: row.mission,
      kpis: row.kpis,
      stakeholders: row.stakeholders,
      values: row.values,
      updatedAt: row.updatedAt,
    );
  }

  domain.NorthStar? _northStarFromRow(db.NorthStar? row) {
    if (row == null) {
      return null;
    }
    return domain.NorthStar(
      id: row.id,
      roleContextId: row.roleContextId,
      title: row.title,
      description: row.description,
      horizon: domain.NorthStarHorizonX.fromStorage(row.horizon),
      keyword: row.keyword,
      emotion: row.emotion,
      imagePath: row.imagePath,
      updatedAt: row.updatedAt,
    );
  }

  domain.Goal _goalFromRow(db.Goal row) {
    return domain.Goal(
      id: row.id,
      roleContextId: row.roleContextId,
      northStarId: row.northStarId,
      title: row.title,
      priority: domain.GoalPriorityX.fromStorage(row.priority),
      status: domain.GoalStatusX.fromStorage(row.status),
      growGoal: row.growGoal,
      growReality: row.growReality,
      growOptions: row.growOptions,
      growWayForward: row.growWayForward,
      smartSpecific: row.smartSpecific,
      smartMeasurable: row.smartMeasurable,
      smartAchievable: row.smartAchievable,
      smartRelevant: row.smartRelevant,
      smartTimeBound: row.smartTimeBound,
      deadline: row.deadline,
      resources: row.resources,
      obstacles: row.obstacles,
      updatedAt: row.updatedAt,
    );
  }

  domain.CheckIn _checkInFromRow(db.CheckIn row) {
    return domain.CheckIn(
      id: row.id,
      roleContextId: row.roleContextId,
      cadence: domain.CheckInCadenceX.fromStorage(row.cadence),
      date: row.date,
      progressPercent: row.progressPercent,
      blockers: row.blockers,
      lessons: row.lessons,
      updatedAt: row.updatedAt,
    );
  }

  domain.Reminder _reminderFromRow(db.Reminder row) {
    return domain.Reminder(
      id: row.id,
      title: row.title,
      body: row.body,
      cadence: domain.ReminderCadenceX.fromStorage(row.cadence),
      hour: row.hour,
      minute: row.minute,
      weekday: row.weekday,
      isEnabled: row.isEnabled,
      updatedAt: row.updatedAt,
    );
  }

  domain.RoleContext _roleContextFromRow(db.RoleContext row) {
    return domain.RoleContext(
      id: row.id,
      profileId: row.profileId,
      name: row.name,
      description: row.description,
      isActive: row.isActive,
      updatedAt: row.updatedAt,
    );
  }

  domain.RoleContext? _roleContextFromRowNullable(db.RoleContext? row) {
    if (row == null) {
      return null;
    }
    return _roleContextFromRow(row);
  }

  domain.ActivityLog _activityLogFromRow(db.ActivityLog row) {
    return domain.ActivityLog(
      id: row.id,
      actionType: row.actionType,
      entityType: row.entityType,
      entityId: row.entityId,
      status: row.status,
      createdAt: row.createdAt,
    );
  }

  domain.PartnerAccount _partnerFromRow(db.PartnerAccount row) {
    return domain.PartnerAccount(
      id: row.id,
      email: row.email,
      accessLevel: row.accessLevel,
      reportSchedule: row.reportSchedule,
      isEnabled: row.isEnabled,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  domain.Template _templateFromRow(db.Template row) {
    return domain.Template(
      id: row.id,
      type: row.type,
      title: row.title,
      content: row.content,
      tags: row.tags,
    );
  }

  domain.ExportReport _exportReportFromRow(db.ExportReport row) {
    return domain.ExportReport(
      id: row.id,
      period: row.period,
      format: row.format,
      filePath: row.filePath,
      createdAt: row.createdAt,
    );
  }
}

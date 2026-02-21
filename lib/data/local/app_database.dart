import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get role => text()();
  TextColumn get scope => text().withDefault(const Constant(''))();
  TextColumn get vision => text().withDefault(const Constant(''))();
  TextColumn get responsibility => text().withDefault(const Constant(''))();
  TextColumn get mission => text().withDefault(const Constant(''))();
  TextColumn get kpis => text().withDefault(const Constant(''))();
  TextColumn get stakeholders => text().withDefault(const Constant(''))();
  TextColumn get values => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime()();
}

class RoleContexts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get profileId => integer().references(Profiles, #id)();
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get updatedAt => dateTime()();
}

class NorthStars extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get roleContextId => integer().nullable().references(RoleContexts, #id)();
  TextColumn get title => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get horizon => text().withDefault(const Constant('year'))();
  TextColumn get keyword => text().withDefault(const Constant(''))();
  TextColumn get emotion => text().withDefault(const Constant(''))();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();
}

class Goals extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get roleContextId => integer().nullable().references(RoleContexts, #id)();
  IntColumn get northStarId => integer().nullable().references(NorthStars, #id)();
  TextColumn get title => text()();
  TextColumn get priority => text().withDefault(const Constant('p2'))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  TextColumn get growGoal => text().withDefault(const Constant(''))();
  TextColumn get growReality => text().withDefault(const Constant(''))();
  TextColumn get growOptions => text().withDefault(const Constant(''))();
  TextColumn get growWayForward => text().withDefault(const Constant(''))();
  TextColumn get smartSpecific => text().withDefault(const Constant(''))();
  TextColumn get smartMeasurable => text().withDefault(const Constant(''))();
  TextColumn get smartAchievable => text().withDefault(const Constant(''))();
  TextColumn get smartRelevant => text().withDefault(const Constant(''))();
  TextColumn get smartTimeBound => text().withDefault(const Constant(''))();
  DateTimeColumn get deadline => dateTime().nullable()();
  TextColumn get resources => text().withDefault(const Constant(''))();
  TextColumn get obstacles => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime()();
}

class ActionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get goalId => integer().references(Goals, #id)();
  TextColumn get title => text()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get status => text().withDefault(const Constant('todo'))();
  TextColumn get blockers => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime()();
}

class CheckIns extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get roleContextId => integer().nullable().references(RoleContexts, #id)();
  TextColumn get cadence => text().withDefault(const Constant('weekly'))();
  DateTimeColumn get date => dateTime()();
  IntColumn get progressPercent => integer().withDefault(const Constant(0))();
  TextColumn get blockers => text().withDefault(const Constant(''))();
  TextColumn get lessons => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime()();
}

class Reminders extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get body => text().withDefault(const Constant(''))();
  TextColumn get cadence => text().withDefault(const Constant('daily'))();
  IntColumn get hour => integer().withDefault(const Constant(9))();
  IntColumn get minute => integer().withDefault(const Constant(0))();
  IntColumn get weekday => integer().nullable()();
  TextColumn get channel => text().withDefault(const Constant('local'))();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get updatedAt => dateTime()();
}

class PartnerAccounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text()();
  TextColumn get accessLevel => text().withDefault(const Constant('read'))();
  TextColumn get reportSchedule => text().withDefault(const Constant('weekly'))();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

class ActivityLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get actionType => text()();
  TextColumn get entityType => text().withDefault(const Constant(''))();
  IntColumn get entityId => integer().nullable()();
  TextColumn get status => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime()();
}

class Templates extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get tags => text().withDefault(const Constant(''))();
}

class ExportReports extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get period => text()();
  TextColumn get format => text().withDefault(const Constant('pdf'))();
  TextColumn get filePath => text()();
  DateTimeColumn get createdAt => dateTime()();
}

@DriftDatabase(
  tables: [
    Profiles,
    RoleContexts,
    NorthStars,
    Goals,
    ActionItems,
    CheckIns,
    Reminders,
    PartnerAccounts,
    ActivityLogs,
    Templates,
    ExportReports,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from < 2) {
            await migrator.deleteTable('reminders');
            await migrator.createTable(reminders);
            await migrator.createTable(partnerAccounts);
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(documentsDir.path, 'clarity_coach.sqlite'));
    return NativeDatabase(file);
  });
}

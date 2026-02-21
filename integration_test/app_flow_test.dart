import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:coach_app/main.dart' as app;

void main() {
  final binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;

  Future<void> resetDatabase() async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(documentsDir.path, 'clarity_coach.sqlite'));
    if (await dbFile.exists()) {
      await dbFile.delete();
    }
  }

  Future<void> startApp(WidgetTester tester) async {
    binding.window.physicalSizeTestValue = const Size(1800, 3000);
    binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(() {
      binding.window.clearPhysicalSizeTestValue();
      binding.window.clearDevicePixelRatioTestValue();
    });
    await resetDatabase();
    app.main();
    await tester.pump(const Duration(seconds: 1));
  }

  Future<void> waitFor(WidgetTester tester, Finder finder) async {
    final deadline = DateTime.now().add(const Duration(seconds: 3));
    while (finder.evaluate().isEmpty) {
      if (DateTime.now().isAfter(deadline)) {
        throw TestFailure('Timed out waiting for ${finder.description}.');
      }
      await tester.pump(const Duration(milliseconds: 200));
    }
  }

  Future<void> waitForExportedFile(String prefix, String extension) async {
    final deadline = DateTime.now().add(const Duration(seconds: 4));
    while (DateTime.now().isBefore(deadline)) {
      final documentsDir = await getApplicationDocumentsDirectory();
      final files = documentsDir.listSync().whereType<File>().map(
        (file) => p.basename(file.path),
      );
      final found = files.any(
        (name) => name.startsWith(prefix) && name.endsWith(extension),
      );
      if (found) {
        return;
      }
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }
    throw TestFailure('Timed out waiting for $prefix$extension export.');
  }

  Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
    await waitFor(tester, finder);
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await tester.pump(const Duration(milliseconds: 400));
  }

  Future<void> tapDashboardNav(WidgetTester tester, String key) async {
    final finder = find.byKey(Key(key));
    await waitFor(tester, finder);
    final scrollable = find.byType(Scrollable);
    for (var i = 0; i < 15; i++) {
      if (finder.hitTestable().evaluate().isNotEmpty) {
        break;
      }
      if (scrollable.evaluate().isEmpty) {
        break;
      }
      await tester.drag(scrollable.first, const Offset(0, -300));
      await tester.pump(const Duration(milliseconds: 200));
    }
    final hitTarget = finder.hitTestable();
    await waitFor(tester, hitTarget);
    await tester.tap(hitTarget);
    await tester.pump(const Duration(milliseconds: 400));
  }

  Future<void> goBack(WidgetTester tester) async {
    await tester.pageBack();
    await tester.pump(const Duration(milliseconds: 300));
    await waitFor(tester, find.byKey(const Key('nav_goals')).hitTestable());
  }

  testWidgets('full app flow works', (tester) async {
    await startApp(tester);

    // ignore: avoid_print
    print('STEP: onboarding');
    await tapAndSettle(tester, find.byKey(const Key('onboarding_continue')));

    // ignore: avoid_print
    print('STEP: profile');
    await tapDashboardNav(tester, 'nav_profile');
    await tester.enterText(
      find.byKey(const Key('profile_role')),
      'Founder & CEO',
    );
    await tapAndSettle(tester, find.byKey(const Key('profile_save')));
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: roles');
    await tapDashboardNav(tester, 'nav_roles');
    await tapAndSettle(tester, find.byKey(const Key('roles_new')));
    await tester.enterText(find.byKey(const Key('roles_name')), 'CEO');
    await tapAndSettle(tester, find.byKey(const Key('roles_save')));
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: north_star');
    await tapDashboardNav(tester, 'nav_north_star');
    await tester.enterText(
      find.byKey(const Key('north_star_title')),
      'Build a self-managing team',
    );
    await tapAndSettle(tester, find.byKey(const Key('north_star_save')));
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: goals');
    await tapDashboardNav(tester, 'nav_goals');
    await tapAndSettle(tester, find.byKey(const Key('goals_new')));
    await tester.enterText(
      find.byKey(const Key('goal_title')),
      'Launch sales dashboard',
    );
    await tapAndSettle(tester, find.byKey(const Key('goal_save')));
    expect(find.text('Launch sales dashboard'), findsOneWidget);
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: checkins');
    await tapDashboardNav(tester, 'nav_checkins');
    await tapAndSettle(tester, find.byKey(const Key('checkins_new')));
    await tapAndSettle(tester, find.byKey(const Key('checkin_save')));
    expect(find.textContaining('Progress'), findsWidgets);
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: analytics');
    await tapDashboardNav(tester, 'nav_analytics');
    expect(find.textContaining('Progress'), findsWidgets);
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: reminders');
    await tapDashboardNav(tester, 'nav_reminders');
    await tapAndSettle(tester, find.byKey(const Key('reminders_new')));
    await tester.enterText(
      find.byKey(const Key('reminder_title')),
      'Weekly check-in',
    );
    await tester.enterText(
      find.byKey(const Key('reminder_body')),
      'Open the app and log progress.',
    );
    await tapAndSettle(tester, find.byKey(const Key('reminder_save')));
    expect(find.text('Weekly check-in'), findsOneWidget);
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: calendar');
    await tapDashboardNav(tester, 'nav_calendar');
    await tapAndSettle(tester, find.byKey(const Key('calendar_export')));
    await waitForExportedFile('clarity_coach_goals_', '.ics');
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: partners');
    await tapDashboardNav(tester, 'nav_partners');
    await tapAndSettle(tester, find.byKey(const Key('partner_new')));
    await tester.enterText(
      find.byKey(const Key('partner_email')),
      'mentor@example.com',
    );
    await tapAndSettle(tester, find.byKey(const Key('partner_save')));
    expect(find.text('mentor@example.com'), findsOneWidget);
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: templates');
    await tapDashboardNav(tester, 'nav_templates');
    await tapAndSettle(tester, find.byKey(const Key('template_item_0')));
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: export');
    await tapDashboardNav(tester, 'nav_export');
    await tapAndSettle(tester, find.byKey(const Key('export_run')));
    await waitForExportedFile('clarity_coach_export_', '.md');
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: music');
    await tapDashboardNav(tester, 'nav_music');
    expect(find.byKey(const Key('music_toggle')), findsOneWidget);
    await goBack(tester);

    // ignore: avoid_print
    print('STEP: activity_log');
    await tapDashboardNav(tester, 'nav_activity');
    expect(find.textContaining('profile'), findsWidgets);
  });
}

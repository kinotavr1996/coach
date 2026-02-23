import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    final deadline = DateTime.now().add(const Duration(seconds: 4));
    while (finder.evaluate().isEmpty) {
      if (DateTime.now().isAfter(deadline)) {
        throw TestFailure('Timed out waiting for ${finder.description}.');
      }
      await tester.pump(const Duration(milliseconds: 200));
    }
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
    await tapAndSettle(tester, finder.hitTestable());
  }

  Future<void> goBack(WidgetTester tester) async {
    await tester.pageBack();
    await tester.pump(const Duration(milliseconds: 300));
    await waitFor(tester, find.byKey(const Key('nav_goals')).hitTestable());
  }

  Future<void> capture(WidgetTester tester, String name) async {
    final documentsDir = await getApplicationDocumentsDirectory();
    final screenshotsDir = Directory(
      p.join(documentsDir.path, 'screenshots'),
    );
    if (!await screenshotsDir.exists()) {
      await screenshotsDir.create(recursive: true);
    }
    await tester.pump(const Duration(milliseconds: 200));
    final boundary = tester.firstRenderObject<RenderRepaintBoundary>(
      find.byKey(const Key('app_root')),
    );
    final image = await boundary.toImage(pixelRatio: 1.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw TestFailure('Failed to encode screenshot for $name.');
    }
    final path = p.join(screenshotsDir.path, '$name.png');
    await File(path).writeAsBytes(byteData.buffer.asUint8List());
    // ignore: avoid_print
    print('Saved screenshot: $path');
  }

  testWidgets('capture all screens', (tester) async {
    await startApp(tester);

    await waitFor(tester, find.byKey(const Key('onboarding_continue')));
    await capture(tester, '01_onboarding');
    await tapAndSettle(tester, find.byKey(const Key('onboarding_continue')));
    await capture(tester, '02_dashboard');

    await tapDashboardNav(tester, 'nav_profile');
    await tester.enterText(
      find.byKey(const Key('profile_role')),
      'Founder & CEO',
    );
    await tapAndSettle(tester, find.byKey(const Key('profile_save')));
    await capture(tester, '03_profile');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_roles');
    await tapAndSettle(tester, find.byKey(const Key('roles_new')));
    await tester.enterText(find.byKey(const Key('roles_name')), 'CEO');
    await tapAndSettle(tester, find.byKey(const Key('roles_save')));
    await capture(tester, '04_roles');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_north_star');
    await tester.enterText(
      find.byKey(const Key('north_star_title')),
      'Build a self-managing team',
    );
    await tapAndSettle(tester, find.byKey(const Key('north_star_save')));
    await capture(tester, '05_north_star');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_goals');
    await tapAndSettle(tester, find.byKey(const Key('goals_new')));
    await tester.enterText(
      find.byKey(const Key('goal_title')),
      'Launch sales dashboard',
    );
    await tapAndSettle(tester, find.byKey(const Key('goal_save')));
    await capture(tester, '06_goals');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_checkins');
    await tapAndSettle(tester, find.byKey(const Key('checkins_new')));
    await tapAndSettle(tester, find.byKey(const Key('checkin_save')));
    await capture(tester, '07_checkins');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_analytics');
    await capture(tester, '08_analytics');
    await goBack(tester);

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
    await capture(tester, '09_reminders');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_calendar');
    await capture(tester, '10_calendar');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_partners');
    await tapAndSettle(tester, find.byKey(const Key('partner_new')));
    await tester.enterText(
      find.byKey(const Key('partner_email')),
      'mentor@example.com',
    );
    await tapAndSettle(tester, find.byKey(const Key('partner_save')));
    await capture(tester, '11_partners');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_templates');
    await tapAndSettle(tester, find.byKey(const Key('template_item_0')));
    await capture(tester, '12_templates');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_export');
    await tapAndSettle(tester, find.byKey(const Key('export_run')));
    await capture(tester, '13_export');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_music');
    await capture(tester, '14_music');
    await goBack(tester);

    await tapDashboardNav(tester, 'nav_activity');
    await capture(tester, '15_activity_log');
  });
}

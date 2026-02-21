import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:coach_app/main.dart' as app;

void main() {
  final binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized()
          as IntegrationTestWidgetsFlutterBinding;
  binding.window.physicalSizeTestValue = const Size(1400, 2600);
  binding.window.devicePixelRatioTestValue = 1.0;
  Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.tap(finder);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  testWidgets('full MVP flow works', (tester) async {
    addTearDown(() {
      binding.window.clearPhysicalSizeTestValue();
      binding.window.clearDevicePixelRatioTestValue();
    });
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await tapAndSettle(tester, find.byKey(const Key('onboarding_continue')));

    await tapAndSettle(tester, find.byKey(const Key('nav_profile')));
    await tester.enterText(
      find.byKey(const Key('profile_role')),
      'Founder & CEO',
    );
    await tapAndSettle(tester, find.byKey(const Key('profile_save')));
    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tapAndSettle(tester, find.byKey(const Key('nav_roles')));
    await tapAndSettle(tester, find.byKey(const Key('roles_new')));
    await tester.enterText(find.byKey(const Key('roles_name')), 'CEO');
    await tapAndSettle(tester, find.byKey(const Key('roles_save')));
    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tapAndSettle(tester, find.byKey(const Key('nav_north_star')));
    await tester.enterText(
      find.byKey(const Key('north_star_title')),
      'Build a self-managing team',
    );
    await tapAndSettle(tester, find.byKey(const Key('north_star_save')));
    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tapAndSettle(tester, find.byKey(const Key('nav_goals')));
    await tapAndSettle(tester, find.byKey(const Key('goals_new')));
    await tester.enterText(
      find.byKey(const Key('goal_title')),
      'Launch sales dashboard',
    );
    await tapAndSettle(tester, find.byKey(const Key('goal_save')));
    expect(find.text('Launch sales dashboard'), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tapAndSettle(tester, find.byKey(const Key('nav_checkins')));
    await tapAndSettle(tester, find.byKey(const Key('checkins_new')));
    await tapAndSettle(tester, find.byKey(const Key('checkin_save')));
    expect(find.textContaining('Progress'), findsWidgets);
    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tapAndSettle(tester, find.byKey(const Key('nav_analytics')));
    expect(find.textContaining('Progress'), findsWidgets);
    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tapAndSettle(tester, find.byKey(const Key('nav_export')));
    await tapAndSettle(tester, find.byKey(const Key('export_run')));
    await tester.pageBack();
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tapAndSettle(tester, find.byKey(const Key('nav_activity')));
    expect(find.textContaining('profile'), findsWidgets);
  });
}

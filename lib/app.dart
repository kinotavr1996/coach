import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'shared/localization/app_localizations.dart';
import 'features/analytics/analytics_screen.dart';
import 'features/calendar/calendar_screen.dart';
import 'features/export/export_screen.dart';
import 'features/activity_log/activity_log_screen.dart';
import 'features/checkins/checkins_screen.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/goals/goals_screen.dart';
import 'features/north_star/north_star_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/profile/profile_screen.dart';
import 'features/reminders/reminders_screen.dart';
import 'features/partners/partner_screen.dart';
import 'features/templates/templates_screen.dart';
import 'features/roles/roles_screen.dart';
import 'features/music/music_screen.dart';

class ClarityCoachApp extends StatelessWidget {
  const ClarityCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: const Key('app_root'),
      child: MaterialApp.router(
        title: 'ClarityCoach AI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        routerConfig: _router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: OnboardingScreen.routeName,
  routes: [
    GoRoute(
      path: OnboardingScreen.routeName,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: DashboardScreen.routeName,
      builder: (context, state) => const DashboardScreen(),
    ),
    GoRoute(
      path: ProfileScreen.routeName,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: NorthStarScreen.routeName,
      builder: (context, state) => const NorthStarScreen(),
    ),
    GoRoute(
      path: GoalsScreen.routeName,
      builder: (context, state) => const GoalsScreen(),
    ),
    GoRoute(
      path: CheckinsScreen.routeName,
      builder: (context, state) => const CheckinsScreen(),
    ),
    GoRoute(
      path: AnalyticsScreen.routeName,
      builder: (context, state) => const AnalyticsScreen(),
    ),
    GoRoute(
      path: RemindersScreen.routeName,
      builder: (context, state) => const RemindersScreen(),
    ),
    GoRoute(
      path: CalendarScreen.routeName,
      builder: (context, state) => const CalendarScreen(),
    ),
    GoRoute(
      path: PartnerScreen.routeName,
      builder: (context, state) => const PartnerScreen(),
    ),
    GoRoute(
      path: TemplatesScreen.routeName,
      builder: (context, state) => const TemplatesScreen(),
    ),
    GoRoute(
      path: ExportScreen.routeName,
      builder: (context, state) => const ExportScreen(),
    ),
    GoRoute(
      path: ActivityLogScreen.routeName,
      builder: (context, state) => const ActivityLogScreen(),
    ),
    GoRoute(
      path: RolesScreen.routeName,
      builder: (context, state) => const RolesScreen(),
    ),
    GoRoute(
      path: MusicScreen.routeName,
      builder: (context, state) => const MusicScreen(),
    ),
  ],
);

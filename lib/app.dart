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
        theme: _quietFocusTheme(),
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

const ColorScheme _quietFocusScheme = ColorScheme.light(
  primary: Color(0xFF4B6A5C),
  onPrimary: Color(0xFFF7F2EB),
  secondary: Color(0xFFC06B4E),
  onSecondary: Color(0xFFF7F2EB),
  surface: Color(0xFFF7F2EB),
  onSurface: Color(0xFF1F1A17),
  error: Color(0xFFB23B3B),
  onError: Color(0xFFF7F2EB),
);

ThemeData _quietFocusTheme() {
  final textTheme = _quietFocusTextTheme();

  final baseBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: _quietFocusScheme.onSurface.withValues(alpha: 0.15),
    ),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: _quietFocusScheme,
    scaffoldBackgroundColor: const Color(0xFFF7F2EB),
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: _quietFocusScheme.surface,
      foregroundColor: _quietFocusScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: textTheme.titleLarge,
    ),
    cardTheme: CardThemeData(
      color: Colors.white.withValues(alpha: 0.68),
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: _quietFocusScheme.onSurface.withValues(alpha: 0.08),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.78),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: baseBorder,
      enabledBorder: baseBorder,
      focusedBorder: baseBorder.copyWith(
        borderSide: BorderSide(
          color: _quietFocusScheme.primary.withValues(alpha: 0.55),
          width: 1.4,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _quietFocusScheme.primary,
        foregroundColor: _quietFocusScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _quietFocusScheme.primary,
        foregroundColor: _quietFocusScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _quietFocusScheme.primary,
      foregroundColor: _quietFocusScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}

TextTheme _quietFocusTextTheme() {
  final base = ThemeData.light().textTheme;
  return base.copyWith(
    headlineLarge: base.headlineLarge?.copyWith(
      fontFamily: 'Georgia',
      fontWeight: FontWeight.w600,
      color: _quietFocusScheme.onSurface,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontFamily: 'Avenir',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: _quietFocusScheme.onSurface,
    ),
    titleMedium: base.titleMedium?.copyWith(
      fontFamily: 'Avenir',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: _quietFocusScheme.onSurface,
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontFamily: 'Avenir',
      fontSize: 16,
      height: 1.5,
      color: _quietFocusScheme.onSurface,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      fontFamily: 'Avenir',
      fontSize: 14,
      height: 1.45,
      color: _quietFocusScheme.onSurface.withValues(alpha: 0.82),
    ),
    labelLarge: base.labelLarge?.copyWith(
      fontFamily: 'Avenir',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: _quietFocusScheme.onPrimary,
    ),
  );
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

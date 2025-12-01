import 'package:flutter/material.dart';

import 'features/onboarding/onboarding_screen.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/goals/goals_screen.dart';
import 'features/checkins/checkins_screen.dart';
import 'features/analytics/analytics_screen.dart';
import 'features/profile/profile_screen.dart';

class ClarityCoachApp extends StatelessWidget {
  const ClarityCoachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClarityCoach AI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        DashboardScreen.routeName: (_) => const DashboardScreen(),
        GoalsScreen.routeName: (_) => const GoalsScreen(),
        CheckinsScreen.routeName: (_) => const CheckinsScreen(),
        AnalyticsScreen.routeName: (_) => const AnalyticsScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
      },
    );
  }
}




import 'package:flutter/material.dart';

import '../goals/goals_screen.dart';
import '../checkins/checkins_screen.dart';
import '../analytics/analytics_screen.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClarityCoach AI'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            'Today’s focus',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'This dashboard will show 1–3 key action items, goal status, and an AI-suggested next best action.',
          ),
          const SizedBox(height: 24),
          const Text(
            'Sections',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _DashboardTile(
            title: 'Goals (GROW + SMART)',
            subtitle: 'Create and structure your strategic goals.',
            icon: Icons.flag,
            onTap: () =>
                Navigator.of(context).pushNamed(GoalsScreen.routeName),
          ),
          _DashboardTile(
            title: 'Check-ins',
            subtitle: 'Log quick daily/weekly updates and blockers.',
            icon: Icons.check_circle_outline,
            onTap: () =>
                Navigator.of(context).pushNamed(CheckinsScreen.routeName),
          ),
          _DashboardTile(
            title: 'Analytics & Insights',
            subtitle: 'See your progress, patterns, and AI insights.',
            icon: Icons.analytics_outlined,
            onTap: () =>
                Navigator.of(context).pushNamed(AnalyticsScreen.routeName),
          ),
          _DashboardTile(
            title: 'Profile & Role',
            subtitle: 'Define your role, KPIs, and North Star.',
            icon: Icons.person_outline,
            onTap: () =>
                Navigator.of(context).pushNamed(ProfileScreen.routeName),
          ),
        ],
      ),
    );
  }
}

class _DashboardTile extends StatelessWidget {
  const _DashboardTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}




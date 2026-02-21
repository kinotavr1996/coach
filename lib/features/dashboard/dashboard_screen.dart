import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/providers.dart';
import '../../domain/models/goal.dart';
import '../goals/goals_screen.dart';
import '../checkins/checkins_screen.dart';
import '../analytics/analytics_screen.dart';
import '../profile/profile_screen.dart';
import '../north_star/north_star_screen.dart';
import '../reminders/reminders_screen.dart';
import '../activity_log/activity_log_screen.dart';
import '../partners/partner_screen.dart';
import '../templates/templates_screen.dart';
import '../export/export_screen.dart';
import '../calendar/calendar_screen.dart';
import '../roles/roles_screen.dart';
import '../music/music_screen.dart';
import '../../shared/localization/app_localizations.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(goalsStreamProvider);
    final activeRoleAsync = ref.watch(activeRoleContextProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('dashboardTitle')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            context.l10n.t('todayFocus'),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          activeRoleAsync.when(
            data: (role) => Text(
              role == null ? 'No active role selected.' : 'Active role: ${role.name}',
              style: const TextStyle(color: Colors.black54),
            ),
            error: (err, _) => Text('Role error: $err'),
            loading: () => const LinearProgressIndicator(),
          ),
          const SizedBox(height: 12),
          goalsAsync.when(
            data: (goals) {
              final roleId = activeRoleAsync.value?.id;
              final focusGoals = goals
                  .where((goal) =>
                      goal.status == GoalStatus.active &&
                      (roleId == null ||
                          goal.roleContextId == roleId ||
                          goal.roleContextId == null))
                  .take(3)
                  .toList();
              if (focusGoals.isEmpty) {
                return const Text(
                  'No active goals yet. Create a goal to see your focus here.',
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: focusGoals
                    .map(
                      (goal) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text('• ${goal.title}'),
                      ),
                    )
                    .toList(),
              );
            },
            error: (err, _) => Text('Error: $err'),
            loading: () => const LinearProgressIndicator(),
          ),
          const SizedBox(height: 24),
          Text(
            context.l10n.t('sections'),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          _DashboardTile(
            key: const Key('nav_goals'),
            title: 'Goals (GROW + SMART)',
            subtitle: 'Create and structure your strategic goals.',
            icon: Icons.flag,
            onTap: () => context.push(GoalsScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_checkins'),
            title: 'Check-ins',
            subtitle: 'Log quick daily/weekly updates and blockers.',
            icon: Icons.check_circle_outline,
            onTap: () => context.push(CheckinsScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_analytics'),
            title: 'Analytics & Insights',
            subtitle: 'See your progress, patterns, and AI insights.',
            icon: Icons.analytics_outlined,
            onTap: () => context.push(AnalyticsScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_north_star'),
            title: 'North Star',
            subtitle: 'Define your long-term strategic focus.',
            icon: Icons.star_outline,
            onTap: () => context.push(NorthStarScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_profile'),
            title: 'Profile & Role',
            subtitle: 'Define your role, KPIs, and North Star.',
            icon: Icons.person_outline,
            onTap: () => context.push(ProfileScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_roles'),
            title: 'Roles',
            subtitle: 'Manage multiple role contexts.',
            icon: Icons.badge_outlined,
            onTap: () => context.push(RolesScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_reminders'),
            title: 'Reminders',
            subtitle: 'Schedule daily or weekly check-ins.',
            icon: Icons.notifications_none,
            onTap: () => context.push(RemindersScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_calendar'),
            title: 'Calendar',
            subtitle: 'Export goal deadlines to calendar.',
            icon: Icons.calendar_today_outlined,
            onTap: () => context.push(CalendarScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_partners'),
            title: 'Partner Accountability',
            subtitle: 'Invite a partner to review progress.',
            icon: Icons.group_outlined,
            onTap: () => context.push(PartnerScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_templates'),
            title: 'Templates',
            subtitle: 'Use pre-built role and goal templates.',
            icon: Icons.library_books_outlined,
            onTap: () => context.push(TemplatesScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_export'),
            title: 'Export',
            subtitle: 'Generate and save summary reports.',
            icon: Icons.file_download_outlined,
            onTap: () => context.push(ExportScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_activity'),
            title: 'Activity Log',
            subtitle: 'See recent actions and updates.',
            icon: Icons.history,
            onTap: () => context.push(ActivityLogScreen.routeName),
          ),
          _DashboardTile(
            key: const Key('nav_music'),
            title: 'Background Music',
            subtitle: 'Play ambient focus loop.',
            icon: Icons.music_note_outlined,
            onTap: () => context.push(MusicScreen.routeName),
          ),
        ],
      ),
    );
  }
}

class _DashboardTile extends StatelessWidget {
  const _DashboardTile({
    super.key,
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

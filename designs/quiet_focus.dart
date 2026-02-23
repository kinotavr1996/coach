import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const QuietFocusApp());
}

class QuietFocusApp extends StatelessWidget {
  const QuietFocusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _quietTheme,
      home: const QuietFocusDashboard(),
    );
  }
}

final ColorScheme _quietScheme = const ColorScheme.light(
  primary: Color(0xFF4B6A5C),
  onPrimary: Color(0xFFF7F2EB),
  secondary: Color(0xFFC06B4E),
  onSecondary: Color(0xFFF7F2EB),
  surface: Color(0xFFF7F2EB),
  onSurface: Color(0xFF1F1A17),
  background: Color(0xFFF7F2EB),
  onBackground: Color(0xFF1F1A17),
  error: Color(0xFFB23B3B),
  onError: Color(0xFFF7F2EB),
);

final ThemeData _quietTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _quietScheme,
  scaffoldBackgroundColor: _quietScheme.background,
  textTheme: GoogleFonts.frauncesTextTheme().copyWith(
    displayLarge: GoogleFonts.fraunces(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.6,
      color: _quietScheme.onBackground,
    ),
    headlineMedium: GoogleFonts.fraunces(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: _quietScheme.onBackground,
    ),
    titleLarge: GoogleFonts.sourceSans3(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: _quietScheme.onBackground,
    ),
    bodyLarge: GoogleFonts.sourceSans3(
      fontSize: 16,
      height: 1.5,
      color: _quietScheme.onBackground,
    ),
    bodyMedium: GoogleFonts.sourceSans3(
      fontSize: 14,
      height: 1.45,
      color: _quietScheme.onBackground.withOpacity(0.8),
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.white.withOpacity(0.6),
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: _quietScheme.onBackground.withOpacity(0.08)),
    ),
  ),
);

class QuietFocusDashboard extends StatelessWidget {
  const QuietFocusDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClarityCoach', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
        children: [
          Text('Your week, in focus', style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 12),
          Text(
            'A calm space to plan, reflect, and keep the most important promises to yourself.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          _NorthStarCard(),
          const SizedBox(height: 20),
          _InsightStrip(),
          const SizedBox(height: 28),
          _SectionTitle(title: 'Key goals', action: 'Review'),
          const SizedBox(height: 12),
          _GoalCard(
            title: 'Launch sales dashboard',
            detail: '2 milestones due this week',
            progress: 0.62,
          ),
          const SizedBox(height: 12),
          _GoalCard(
            title: 'Delegate weekly reporting',
            detail: 'Draft process and owner',
            progress: 0.34,
          ),
          const SizedBox(height: 24),
          _SectionTitle(title: 'Check-in cadence', action: 'Open'),
          const SizedBox(height: 12),
          _CheckinTile(
            title: 'Monday clarity ritual',
            detail: 'Last completed 6 days ago',
            status: 'Due today',
          ),
          const SizedBox(height: 10),
          _CheckinTile(
            title: 'Team health scan',
            detail: 'Last completed 3 days ago',
            status: 'On track',
          ),
          const SizedBox(height: 24),
          _SectionTitle(title: 'Support circle', action: 'Invite'),
          const SizedBox(height: 12),
          _PartnerCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New check-in'),
        icon: const Icon(Icons.add),
        backgroundColor: _quietScheme.primary,
        foregroundColor: _quietScheme.onPrimary,
      ),
    );
  }
}

class _NorthStarCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('North Star', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              'Build a self-managing team that delivers results without constant oversight.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _Pill(label: 'Clarity 82%'),
                const SizedBox(width: 8),
                _Pill(label: 'Momentum 7/10'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InsightStrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF9DB6C8).withOpacity(0.25),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(Icons.auto_graph, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Most productive hours: 9:30 to 12:00. Protect that block this week.',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalCard extends StatelessWidget {
  final String title;
  final String detail;
  final double progress;

  const _GoalCard({
    required this.title,
    required this.detail,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 6),
            Text(detail, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: theme.colorScheme.onSurface.withOpacity(0.08),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckinTile extends StatelessWidget {
  final String title;
  final String detail;
  final String status;

  const _CheckinTile({
    required this.title,
    required this.detail,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.45),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.onSurface.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.event_note, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(detail, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _Pill(label: status),
        ],
      ),
    );
  }
}

class _PartnerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mentor circle', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              '2 partners keeping you accountable this month.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _Avatar(label: 'A'),
                const SizedBox(width: 8),
                _Avatar(label: 'M'),
                const SizedBox(width: 8),
                _Avatar(label: '+3'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String action;

  const _SectionTitle({required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: theme.textTheme.headlineMedium),
        Text(action, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;

  const _Pill({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: theme.textTheme.bodyMedium),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String label;

  const _Avatar({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(label, style: theme.textTheme.bodyMedium),
      ),
    );
  }
}

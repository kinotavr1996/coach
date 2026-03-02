import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const HarborApp());
}

class HarborApp extends StatelessWidget {
  const HarborApp({super.key, this.useSystemFonts = false});

  final bool useSystemFonts;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _harborTheme(useSystemFonts),
      home: const HarborDashboard(),
    );
  }
}

final ColorScheme _harborScheme = const ColorScheme.light(
  primary: Color(0xFF2D6A6F),
  onPrimary: Color(0xFFE9E3D6),
  secondary: Color(0xFFE1A65E),
  onSecondary: Color(0xFF1C2B36),
  surface: Color(0xFFF6F1E9),
  onSurface: Color(0xFF1C2B36),
  background: Color(0xFFE9E3D6),
  onBackground: Color(0xFF1C2B36),
  error: Color(0xFFC44B3A),
  onError: Color(0xFFF6F1E9),
);

ThemeData _harborTheme(bool useSystemFonts) => ThemeData(
  useMaterial3: true,
  colorScheme: _harborScheme,
  scaffoldBackgroundColor: _harborScheme.background,
  textTheme: _harborTextTheme(useSystemFonts),
  cardTheme: CardThemeData(
    color: Colors.white.withOpacity(0.7),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22),
      side: BorderSide(color: _harborScheme.onBackground.withOpacity(0.08)),
    ),
  ),
);

TextTheme _harborTextTheme(bool useSystemFonts) {
  if (!useSystemFonts) {
    return GoogleFonts.cormorantGaramondTextTheme().copyWith(
      displayLarge: GoogleFonts.cormorantGaramond(
        fontSize: 38,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        color: _harborScheme.onBackground,
      ),
      headlineMedium: GoogleFonts.cormorantGaramond(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: _harborScheme.onBackground,
      ),
      titleLarge: GoogleFonts.workSans(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _harborScheme.onBackground,
      ),
      bodyLarge: GoogleFonts.workSans(
        fontSize: 16,
        height: 1.5,
        color: _harborScheme.onBackground,
      ),
      bodyMedium: GoogleFonts.workSans(
        fontSize: 13,
        height: 1.45,
        color: _harborScheme.onBackground.withOpacity(0.7),
      ),
    );
  }

  final base = ThemeData.light().textTheme;
  return base.copyWith(
    displayLarge: base.displayLarge?.copyWith(
      fontFamily: 'Palatino',
      fontSize: 38,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: _harborScheme.onBackground,
    ),
    headlineMedium: base.headlineMedium?.copyWith(
      fontFamily: 'Palatino',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: _harborScheme.onBackground,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontFamily: 'Gill Sans',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: _harborScheme.onBackground,
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontFamily: 'Gill Sans',
      fontSize: 16,
      height: 1.5,
      color: _harborScheme.onBackground,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      fontFamily: 'Gill Sans',
      fontSize: 13,
      height: 1.45,
      color: _harborScheme.onBackground.withOpacity(0.7),
    ),
  );
}

class HarborDashboard extends StatelessWidget {
  const HarborDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClarityCoach', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sailing)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
        children: [
          _GradientBanner(),
          const SizedBox(height: 20),
          _SectionTitle(title: 'Weekly bearings', action: 'Set course'),
          const SizedBox(height: 12),
          _BearingCard(
            title: 'North Star',
            detail: 'Build a resilient leadership rhythm that scales with the team.',
          ),
          const SizedBox(height: 16),
          _SectionTitle(title: 'Route map', action: 'Open'),
          const SizedBox(height: 12),
          _RouteItem(
            step: 'Prepare agenda',
            detail: 'Define weekly priorities and owners.',
            status: 'Done',
          ),
          const SizedBox(height: 10),
          _RouteItem(
            step: 'Run check-in',
            detail: 'Collect signals and blockers.',
            status: 'Today',
          ),
          const SizedBox(height: 10),
          _RouteItem(
            step: 'Share recap',
            detail: 'Send summary to partners.',
            status: 'Upcoming',
          ),
          const SizedBox(height: 24),
          _SectionTitle(title: 'Crew pulse', action: 'View'),
          const SizedBox(height: 12),
          _CrewCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New log'),
        icon: const Icon(Icons.edit),
        backgroundColor: _harborScheme.primary,
        foregroundColor: _harborScheme.onPrimary,
      ),
    );
  }
}

class _GradientBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          colors: [Color(0xFF1C2B36), Color(0xFF2D6A6F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Steady the course', style: theme.textTheme.displayLarge?.copyWith(color: Colors.white)),
          const SizedBox(height: 10),
          Text(
            'A warm, grounded space for long-term focus and sustainable pace.',
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: const [
              _TagPill(label: 'Quarterly review'),
              _TagPill(label: 'Partner sync'),
              _TagPill(label: 'Reflection'),
            ],
          ),
        ],
      ),
    );
  }
}

class _BearingCard extends StatelessWidget {
  final String title;
  final String detail;

  const _BearingCard({required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(detail, style: theme.textTheme.bodyLarge),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: 0.7,
                    minHeight: 8,
                    backgroundColor: theme.colorScheme.onSurface.withOpacity(0.08),
                  ),
                ),
                const SizedBox(width: 12),
                Text('70%', style: theme.textTheme.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RouteItem extends StatelessWidget {
  final String step;
  final String detail;
  final String status;

  const _RouteItem({required this.step, required this.detail, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.onSurface.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.check_circle_outline),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(step, style: theme.textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(detail, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _StatusPill(label: status),
        ],
      ),
    );
  }
}

class _CrewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Crew readiness', style: theme.textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              '2 leaders are ready for delegation. 1 needs extra support.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _CrewAvatar(label: 'A'),
                const SizedBox(width: 8),
                _CrewAvatar(label: 'K'),
                const SizedBox(width: 8),
                _CrewAvatar(label: 'T'),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        Text(action, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class _TagPill extends StatelessWidget {
  final String label;

  const _TagPill({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70)),
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String label;

  const _StatusPill({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: theme.textTheme.bodyMedium),
    );
  }
}

class _CrewAvatar extends StatelessWidget {
  final String label;

  const _CrewAvatar({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.25),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}

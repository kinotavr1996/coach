import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PulseApp());
}

class PulseApp extends StatelessWidget {
  const PulseApp({super.key, this.useSystemFonts = false});

  final bool useSystemFonts;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _pulseTheme(useSystemFonts),
      home: const PulseDashboard(),
    );
  }
}

final ColorScheme _pulseScheme = const ColorScheme.dark(
  primary: Color(0xFFA7F72A),
  onPrimary: Color(0xFF0B0D12),
  secondary: Color(0xFF4CC9FF),
  onSecondary: Color(0xFF0B0D12),
  surface: Color(0xFF151924),
  onSurface: Color(0xFFE6E8EE),
  background: Color(0xFF0B0D12),
  onBackground: Color(0xFFE6E8EE),
  error: Color(0xFFFF3E8E),
  onError: Color(0xFF0B0D12),
);

ThemeData _pulseTheme(bool useSystemFonts) => ThemeData(
  useMaterial3: true,
  colorScheme: _pulseScheme,
  scaffoldBackgroundColor: _pulseScheme.background,
  textTheme: _pulseTextTheme(useSystemFonts),
);

TextTheme _pulseTextTheme(bool useSystemFonts) {
  if (!useSystemFonts) {
    return GoogleFonts.spaceGroteskTextTheme().copyWith(
      displayLarge: GoogleFonts.spaceGrotesk(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        color: _pulseScheme.onBackground,
      ),
      headlineMedium: GoogleFonts.spaceGrotesk(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: _pulseScheme.onBackground,
      ),
      titleLarge: GoogleFonts.manrope(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: _pulseScheme.onBackground,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 16,
        height: 1.5,
        color: _pulseScheme.onBackground,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 13,
        height: 1.45,
        color: _pulseScheme.onBackground.withOpacity(0.75),
      ),
    );
  }

  final base = ThemeData.dark().textTheme;
  return base.copyWith(
    displayLarge: base.displayLarge?.copyWith(
      fontFamily: 'Futura',
      fontSize: 36,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: _pulseScheme.onBackground,
    ),
    headlineMedium: base.headlineMedium?.copyWith(
      fontFamily: 'Futura',
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: _pulseScheme.onBackground,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontFamily: 'Helvetica Neue',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: _pulseScheme.onBackground,
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontFamily: 'Helvetica Neue',
      fontSize: 16,
      height: 1.5,
      color: _pulseScheme.onBackground,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      fontFamily: 'Helvetica Neue',
      fontSize: 13,
      height: 1.45,
      color: _pulseScheme.onBackground.withOpacity(0.75),
    ),
  );
}

class PulseDashboard extends StatelessWidget {
  const PulseDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClarityCoach', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.bolt)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 32),
        children: [
          Text('Momentum Dashboard', style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 14),
          _HeroCard(),
          const SizedBox(height: 20),
          _KpiStrip(),
          const SizedBox(height: 24),
          _SectionTitle(title: 'Today\'s plays', action: 'Focus'),
          const SizedBox(height: 12),
          _ActionTile(
            title: 'Publish Q1 roadmap',
            detail: 'Block 90 minutes. Send to partners.',
            tag: 'Priority',
          ),
          const SizedBox(height: 12),
          _ActionTile(
            title: 'Run leadership retro',
            detail: 'Invite team leads. Capture 3 wins.',
            tag: 'Deep work',
          ),
          const SizedBox(height: 24),
          _SectionTitle(title: 'Signals', action: 'View all'),
          const SizedBox(height: 12),
          _SignalCard(
            title: 'Energy spike at 10:00',
            detail: 'Schedule strategic work before noon.',
          ),
          const SizedBox(height: 12),
          _SignalCard(
            title: 'Check-in streak: 6 days',
            detail: 'Keep it alive with a quick reflection.',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('New sprint'),
        icon: const Icon(Icons.add),
        backgroundColor: _pulseScheme.primary,
        foregroundColor: _pulseScheme.onPrimary,
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF2A2F3D), Color(0xFF131824)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('North Star', style: theme.textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Move the team into autonomous execution with weekly clarity rituals.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _GlowChip(label: 'Clarity 88%'),
              const SizedBox(width: 10),
              _GlowChip(label: 'Momentum 8/10'),
            ],
          ),
        ],
      ),
    );
  }
}

class _KpiStrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: _KpiCard(
            value: '6',
            label: 'Streak days',
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _KpiCard(
            value: '4',
            label: 'Goals active',
            color: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _KpiCard({required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF151924),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: Theme.of(context).textTheme.displayLarge),
          const SizedBox(height: 4),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final String title;
  final String detail;
  final String tag;

  const _ActionTile({required this.title, required this.detail, required this.tag});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF151924),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.colorScheme.secondary.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.play_arrow_rounded),
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
          _GlowChip(label: tag),
        ],
      ),
    );
  }
}

class _SignalCard extends StatelessWidget {
  final String title;
  final String detail;

  const _SignalCard({required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF11151E),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(detail, style: theme.textTheme.bodyMedium),
        ],
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

class _GlowChip extends StatelessWidget {
  final String label;

  const _GlowChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Text(label, style: theme.textTheme.bodyMedium),
    );
  }
}

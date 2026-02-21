import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../dashboard/dashboard_screen.dart';
import '../../shared/localization/app_localizations.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('onboardingTitle')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Let’s set up your role and strategic focus.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            const Text(
              'In the MVP, this will guide the user through defining role, vision, and key responsibilities. '
              'For now, tap Continue to open the main dashboard.',
            ),
            const Spacer(),
            FilledButton(
              key: const Key('onboarding_continue'),
              onPressed: () {
                context.go(DashboardScreen.routeName);
              },
              child: Text(context.l10n.t('continue')),
            ),
          ],
        ),
      ),
    );
  }
}

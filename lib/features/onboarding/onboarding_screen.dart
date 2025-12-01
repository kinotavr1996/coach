import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to ClarityCoach AI'),
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
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(DashboardScreen.routeName);
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}




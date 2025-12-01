import 'package:flutter/material.dart';

class CheckinsScreen extends StatelessWidget {
  const CheckinsScreen({super.key});

  static const routeName = '/checkins';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check-ins'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'This screen will host quick daily/weekly check-in forms,\n'
          'AI-generated summaries, and escalation if actions are missed.',
        ),
      ),
    );
  }
}




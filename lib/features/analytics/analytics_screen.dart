import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  static const routeName = '/analytics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics & Insights'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Analytics will show progress over time, completion rates,\n'
          'and AI-generated insights about focus, blockers, and trends.',
        ),
      ),
    );
  }
}




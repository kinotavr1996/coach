import 'package:flutter/material.dart';

/// Profile & Role screen.
///
/// Captures the user’s role, scope, KPIs, stakeholders, North Star objective
/// and core values. Data is stored in-memory only for now.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final _roleController = TextEditingController();
  final _scopeController = TextEditingController();
  final _kpisController = TextEditingController();
  final _stakeholdersController = TextEditingController();
  final _northStarController = TextEditingController();
  final _valuesController = TextEditingController();

  ProfileData? _savedProfile;

  @override
  void dispose() {
    _roleController.dispose();
    _scopeController.dispose();
    _kpisController.dispose();
    _stakeholdersController.dispose();
    _northStarController.dispose();
    _valuesController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _savedProfile = ProfileData(
        role: _roleController.text.trim(),
        scope: _scopeController.text.trim(),
        kpis: _kpisController.text.trim(),
        stakeholders: _stakeholdersController.text.trim(),
        northStar: _northStarController.text.trim(),
        values: _valuesController.text.trim(),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile saved (in memory only).')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Role'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Who are you in your business today?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _roleController,
                  decoration: const InputDecoration(
                    labelText: 'Role / Position',
                    hintText: 'e.g. Founder & CEO, Head of Sales',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your role.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _scopeController,
                  decoration: const InputDecoration(
                    labelText: 'Role scope / zone of responsibility',
                    hintText: 'What areas are you responsible for?',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _kpisController,
                  decoration: const InputDecoration(
                    labelText: 'Key KPIs (comma or line separated)',
                    hintText: 'e.g. MRR growth, NPS, team retention',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _stakeholdersController,
                  decoration: const InputDecoration(
                    labelText: 'Key stakeholders',
                    hintText: 'e.g. investors, co-founders, team leads',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _northStarController,
                  decoration: const InputDecoration(
                    labelText: 'North Star objective (6–12 months)',
                    hintText:
                        'e.g. Build a self-managing team that drives stable profit.',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _valuesController,
                  decoration: const InputDecoration(
                    labelText: 'Core values & decision principles',
                    hintText: 'What guides your decisions as a leader?',
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _saveProfile,
                  child: const Text('Save profile'),
                ),
                const SizedBox(height: 24),
                if (_savedProfile != null) ...[
                  const Text(
                    'Your current profile',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _savedProfile!.role,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (_savedProfile!.scope.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text('Scope: ${_savedProfile!.scope}'),
                          ],
                          if (_savedProfile!.kpis.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text('KPIs: ${_savedProfile!.kpis}'),
                          ],
                          if (_savedProfile!.stakeholders.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text('Stakeholders: ${_savedProfile!.stakeholders}'),
                          ],
                          if (_savedProfile!.northStar.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text('North Star: ${_savedProfile!.northStar}'),
                          ],
                          if (_savedProfile!.values.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Text('Values: ${_savedProfile!.values}'),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileData {
  ProfileData({
    required this.role,
    required this.scope,
    required this.kpis,
    required this.stakeholders,
    required this.northStar,
    required this.values,
  });

  final String role;
  final String scope;
  final String kpis;
  final String stakeholders;
  final String northStar;
  final String values;
}


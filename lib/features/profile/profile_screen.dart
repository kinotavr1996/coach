import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/profile.dart';
import '../../shared/localization/app_localizations.dart';

/// Profile & Role screen.
///
/// Captures the user’s role, scope, KPIs, stakeholders, North Star objective
/// and core values. Data is stored locally.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final _roleController = TextEditingController();
  final _scopeController = TextEditingController();
  final _visionController = TextEditingController();
  final _responsibilityController = TextEditingController();
  final _missionController = TextEditingController();
  final _kpisController = TextEditingController();
  final _stakeholdersController = TextEditingController();
  final _valuesController = TextEditingController();

  int? _id;
  bool _initialized = false;

  @override
  void dispose() {
    _roleController.dispose();
    _scopeController.dispose();
    _visionController.dispose();
    _responsibilityController.dispose();
    _missionController.dispose();
    _kpisController.dispose();
    _stakeholdersController.dispose();
    _valuesController.dispose();
    super.dispose();
  }

  void _hydrateForm(Profile? profile) {
    if (_initialized || profile == null) {
      return;
    }
    _id = profile.id;
    _roleController.text = profile.role;
    _scopeController.text = profile.scope;
    _visionController.text = profile.vision;
    _responsibilityController.text = profile.responsibility;
    _missionController.text = profile.mission;
    _kpisController.text = profile.kpis;
    _stakeholdersController.text = profile.stakeholders;
    _valuesController.text = profile.values;
    _initialized = true;
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final profile = Profile(
      id: _id,
      role: _roleController.text.trim(),
      scope: _scopeController.text.trim(),
      vision: _visionController.text.trim(),
      responsibility: _responsibilityController.text.trim(),
      mission: _missionController.text.trim(),
      kpis: _kpisController.text.trim(),
      stakeholders: _stakeholdersController.text.trim(),
      values: _valuesController.text.trim(),
      updatedAt: DateTime.now(),
    );

    final id = await ref.read(coachRepositoryProvider).saveProfile(profile);
    _id = id;

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved.')),
      );
    }
  }

  Future<void> _runAiRefine() async {
    final ai = ref.read(aiServiceProvider);
    final role = _roleController.text.trim();
    if (role.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enter a role first.')),
        );
      }
      return;
    }
    final response = await ai.refineRole(
      role,
      _visionController.text.trim(),
      _responsibilityController.text.trim(),
    );
    if (!mounted) {
      return;
    }
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('AI suggestion'),
        content: Text(response),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('profileTitle')),
      ),
      body: SafeArea(
        child: profileAsync.when(
          data: (profile) {
            _hydrateForm(profile);
            return SingleChildScrollView(
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
                      key: const Key('profile_role'),
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
                      controller: _visionController,
                      decoration: const InputDecoration(
                        labelText: 'Vision',
                        hintText: 'What future are you trying to build?',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _responsibilityController,
                      decoration: const InputDecoration(
                        labelText: 'Key responsibilities',
                        hintText: 'What is explicitly on you?',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _missionController,
                      decoration: const InputDecoration(
                        labelText: 'Mission statement / motto',
                        hintText: 'Short personal mission or motto',
                      ),
                      maxLines: 2,
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
                      controller: _valuesController,
                      decoration: const InputDecoration(
                        labelText: 'Core values & decision principles',
                        hintText: 'What guides your decisions as a leader?',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      key: const Key('profile_save'),
                      onPressed: _saveProfile,
                      child: Text(context.l10n.t('saveProfile')),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: _runAiRefine,
                      icon: const Icon(Icons.auto_awesome_outlined),
                      label: const Text('AI refine role'),
                    ),
                    if (profile != null) ...[
                      const SizedBox(height: 24),
                      const Text(
                        'Your current profile',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.role,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (profile.scope.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text('Scope: ${profile.scope}'),
                              ],
                              if (profile.vision.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text('Vision: ${profile.vision}'),
                              ],
                              if (profile.responsibility.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text('Responsibility: ${profile.responsibility}'),
                              ],
                              if (profile.mission.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text('Mission: ${profile.mission}'),
                              ],
                              if (profile.kpis.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text('KPIs: ${profile.kpis}'),
                              ],
                              if (profile.stakeholders.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text('Stakeholders: ${profile.stakeholders}'),
                              ],
                              if (profile.values.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text('Values: ${profile.values}'),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
          error: (err, _) => Center(child: Text('Error: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

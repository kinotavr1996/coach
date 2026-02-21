import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/role_context.dart';
import '../../shared/localization/app_localizations.dart';

class RolesScreen extends ConsumerWidget {
  const RolesScreen({super.key});

  static const routeName = '/roles';

  void _openCreateRoleSheet(BuildContext context) {
    showModalBottomSheet<RoleContext>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const CreateRoleSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rolesAsync = ref.watch(roleContextsStreamProvider);
    final profile = ref.watch(profileStreamProvider).value;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('rolesTitle')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('roles_new'),
        onPressed: profile == null ? null : () => _openCreateRoleSheet(context),
        icon: const Icon(Icons.add),
        label: Text(context.l10n.t('newRole')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: rolesAsync.when(
          data: (roles) {
            if (profile == null) {
              return const Center(
                child: Text('Create a profile first to manage role contexts.'),
              );
            }
            if (roles.isEmpty) {
              return const Center(child: Text('No roles yet. Add your first role.'));
            }
            return ListView.separated(
              itemCount: roles.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final role = roles[index];
                return Card(
                  child: ListTile(
                    title: Text(role.name),
                    subtitle: Text(role.description),
                    trailing: Switch(
                      value: role.isActive,
                      onChanged: (value) {
                        if (value) {
                          ref.read(coachRepositoryProvider).setActiveRoleContext(role.id!);
                        }
                      },
                    ),
                  ),
                );
              },
            );
          },
          error: (err, _) => Center(child: Text('Error: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class CreateRoleSheet extends ConsumerStatefulWidget {
  const CreateRoleSheet({super.key});

  @override
  ConsumerState<CreateRoleSheet> createState() => _CreateRoleSheetState();
}

class _CreateRoleSheetState extends ConsumerState<CreateRoleSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final profile = ref.read(profileStreamProvider).value;
    if (profile == null) {
      return;
    }
    final role = RoleContext(
      profileId: profile.id!,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      isActive: true,
      updatedAt: DateTime.now(),
    );
    final repo = ref.read(coachRepositoryProvider);
    final id = await repo.saveRoleContext(role);
    await repo.setActiveRoleContext(id);
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'New role',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('roles_name'),
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Role name',
                  hintText: 'e.g. CEO, Head of Sales',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter a role name.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Focus or responsibilities for this role.',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              FilledButton(
                key: const Key('roles_save'),
                onPressed: _save,
                child: Text(context.l10n.t('saveRole')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

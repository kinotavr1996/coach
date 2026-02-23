import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/partner_account.dart';
import '../../shared/localization/app_localizations.dart';

class PartnerScreen extends ConsumerWidget {
  const PartnerScreen({super.key});

  static const routeName = '/partners';

  void _openCreatePartnerSheet(BuildContext context) {
    showModalBottomSheet<PartnerAccount>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const CreatePartnerSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final partnersAsync = ref.watch(partnerAccountsStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.t('partnerTitle'))),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('partner_new'),
        onPressed: () => _openCreatePartnerSheet(context),
        icon: const Icon(Icons.person_add_alt_1),
        label: Text(context.l10n.t('newPartner')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: partnersAsync.when(
          data: (partners) {
            if (partners.isEmpty) {
              return const Center(
                child: Text(
                  'No partners yet. Add one to receive accountability reports.',
                ),
              );
            }
            return ListView.separated(
              itemCount: partners.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final partner = partners[index];
                return Card(
                  child: ListTile(
                    key: Key('partner_item_$index'),
                    title: Text(partner.email),
                    subtitle: Text('Schedule: ${partner.reportSchedule}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => ref
                          .read(coachRepositoryProvider)
                          .deletePartnerAccount(partner.id!),
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

class CreatePartnerSheet extends ConsumerStatefulWidget {
  const CreatePartnerSheet({super.key});

  @override
  ConsumerState<CreatePartnerSheet> createState() => _CreatePartnerSheetState();
}

class _CreatePartnerSheetState extends ConsumerState<CreatePartnerSheet> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String _schedule = 'weekly';

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final now = DateTime.now();
    final partner = PartnerAccount(
      email: _emailController.text.trim(),
      accessLevel: 'read',
      reportSchedule: _schedule,
      isEnabled: true,
      createdAt: now,
      updatedAt: now,
    );
    await ref.read(coachRepositoryProvider).savePartnerAccount(partner);
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
                'Add partner',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('partner_email'),
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Partner email',
                  hintText: 'mentor@example.com',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter an email.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                key: const Key('partner_schedule'),
                initialValue: _schedule,
                decoration: const InputDecoration(labelText: 'Report schedule'),
                items: const [
                  DropdownMenuItem(value: 'weekly', child: Text('Weekly')),
                  DropdownMenuItem(value: 'monthly', child: Text('Monthly')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _schedule = value);
                  }
                },
              ),
              const SizedBox(height: 20),
              FilledButton(
                key: const Key('partner_save'),
                onPressed: _save,
                child: Text(context.l10n.t('savePartner')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

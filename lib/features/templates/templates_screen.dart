import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../shared/localization/app_localizations.dart';

class TemplatesScreen extends ConsumerStatefulWidget {
  const TemplatesScreen({super.key});

  static const routeName = '/templates';

  @override
  ConsumerState<TemplatesScreen> createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends ConsumerState<TemplatesScreen> {
  bool _seeded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_seeded) {
      _seeded = true;
      ref.read(coachRepositoryProvider).seedTemplatesIfNeeded();
    }
  }

  @override
  Widget build(BuildContext context) {
    final templatesAsync = ref.watch(templatesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('templatesTitle')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: templatesAsync.when(
          data: (templates) {
            if (templates.isEmpty) {
              return const Center(child: Text('No templates available.'));
            }
            return ListView.separated(
              itemCount: templates.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final template = templates[index];
                return Card(
                  child: ListTile(
                    title: Text(template.title),
                    subtitle: Text(template.type),
                    onTap: () async {
                      final messenger = ScaffoldMessenger.of(context);
                      await Clipboard.setData(ClipboardData(text: template.content));
                      if (!mounted) {
                        return;
                      }
                      messenger.showSnackBar(
                        const SnackBar(content: Text('Template copied to clipboard.')),
                      );
                    },
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

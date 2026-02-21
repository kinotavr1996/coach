import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/models/north_star.dart';
import '../../shared/localization/app_localizations.dart';

class NorthStarScreen extends ConsumerStatefulWidget {
  const NorthStarScreen({super.key});

  static const routeName = '/north-star';

  @override
  ConsumerState<NorthStarScreen> createState() => _NorthStarScreenState();
}

class _NorthStarScreenState extends ConsumerState<NorthStarScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _keywordController = TextEditingController();
  final _emotionController = TextEditingController();

  NorthStarHorizon _horizon = NorthStarHorizon.year;
  int? _id;
  bool _initialized = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _keywordController.dispose();
    _emotionController.dispose();
    super.dispose();
  }

  void _hydrateForm(NorthStar? northStar) {
    if (_initialized || northStar == null) {
      return;
    }
    _id = northStar.id;
    _titleController.text = northStar.title;
    _descriptionController.text = northStar.description;
    _keywordController.text = northStar.keyword;
    _emotionController.text = northStar.emotion;
    _horizon = northStar.horizon;
    _initialized = true;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final repo = ref.read(coachRepositoryProvider);
    final roleContext = ref.read(activeRoleContextProvider).value;
    final now = DateTime.now();
    final northStar = NorthStar(
      id: _id,
      roleContextId: roleContext?.id,
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      horizon: _horizon,
      keyword: _keywordController.text.trim(),
      emotion: _emotionController.text.trim(),
      updatedAt: now,
    );
    await repo.saveNorthStar(northStar);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('North Star збережено.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final northStarAsync = ref.watch(northStarStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.t('northStarTitle')),
      ),
      body: SafeArea(
        child: northStarAsync.when(
          data: (northStar) {
            _hydrateForm(northStar);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Велика мета (6–12 місяців)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      key: const Key('north_star_title'),
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Назва мети',
                        hintText: 'Короткий опис стратегічного фокусу',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Вкажіть назву мети.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Опис',
                        hintText: 'Що має змінитись через 6–12 місяців?',
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<NorthStarHorizon>(
                      initialValue: _horizon,
                      decoration: const InputDecoration(
                        labelText: 'Горизонт',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: NorthStarHorizon.quarter,
                          child: Text('Квартал'),
                        ),
                        DropdownMenuItem(
                          value: NorthStarHorizon.year,
                          child: Text('Рік'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _horizon = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _keywordController,
                      decoration: const InputDecoration(
                        labelText: 'Ключове слово',
                        hintText: '1 слово, що описує результат',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emotionController,
                      decoration: const InputDecoration(
                        labelText: 'Емоція/відчуття',
                        hintText: 'Що ви відчуєте, коли це буде досягнуто?',
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      key: const Key('north_star_save'),
                      onPressed: _save,
                      child: Text(context.l10n.t('saveNorthStar')),
                    ),
                    if (northStar != null) ...[
                      const SizedBox(height: 24),
                      const Text(
                        'Поточна North Star',
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
                                northStar.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (northStar.description.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text(northStar.description),
                              ],
                              if (northStar.keyword.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text('Ключове слово: ${northStar.keyword}'),
                              ],
                              if (northStar.emotion.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text('Емоція: ${northStar.emotion}'),
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
          error: (err, _) => Center(child: Text('Помилка: $err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

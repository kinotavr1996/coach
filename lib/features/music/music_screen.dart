import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';

class MusicScreen extends ConsumerStatefulWidget {
  const MusicScreen({super.key});

  static const routeName = '/music';

  @override
  ConsumerState<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends ConsumerState<MusicScreen> {
  bool _isPlaying = false;

  Future<void> _toggle() async {
    final service = ref.read(backgroundMusicProvider);
    await service.toggle();
    setState(() {
      _isPlaying = service.isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Music'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Ambient loop',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(_isPlaying ? 'Playing' : 'Stopped'),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _toggle,
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              label: Text(_isPlaying ? 'Stop' : 'Play'),
            ),
          ],
        ),
      ),
    );
  }
}

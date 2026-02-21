import 'package:audioplayers/audioplayers.dart';

class BackgroundMusicService {
  BackgroundMusicService() : _player = AudioPlayer();

  final AudioPlayer _player;
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  Future<void> play() async {
    if (_isPlaying) {
      return;
    }
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.play(AssetSource('audio/ambient_loop.wav'));
    _isPlaying = true;
  }

  Future<void> stop() async {
    if (!_isPlaying) {
      return;
    }
    await _player.stop();
    _isPlaying = false;
  }

  Future<void> toggle() async {
    if (_isPlaying) {
      await stop();
    } else {
      await play();
    }
  }

  Future<void> dispose() async {
    await _player.dispose();
  }
}

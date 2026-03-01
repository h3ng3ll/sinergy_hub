import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playAsset(String pathToSound , {
    PlayerMode? mode,
    ReleaseMode releaseMode= .release,
  }) async {
    await _player.setReleaseMode(
      releaseMode,
    );
    await _player.play(

      AssetSource(
        pathToSound
            .split(
              'assets/',
            )
            .last,

      ),
      mode: mode
    );
  }

  Future<void> stop() async {
    await _player.stop();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> resume() async {
    await _player.resume();
  }
}

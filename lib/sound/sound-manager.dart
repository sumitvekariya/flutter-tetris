import 'package:assets_audio_player/assets_audio_player.dart';

final String url = 'assets/sounds/tetris-sound.mp3';

class SoundManager {
  static final assetsAudioPlayer = AssetsAudioPlayer();

  static start(bool sound) {
    _playMusic(0, 3.7202, 3.6224, sound);
  }

  static clear(bool sound) {
    _playMusic(0, 0, 0.7675, sound);
  }

  static fall(bool sound) {
    _playMusic(0, 1.2558, 0.3546, sound);
  }

  static gameOver(bool sound) {
    _playMusic(0, 8.1276, 1.1437, sound);
  }

  static rotate(bool sound) {
    _playMusic(0, 2.2471, 0.0807, sound);
  }

  static move(bool sound) {
    _playMusic(0, 2.9088, 0.1437, sound);
  }

  static _playMusic(int when, double offset, double duration, bool sound) {
    seekToSecond(offset, duration, sound);
  }

  static muteUnmute(sound) async {
    if (sound == true) {
      await assetsAudioPlayer.setVolume(0.4);
    } else {
      await assetsAudioPlayer.setVolume(0);
    }
  }

  static seekToSecond(double second, double howLong, bool sound) async {
    Duration newDuration = Duration(milliseconds: (second * 1000).toInt());
    Duration howLongTime =
        Duration(milliseconds: (howLong * 1000).toInt() + 300);
    try {
      await assetsAudioPlayer.open(Audio(url),
          seek: newDuration, volume: sound == true ? 0.4 : 0);
      Future.delayed(howLongTime).then((value) => assetsAudioPlayer.stop());
    } catch (e) {
      print(e);
    }
  }
}

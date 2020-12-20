import 'package:audioplayers/audioplayers.dart';

class PlayMusic{
  AudioPlayer _audioPlayer = AudioPlayer();

  static final PlayMusic _playMusic = PlayMusic._internal();

  factory PlayMusic() {
    return _playMusic;
  }

  PlayMusic._internal();

  AudioPlayer get audioPlayer => _audioPlayer;

  Future<int> playSongFromUrl(String url) async{
    int result = await _audioPlayer.play(url);
    await audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    return result;
  }

  Future<int> resumeMusic()async{
    int result = await _audioPlayer.resume();
    return result;
  }

  Future<int> pauseMusic() async{
    int result = await _audioPlayer.pause();
    return result;
  }

  Future<int> stopMusic() async{
    int result = await _audioPlayer.stop();
    await _audioPlayer.release();
    return result;
  }
}
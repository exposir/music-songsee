import 'package:audiocore_plugin/audiocore_plugin.dart';

class AudiocoreManager {
  static AudiocoreManager _instance;
  factory AudiocoreManager() => _getInstance();
  static AudiocoreManager get instance => _getInstance();
  AudiocoreManager._internal() {
    //initialize code
    AudiocorePlugin.init();
    AudiocorePlugin.initAudioCore();
  }
  static AudiocoreManager _getInstance() {
    if (_instance == null) {
      _instance = AudiocoreManager._internal();
    }
    return _instance;
  }

  Future<int> getSongDuration() async {
    return await AudiocorePlugin.getDuration();
  }

  Future<int> getPlayingPos() async {
    return await AudiocorePlugin.getPos();
  }
  
  void seek(int pos) {
    AudiocorePlugin.seek(pos);
  }

  void playingSong(String file_link) {
    AudiocorePlugin.playSong(file_link);
  }

  void pause() {
    AudiocorePlugin.pause();
  }

  void play() {
    AudiocorePlugin.play();
  }
}
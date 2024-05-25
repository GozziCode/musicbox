import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayingController extends GetxController {
  var isPlaying = false.obs;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playSong(String? uri) {
    try {
      isPlaying.value = true;
      audioPlayer.stop();
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      audioPlayer.play();
    } catch (e) {
      debugPrint(e.toString());
      audioPlayer.dispose();
    }
  }
}

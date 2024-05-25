import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicbox/app/modules/playing/controllers/playing_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../widgets/neu_box.dart';

class ControlButtons extends StatelessWidget {
  final PlayingController playingController;
  final SongModel song;
  const ControlButtons({
    super.key,
    required this.playingController,
    required this.song,
  });

 

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height / 2 * .15,
      child: Row(
        children: [
          Expanded(
              child: NeuBox(
            child: const Icon(Icons.skip_previous, size: 32),
          )),
          Expanded(
              flex: 2,
              child: InkWell(
                onTap: () {
                  if (playingController.isPlaying.value) {
                    playingController.playSong(song.uri);
                  } else {
                    playingController.audioPlayer.pause();
                  }
                  playingController.isPlaying.value =
                      !playingController.isPlaying.value;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() => NeuBox(
                        child: playingController.isPlaying.value == true
                            ? Icon(Icons.play_arrow, size: width * 0.07)
                            : Icon(Icons.pause, size: width * 0.07),
                      )),
                ),
              )),
          Expanded(
              child: NeuBox(
            child: const Icon(Icons.skip_next, size: 32),
          )),
        ],
      ),
    );
  }
}

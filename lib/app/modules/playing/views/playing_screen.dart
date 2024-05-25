import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicbox/app/modules/playing/controllers/playing_controller.dart';
import 'package:musicbox/app/widgets/neu_box.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../widgets/art_card.dart';
import '../widgets/control_buttons.dart';

class PlayingScreen extends StatelessWidget {
  const PlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final PlayingController playingController = Get.find<PlayingController>();
    SongModel? song = Get.arguments;
    return Scaffold(
      body: SafeArea(
        child: song == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.offAllNamed('/home'),
                        child: NeuBox(
                            width: width * .12,
                            height: height * .06,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: height * 0.026,
                            )),
                      ),
                      const Text('N O W   P L A Y I N G'),
                      InkWell(
                          onTap: (() {}),
                          child: NeuBox(
                            width: width * .12,
                            height: height * .06,
                            child: Icon(Icons.menu, size: height * 0.026),
                          )),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                      child: SingleChildScrollView(child: ArtCard(song: song))),
                  // SizedBox(
                  //   height: height * 0.01,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('0:00'),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shuffle,
                            size: height * 0.026,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.repeat,
                            size: height * 0.026,
                          )),
                      const Text('4:30')
                    ],
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  NeuBox(
                      child: LinearPercentIndicator(
                    lineHeight: height * 0.006,
                    percent: 0.7,
                    progressColor: Colors.lightGreenAccent,
                    backgroundColor: Colors.transparent,
                  )),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  ControlButtons(
                      playingController: playingController, song: song),
                  SizedBox(height: height / 15),
                ]),
              ),
      ),
      // floatingActionButton: ThemeButton(themeController: themeController),
    );
  }
}

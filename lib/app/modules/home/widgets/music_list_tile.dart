import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicbox/app/modules/playing/controllers/playing_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../core/values/colors.dart';
import '../../../widgets/neu_box.dart';

class MusicListTile extends StatelessWidget {
  final SongModel song;
  const MusicListTile({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final PlayingController playingController = Get.put(PlayingController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          song.uri;
          playingController.isPlaying.value == true;
          playingController.playSong(song.uri);

          Get.toNamed('/playing', arguments: song);
        },
        child: NeuBox(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: QueryArtworkWidget(
                  id: song.id,
                  type: ArtworkType.AUDIO,
                  artworkFit: BoxFit.cover,
                  artworkBorder: BorderRadius.zero,
                  artworkHeight: height * 0.06,
                  artworkWidth: width * 0.15,
                  artworkBlendMode: BlendMode.overlay,

                  //Music with no art work
                  nullArtworkWidget: Container(
                    height: height * 0.06,
                    width: width * 0.15,
                    decoration: BoxDecoration(color: Colors.grey[400]),
                    child: const Icon(Icons.music_note_rounded),
                  ),
                ),
              ),
              SizedBox(width: width / 3 * .06),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: height / 3 * .02),
                    Text(song.artist == '<unknown>' ? 'Unknown' : song.artist!,
                        style:
                            const TextStyle(fontSize: 16, color: greydarkShade))
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    debugPrint(height.toString());
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    // color: Colors.red,
                    size: 24,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

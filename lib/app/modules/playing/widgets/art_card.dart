import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../core/values/colors.dart';
import '../../../widgets/neu_box.dart';

class ArtCard extends StatelessWidget {
  final SongModel song;
  const ArtCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return NeuBox(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: height * 0.43,
              width: double.infinity,
              child: QueryArtworkWidget(
                id: song.id,
                type: ArtworkType.AUDIO,
                artworkFit: BoxFit.cover,
                artworkBorder: BorderRadius.zero,

                artworkBlendMode: BlendMode.overlay,

                //Music with no art work
                nullArtworkWidget: Container(
                  decoration: BoxDecoration(color: Colors.grey[400]),
                  child: const Icon(Icons.music_note_rounded),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        song.title,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                            fontSize: 18,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            color: greydarkShade),
                      ),
                      SizedBox(height: height / 3 * .02),
                      Text(
                          song.artist == '<unknown>' ? 'Unknown' : song.artist!,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 32,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

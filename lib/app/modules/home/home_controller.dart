import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:permission_handler/permission_handler.dart';



class HomeController extends GetxController {
  @override
  void onInit() async {
    // requestPermission();
    await Permission.storage.request();
    await querySong();

    super.onInit();
  }

  var allSongs = [].obs;
  var songs = [];

  // final AudioPlayer _audioPlayer = AudioPlayer();
  final audioQuary = OnAudioQuery();
  Future querySong() async {
    final listedSongs = await audioQuary.querySongs(
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true);

    songs.addAll(listedSongs);
    songs.removeWhere((song) => song.isNotification == true);
    allSongs.addAll(songs);

    return allSongs;
  }

  void searchQuery(String value) {
    allSongs.value = songs.where((element) {
      return element.title
              .toString().trim()
              .toLowerCase()
              .contains(value.toLowerCase()) ||
          element.artist.toString().trim().toLowerCase().contains(value.toLowerCase().trim());
    }).toList();
  }
}

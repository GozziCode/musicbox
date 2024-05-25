import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicbox/app/modules/home/home_controller.dart';
import 'package:musicbox/app/modules/home/widgets/shadow.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/theme_controller.dart';
import '../../../widgets/neu_box.dart';
import '../widgets/music_list_tile.dart';
import '../widgets/neu_search.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    List allSongs = homeController.allSongs;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NeuBox(
                          height: height * 0.08,
                          child: const Text(
                            'MusicBox',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              themeController.isdarkmode.value =
                                  !themeController.isdarkmode.value;
                              if (Get.isDarkMode) {
                                themeController
                                    .changeThemeMode(ThemeMode.light);
                                themeController.saveTheme(false);
                              } else {
                                themeController.changeThemeMode(ThemeMode.dark);
                                themeController.saveTheme(true);
                              }
                            },
                            child: Obx(() => NeuBox(
                                child: themeController.isdarkmode.value
                                    ? const Icon(Icons.dark_mode)
                                    : const Icon(Icons.light_mode)))),
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: NeuSearchBox(
                            child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextField(
                            onChanged: ((value) {
                              homeController.searchQuery(value);
                            }),
                            style: const TextStyle(fontSize: 18),
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.search),
                                // prefixIcon: Icon(Icons.search),
                                contentPadding: EdgeInsets.all(8),
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(fontSize: 18)),
                          ),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      // 'M u s i c  L i s t',
                      'Music List',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  Obx(() => Expanded(
                        child: homeController.allSongs.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Lottie.asset(
                                    'assets/json/68395-data-not-found.json',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: homeController.allSongs.length,
                                itemBuilder: ((context, index) {
                                  return MusicListTile(song: allSongs[index]);
                                }),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                physics: const BouncingScrollPhysics(),
                              ),
                      )),
                  // })
                ],
              ),
            ),
            Shadow()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            child: const Icon(
              Icons.play_arrow,
              size: 32,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

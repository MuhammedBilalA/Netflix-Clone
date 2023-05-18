import 'package:flutter/material.dart';
import 'package:netflix_clone/core/color/colors.dart';
import 'package:netflix_clone/core/widgets/lists.dart';
import 'package:netflix_clone/domain/trending/trending_functions.dart';
import 'package:video_player/video_player.dart';

class FastLaughsScreen extends StatefulWidget {
  const FastLaughsScreen({super.key});

  @override
  State<FastLaughsScreen> createState() => _FastLaughsScreenState();
}

class _FastLaughsScreenState extends State<FastLaughsScreen> {
  bool volbut = true;
  late VideoPlayerController _controller;
  late String videoPath;

  @override
  void initState() {
    super.initState();
    videoController(videoPath: videoPathList[0]);
  }

  void videoController({required videoPath}) {
    _controller = VideoPlayerController.network(videoPath)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            videoPathList.length,
            (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Stack(
                  children: [
                    SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      // color: Colors.purple,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: _controller.value.isInitialized
                            ? VideoPlayer(_controller)
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        height: 350,
                        width: 100,
                        // color: Colors.green,
                        child: Column(
                          children: [
                            FutureBuilder(
                              future: getImageTrending(),
                              builder: (context, snapshot) {
                                String? imagepath =
                                    snapshot.data?[index].poster_path;

                                return Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    // color: Colors.red,
                                  ),
                                  child: (snapshot.hasData)
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.network(
                                            images[index],
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Image.asset(
                                              'assets/images/netflixsmily.png')),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            iconList(
                                text: 'Lol',
                                icon: Icons.emoji_emotions_outlined),
                            iconList(text: 'MyList', icon: Icons.add),
                            iconList(text: 'Share', icon: Icons.share),
                            iconList(
                                text: 'Play', icon: Icons.play_arrow_rounded)
                          ],
                        ),
                      ),
                    ),
                    volumeControlingFunction()
                  ],
                ),
              );
            },
          ),
          onPageChanged: (value) {
            setState(() {
              //  _controller.pause();
              _controller.dispose();
            });

            videoController(videoPath: videoPathList[value]);
          },
        ),
      ),
    );
  }

  Positioned volumeControlingFunction() {
    return Positioned(
      bottom: 10,
      left: 20,
      child: GestureDetector(
          onTap: () {
            if (volbut) {
              volbut = false;
              _controller.setVolume(1);
            } else {
              volbut = true;
              _controller.setVolume(0);
            }
            setState(() {});
          },
          child: (volbut) ? const VolumeWidgetMute() : VolumeWidgetPlay()),
    );
  }

  SizedBox iconList({required String text, required var icon}) {
    return SizedBox(
      height: 65,
      width: 70,
      // color: Colors.t,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 27,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class VolumeWidgetMute extends StatelessWidget {
  const VolumeWidgetMute({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(94, 36, 36, 36),
      ),
      child: const Icon(
        Icons.volume_off,
        color: Colors.white,
      ),
    );
  }
}

class VolumeWidgetPlay extends StatelessWidget {
  VolumeWidgetPlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(94, 36, 36, 36),
      ),
      child: const Icon(
        Icons.volume_up,
        color: Colors.white,
      ),
    );
  }
}

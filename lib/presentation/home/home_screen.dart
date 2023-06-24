import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/core/widgets/center_indicator.dart';
import 'package:netflix_clone/domain/popular/polular_functions.dart';
import 'package:netflix_clone/domain/top_rated/top_rated_functions.dart';
import 'package:netflix_clone/domain/trending/trending.dart';
import 'package:netflix_clone/domain/trending/trending_functions.dart';
import 'package:netflix_clone/domain/up_coming/up_coming_functions.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List trendingList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getImageTrending(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Scaffold(
                  backgroundColor: Colors.black,
                  body: ValueListenableBuilder(
                    valueListenable: scrollNotifier,
                    builder: (context, value, child) {
                      return Stack(
                        children: [
                          NotificationListener<UserScrollNotification>(
                            onNotification: (notification) {
                              final ScrollDirection direction =
                                  notification.direction;
                              if (direction == ScrollDirection.forward) {
                                scrollNotifier.value = true;
                              } else if (direction == ScrollDirection.reverse) {
                                scrollNotifier.value = false;
                              }
                              return true;
                            },
                            child: ListView(
                              children: [
                                FutureBuilder(
                                  future: getImageTrending(),
                                  builder: (context, snapshot) {
                                    String? imagepath = snapshot
                                        .data?[snapshot.data!.length - 1]
                                        .poster_path;
                                    return snapshot.hasData
                                        ? Stack(children: [
                                            heroImages(
                                                context, imagepath, snapshot),
                                            //-----------------------------
                                            heroImageBottomButtons(),
                                          ])
                                        : CenterIndicator();
                                  },
                                ),
                                titleHomeScreen('Trending Now'),
                                trendingNowHorizondalScroll(),
                                titleHomeScreen('Popular'),
                                polularHorizondalScroll(),
                                titleHomeScreen(
                                    'Top 10 TV Shows in India Today'),
                                top10HorizondalScroll(),
                                titleHomeScreen('Up Coming'),
                                upComingHorizondalScroll(),
                              ],
                            ),
                          ),
                          scrollNotifier.value == true
                              ? AppBarWidget()
                              : SizedBox(),
                        ],
                      );
                    },
                  ),
                )
              : Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: CenterIndicator());
        },
      ),
    );
  }

  Padding upComingHorizondalScroll() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: getImageUpComing(),
                builder: (context, snapshot) {
                  String? imagePath = snapshot.data?[index].posterPath;
                  return snapshot.hasData
                      ? SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '$baseurl$imagePath',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                          child: CenterIndicator());
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 15,
              );
            },
            itemCount: 20),
      ),
    );
  }

  Padding top10HorizondalScroll() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: getImageTopRated(),
                builder: (context, snapshot) {
                  String? imagePath = snapshot.data?[index].posterPath;
                  return snapshot.hasData
                      ? Stack(children: [
                          SizedBox(
                            // width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '$baseurl$imagePath',
                                // width: 150,
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 110, left: 0),
                            child: BorderedText(
                              strokeColor: Colors.white,
                              strokeWidth: 10,
                              child: Text(
                                '${1 + index}',
                                style: TextStyle(
                                    fontSize: 130, color: Colors.black),
                              ),
                            ),
                          )
                        ])
                      : const Padding(
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                          child: CenterIndicator());
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 25,
              );
            },
            itemCount: 10),
      ),
    );
  }

  Padding polularHorizondalScroll() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: getImagePopular(),
                builder: (context, snapshot) {
                  String? imagePath = snapshot.data?[index].posterPath;
                  return snapshot.hasData
                      ? SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '$baseurl$imagePath',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                          child: CenterIndicator());
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 15,
              );
            },
            itemCount: 20),
      ),
    );
  }

  Padding trendingNowHorizondalScroll() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: getImageTrending(),
                builder: (context, snapshot) {
                  String? imagePath = snapshot.data?[index].poster_path;
                  return snapshot.hasData
                      ? SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '$baseurl$imagePath',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                          child: CenterIndicator());
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemCount: 20),
      ),
    );
  }

  Padding heroImageBottomButtons() {
    return Padding(
      padding: const EdgeInsets.only(top: 550),
      child: Container(
        width: double.infinity,
        height: 100,
        color: Colors.transparent,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 48.0, top: 25),
              child: Column(
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 27,
                  ),
                  Text(
                    'My List',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 58.0),
              child: Container(
                height: 45,
                width: 105,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Spacer(
                      flex: 1,
                    ),
                    Icon(
                      Icons.play_arrow_rounded,
                      size: 32,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Play',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(
                      flex: 2,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 65, top: 25),
              child: Column(
                children: const [
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                    size: 27,
                  ),
                  Text(
                    'info',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox heroImages(BuildContext context, String? imagepath,
      AsyncSnapshot<List<Result>> snapshot) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        child: PageView(
          children: [
            Image.network(
              (baseurl + imagepath!),
              fit: BoxFit.cover,
            ),
            Image.network(
              (baseurl +
                  ((snapshot.data?[snapshot.data!.length - 5].poster_path) ??
                      '')),
              fit: BoxFit.cover,
            ),
            Image.network(
              (baseurl +
                  ((snapshot.data?[snapshot.data!.length - 2].poster_path) ??
                      '')),
              fit: BoxFit.cover,
            )
          ],
        ));
  }

  SizedBox titleHomeScreen(String title) {
    return SizedBox(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 10),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: double.infinity,
      color: Colors.black.withOpacity(0.4),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                height: 56,
                width: 35,
                child: Image.asset(
                  'assets/images/netflixlogo.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(
                flex: 30,
              ),
              const Icon(
                Icons.cast,
                size: 35,
                color: Colors.white,
              ),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                width: 35,
                child: Image.asset(
                  'assets/images/netflixsmily.png',
                  width: 35,
                ),
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Spacer(
                flex: 1,
              ),
              Text(
                'TV Shows',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                'Movies',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                'Catogories',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Spacer(
                flex: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}

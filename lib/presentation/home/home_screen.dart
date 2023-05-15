import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/domain/popular/polular_functions.dart';
import 'package:netflix_clone/domain/top_rated/top_rated_functions.dart';
import 'package:netflix_clone/domain/trending/trending_functions.dart';
import 'package:netflix_clone/domain/up_coming/up_coming_functions.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List trendingList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, value, child) {
            return Stack(
              children: [
                NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;
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
                          String? imagepath = snapshot.data?[18].poster_path;
                          return snapshot.hasData
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  width: double.infinity,
                                  child: Image.network(
                                    '$baseurl$imagepath',
                                    fit: BoxFit.cover,
                                  ))
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                  ),
                                );
                        },
                      ),
                      titleHomeScreen('Trending Now'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 250,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return FutureBuilder(
                                  future: getImageTrending(),
                                  builder: (context, snapshot) {
                                    String? imagePath =
                                        snapshot.data?[index].poster_path;
                                    return snapshot.hasData
                                        ? SizedBox(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                '$baseurl$imagePath',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                25, 15, 25, 15),
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: Colors.red,
                                            )),
                                          );
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
                      ),
                      titleHomeScreen('Popular'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 250,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return FutureBuilder(
                                  future: getImagePopular(),
                                  builder: (context, snapshot) {
                                    String? imagePath =
                                        snapshot.data?[index].posterPath;
                                    return snapshot.hasData
                                        ? SizedBox(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                '$baseurl$imagePath',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                25, 15, 25, 15),
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: Colors.red,
                                            )),
                                          );
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
                      ),
                      titleHomeScreen('Top Rated'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 250,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return FutureBuilder(
                                  future: getImageTopRated(),
                                  builder: (context, snapshot) {
                                    String? imagePath =
                                        snapshot.data?[index].posterPath;
                                    return snapshot.hasData
                                        ? SizedBox(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                '$baseurl$imagePath',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                25, 15, 25, 15),
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: Colors.red,
                                            )),
                                          );
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
                      ),
                      titleHomeScreen('Up Coming'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          height: 250,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return FutureBuilder(
                                  future: getImageUpComing(),
                                  builder: (context, snapshot) {
                                    String? imagePath =
                                        snapshot.data?[index].posterPath;
                                    return snapshot.hasData
                                        ? SizedBox(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                '$baseurl$imagePath',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                25, 15, 25, 15),
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: Colors.red,
                                            )),
                                          );
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
                      ),
                    ],
                  ),
                ),
                scrollNotifier.value == true ? AppBarWidget() : SizedBox()
              ],
            );
          },
        ),
      ),
    );
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
      color: Colors.transparent,
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
                child: Image.network(
                  'https://wallpapers.com/images/high/netflix-profile-pictures-5yup5hd2i60x7ew3.webp',
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

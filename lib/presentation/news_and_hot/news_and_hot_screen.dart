import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/color/colors.dart';
import 'package:netflix_clone/core/widgets/center_indicator.dart';
import 'package:netflix_clone/domain/trending/trending_functions.dart';
import 'package:netflix_clone/presentation/news_and_hot/widgets/coming_soon.dart';
import 'package:netflix_clone/presentation/news_and_hot/widgets/everyone_watching.dart';

class NewsAndHotScreen extends StatelessWidget {
  const NewsAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(130),
              child: Column(
                children: [
                  newsandHotAppBar(),
                  TabBar(
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.white,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      tabs: [
                        Tab(
                          text: '🍿 Coming Soon',
                        ),
                        Tab(
                          text: "👀 Everyone's Watching",
                        ),
                      ])
                ],
              ),
            ),
            backgroundColor: blackColor,
            body: FutureBuilder(
              future: getImageTrending(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? TabBarView(
                        children: [
                          ComingSoon(),
                          EveryoneWatching(),
                        ],
                      )
                    : CenterIndicator();
              },
            )),
      ),
    );
  }

  Container newsandHotAppBar() {
    return Container(
                  // color: Colors.red,
                  width: double.infinity,
                  height: 70,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        'New & Hot',
                        style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
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
                );
  }
}

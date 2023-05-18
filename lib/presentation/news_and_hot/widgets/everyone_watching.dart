import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/domain/now_playing/now_playing_functions.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return FutureBuilder(
              future: getImageNowPlaying(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? SizedBox(
                        height: 500,
                        width: double.infinity,
                        // color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${snapshot.data?[index].title}',
                              style: GoogleFonts.nunito(
                                  color: const Color.fromARGB(255, 212, 210, 210),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                // color: Colors.red,
                                height: 80,
                                width: 600,
                                child: Text(
                                  '${snapshot.data?[index].overview}',
                                  style: GoogleFonts.nunito(
                                      color: const Color.fromARGB(255, 212, 210, 210),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Stack(children: [
                              SizedBox(
                                height: 270,
                                width: 600,
                                // color: Colors.purple,
                                child: Image.network(
                                  '$baseurl${snapshot.data?[index].backdropPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Positioned(
                                  left: 380,
                                  top: 230,
                                  child: Icon(
                                    Icons.volume_off,
                                    size: 30,
                                  ))
                            ]),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  // height: 127,
                                  // color: Colors.red,
                                  child: Center(
                                    child: Text(
                                      ' LOST \n    IN \nSPACE',
                                      style: GoogleFonts.nunito(
                                        color:
                                            const Color.fromARGB(255, 212, 210, 210),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(
                                  flex: 1,
                                ),
                                Container(
                                  width: 200,
                                  // height: 110,
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.send_outlined,
                                              color: Color.fromARGB(
                                                  255, 172, 171, 171),
                                              size: 25,
                                            ),
                                            Text(
                                              'Share',
                                              style: GoogleFonts.nunito(
                                                color: const Color.fromARGB(
                                                    255, 172, 171, 171),
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add,
                                              color: Color.fromARGB(
                                                  255, 172, 171, 171),
                                              size: 25,
                                            ),
                                            Text(
                                              'My List',
                                              style: GoogleFonts.nunito(
                                                color: const Color.fromARGB(
                                                    255, 172, 171, 171),
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.play_arrow_outlined,
                                              color: Color.fromARGB(
                                                  255, 172, 171, 171),
                                              size: 25,
                                            ),
                                            Text(
                                              'Play',
                                              style: GoogleFonts.nunito(
                                                color: const Color.fromARGB(
                                                    255, 172, 171, 171),
                                                fontSize: 13,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              });
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: 20);
  }
}

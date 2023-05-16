import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/core/color/colors.dart';
import 'package:netflix_clone/domain/popular/polular_functions.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: blackColor,
          body: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'Downloads',
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
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  const Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.white,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Smart Downloads',
                    style: GoogleFonts.nunito(
                      color: const Color.fromARGB(255, 199, 196, 196),
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(
                    flex: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Introducing Downloads For You',
                style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'We will download a personalised selection of',
                style: GoogleFonts.nunito(
                  color: const Color.fromARGB(255, 134, 131, 131),
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "movies and shows for you,so there's",
                style: GoogleFonts.nunito(
                  color: const Color.fromARGB(255, 134, 131, 131),
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                'always something to watch on your',
                style: GoogleFonts.nunito(
                  color: const Color.fromARGB(255, 134, 131, 131),
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'device',
                style: GoogleFonts.nunito(
                  color: const Color.fromARGB(255, 134, 131, 131),
                  fontSize: 18,
                ),
              ),
              FutureBuilder(
                  future: getImagePopular(),
                  builder: (context, snapshot) {
                    String? imagepath = snapshot.data?[18].posterPath;

                    return snapshot.hasData
                        ? Stack(children: [
                            Container(
                              width: double.infinity,
                              height: 420,
                              color: Colors.transparent,
                              child: Center(
                                child: Container(
                                  height: 330,
                                  width: 330,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color:
                                        const Color.fromARGB(255, 86, 84, 84),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 105,
                              left: 60,
                              child: Transform.rotate(
                                angle: -0.43,
                                child: Container(
                                  height: 240,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      '$baseurl$imagepath',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 101,
                              left: 190,
                              child: Transform.rotate(
                                angle: 0.4,
                                child: Container(
                                  height: 240,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      '$baseurl${snapshot.data?[3].posterPath}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 80,
                              left: 123,
                              child: Container(
                                height: 270,
                                width: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.purple),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    '$baseurl${snapshot.data?[6].posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          ])
                        : const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          );
                  }),
              Container(
                width: MediaQuery.of(context).size.width * 0.97,
                height: 53,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Setup',
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 53,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'See  What You Can Download',
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/color/colors.dart';

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
              ),
              Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.white,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Smart Downloads',
                    style: GoogleFonts.nunito(
                      color: Color.fromARGB(255, 199, 196, 196),
                      fontSize: 16,
                    ),
                  ),
                  Spacer(
                    flex: 20,
                  )
                ],
              ),
              SizedBox(
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
              SizedBox(
                height: 5,
              ),
              Text(
                'We will download a personalised selection of',
                style: GoogleFonts.nunito(
                  color: Color.fromARGB(255, 134, 131, 131),
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "movies and shows for you,so there's",
                style: GoogleFonts.nunito(
                  color: Color.fromARGB(255, 134, 131, 131),
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'always something to watch on your',
                style: GoogleFonts.nunito(
                  color: Color.fromARGB(255, 134, 131, 131),
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'device',
                style: GoogleFonts.nunito(
                  color: Color.fromARGB(255, 134, 131, 131),
                  fontSize: 18,
                ),
              ),
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: 420,
                  color: Colors.transparent,
                  child: Center(
                    child: Container(
                      height: 340,
                      width: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Color.fromARGB(255, 51, 48, 48),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 95,
                  left: 70,
                  child: Transform.rotate(
                    angle: -0.5,
                    child: Container(
                      height: 250,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                    ),
                  ),
                ),
                Positioned(
                  top: 95,
                  left: 180,
                  child: Transform.rotate(
                    angle: 0.5,
                    child: Container(
                      height: 250,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 123,
                  child: Container(
                    height: 280,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple),
                  ),
                )
              ])
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/domain/trending/trending.dart';
import 'package:netflix_clone/domain/trending/trending_functions.dart';

class ComingSoon extends StatelessWidget {
  ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    String? convertedDate;
    int? convertedMonth;
    String? stringdate;
    return ListView.separated(
        itemBuilder: (context, index) {
          return FutureBuilder(
              future: getImageTrending(),
              builder: (context, snapshot) {
                String? imagePath = snapshot.data?[index].backdrop_path;
                String? date = snapshot.data?[index].release_date;

                if (date != null) {
                  convertedMonth = int.parse(date[5] + date[6]);
                  convertedDate = date[8] + date[9];
                } else {
                  convertedMonth = 1;
                  convertedDate = '18';
                }

                stringdate =
                    dateConversion(snapshot, index, convertedMonth, stringdate);

                return snapshot.hasData
                    ? Container(
                        width: double.infinity,
                        height: 500,
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 500,
                              // color: Colors.red,
                              child: Column(
                                children: [
                                  Text(
                                    '${stringdate}',
                                    style: GoogleFonts.nunito(
                                        color:
                                            Color.fromARGB(255, 212, 210, 210),
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '$convertedDate',
                                    style: GoogleFonts.nunito(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 270,
                                      width: 360,
                                      child: Image.network(
                                        '$baseurl$imagePath',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        left: 320,
                                        top: 220,
                                        child: Icon(
                                          Icons.volume_off_sharp,
                                          size: 25,
                                          color: Color.fromARGB(
                                              255, 238, 234, 234),
                                        ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 290,
                                      child: Text(
                                        '${snapshot.data?[index].original_title}',
                                        style: GoogleFonts.lobster(
                                            color: Color.fromARGB(
                                                255, 226, 225, 225),
                                            fontSize: 33,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 160,
                                    // ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.notifications_none,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Remind Me',
                                          style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontSize: 7,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(
                                          'info',
                                          style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Text(
                                  'Coming On $convertedDate-$stringdate',
                                  style: GoogleFonts.nunito(
                                      color: Color.fromARGB(255, 146, 146, 146),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/netflixlogo.png',
                                      width: 20,
                                    ),
                                    Text(
                                      'FILM',
                                      style: GoogleFonts.nunito(
                                          color:
                                              Color.fromARGB(255, 97, 97, 97),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 350,
                                  child: Text(
                                    '${snapshot.data?[index].original_title}',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.nunito(
                                        color:
                                            Color.fromARGB(255, 255, 254, 254),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 360,
                                  height: 110,
                                  child: Text(
                                    '${snapshot.data?[index].overview}',
                                    style: GoogleFonts.nunito(
                                        color:
                                            Color.fromARGB(255, 119, 118, 118),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.clip,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                        color: Colors.yellow,
                      ));
              });
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 25,
          );
        },
        itemCount: 20);
  }

  String? dateConversion(AsyncSnapshot<List<Result>> snapshot, int index,
      int? converteddate, String? stringdate) {
    if (converteddate == 1) {
      stringdate = 'JAN';
    } else if (converteddate == 2) {
      stringdate = 'FEB';
    } else if (converteddate == 3) {
      stringdate = 'MAR';
    } else if (converteddate == 4) {
      stringdate = 'APL';
    } else if (converteddate == 5) {
      stringdate = 'MAY';
    } else if (converteddate == 6) {
      stringdate = 'JUN';
    } else if (converteddate == 7) {
      stringdate = 'JUL';
    } else if (converteddate == 8) {
      stringdate = 'AUG';
    } else if (converteddate == 9) {
      stringdate = 'SEP';
    } else if (converteddate == 10) {
      stringdate = 'OCT';
    } else if (converteddate == 11) {
      stringdate = 'NOV';
    } else if (converteddate == 12) {
      stringdate = 'DEC';
    }
    return stringdate;
  }
}

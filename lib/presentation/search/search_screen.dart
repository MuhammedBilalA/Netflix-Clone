import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/apikey.dart';
import 'package:netflix_clone/core/color/colors.dart';
import 'package:netflix_clone/domain/search/search_functions.dart';

TextEditingController searchControllor = TextEditingController();
ValueNotifier searchScreenNotifier = ValueNotifier([]);

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: blackColor,
          body: ValueListenableBuilder(
            valueListenable: searchScreenNotifier,
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: TextFormField(
                        onChanged: (value) {
                          getimageSearchGrid(value.trim());
                          searchScreenNotifier.notifyListeners();
                        },
                        controller: searchControllor,
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 208, 205, 205)),
                            prefixIcon: const Icon(
                              Icons.search,
                              // size: 26,
                              color: Color.fromARGB(255, 208, 205, 205),
                            ),
                            fillColor: const Color.fromARGB(255, 106, 106, 106),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      (searchControllor.text.isEmpty)
                          ? 'Top Searches'
                          : 'Movies & TV',
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  (searchControllor.text.isEmpty)
                      ? Expanded(
                          child: FutureBuilder(
                          future: getimageSearch(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? ListView.separated(
                                    itemBuilder: (context, index) {
                                      String? imagepath =
                                          snapshot.data?[index].backdropPath;
                                      String? titlepath =
                                          snapshot.data?[index].title;

                                      return SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                width: 160,
                                                height: 95,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    '$baseurl${(imagepath != null) ? imagepath : '/99NBEpQEM4uLItZY2RquqdqdSXM.jpg'}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8.0,
                                              ),
                                              child: SizedBox(
                                                width: 190,
                                                child: Text(
                                                  '${(titlepath != null) ? titlepath : 'Movie'}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.nunito(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons
                                                      .play_circle_outline_sharp,
                                                  size: 33,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 10,
                                      );
                                    },
                                    itemCount: snapshot.data!.length)
                                : const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.red,
                                    ),
                                  );
                          },
                        ))
                      : Expanded(
                          child: FutureBuilder(
                          future:
                              getimageSearchGrid(searchControllor.text.trim()),
                          builder: (context, snapshot) {
                            return snapshot.data != null &&
                                    snapshot.data!.isNotEmpty
                                ? GridView.builder(
                                    itemCount: snapshot.data!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisExtent: 220,
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8),
                                    itemBuilder: (context, index) {
                                      String? imagepath =
                                          snapshot.data?[index].posterPath;
                                      return snapshot.hasData
                                          ? Container(
                                              height: 80,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.network(
                                                  '$baseurl${(imagepath != null) ? imagepath : '/7syc6DmjSeUSNp4VSGELfHQW17Q.jpg'}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : const Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.red,
                                              ),
                                            );
                                    },
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.red,
                                    ),
                                  );
                          },
                        ))
                ],
              );
            },
          )),
    );
  }
}

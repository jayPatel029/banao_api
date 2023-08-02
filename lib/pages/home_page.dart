import 'dart:convert';

import 'package:banao_t1/utils/api_1_model.dart';
import 'package:banao_t1/utils/api_2_model.dart';
import 'package:banao_t1/widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/cards.dart';
import '../widgets/cards2.dart';
import '../widgets/cards3.dart';
import '../widgets/panels.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List<ApiOneModel> apiOneDataList = [];
  List<Item> items = [];
  @override
  void initState () {
    super.initState();
    getData();
  }

  Future<void> getData()async{
    await getDataOne();
    await  getDataTwo();

  }


  Future<void> getDataOne() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs'));

    if (response.statusCode == 200) {

      setState(() {
        ApiOneModel apiOneModel = ApiOneModel.fromJson(jsonDecode(response.body));
        items = apiOneModel.items;
      });
    } else {
      print('failed to load data');
      throw Exception('Failed to load data');
    }
  }

  // List<ApiTwoModel> apiTwoDataList = [];
  List<ItemTwo> itemsTwo = [];

  Future<void> getDataTwo() async {
    final response = await http.get(
        Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));

    if (response.statusCode == 200) {

      setState(() {
        ApiTwoModel apiTwoModel = ApiTwoModel.fromJson(jsonDecode(response.body));
        // items = apiOneModel.items;
        itemsTwo = apiTwoModel.items;

      });
    } else {
      print('failed to load data');
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_outlined,
            color: Colors.grey,
            size: 30,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(
              Icons.chat,
              color: Colors.grey,
              size: 30,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Padding(
            padding: EdgeInsets.only(right: 9),
            child: Icon(
              Icons.notifications_none_outlined,
              color: Colors.grey,
              size: 30,
            ),
          )
        ],
      ),
      body:
    SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // column for hello priya & what do...
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Priya!",
                        style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(fontSize: 30),
                        ),
                      ),
                      Text(
                        'What do you want to learn today?',
                        style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                const HomePanels(),
                const SizedBox(
                  height: 20,
                ),

                // programs... , view all btn..
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    14,
                    8,
                    8,
                    8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Programs for you',
                        style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'View all',
                            style: GoogleFonts.robotoSlab(
                              textStyle:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 320,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:
                    ListView.builder(
                      scrollDirection: Axis.horizontal  ,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        // List<Item> items = apiData[index].items;
                        return HomeCards(
                          imgA: 'assets/img.png',
                          titleA: items[index].category,
                          subtitleA: items[index].name,
                          lessonsA: items[index].lesson.toString(),
                        );
                      },
                    ),
                  ),
                ),


                // Events and expriences ....
                const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    14,
                    8,
                    8,
                    8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Events and Experiences',
                        style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'View all',
                            style: GoogleFonts.robotoSlab(
                              textStyle:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 330,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        HomeCards2(
                          lessonsA: '13 Feb, Sunday',
                          imgA: 'assets/img_1.png',
                          titleA: 'Babycare ',
                          subtitleA: 'Understanding of human behaviour',
                        ),
                        HomeCards2(
                          lessonsA: '13 Feb, Sunday',
                          imgA: 'assets/img_1.png',
                          titleA: 'Babycare',
                          subtitleA: 'Understanding of human behaviour',
                        ),
                        HomeCards2(
                          lessonsA: '13 Feb, Sunday',
                          imgA: 'assets/img_1.png',
                          titleA: 'Babycare',
                          subtitleA: 'Understanding of human behaviour',
                        ),
                        HomeCards2(
                          lessonsA: '13 Feb, Sunday',
                          imgA: 'assets/img_1.png',
                          titleA: 'Babycare',
                          subtitleA: 'Understanding of human behaviour',
                        ),
                      ],
                    ),
                  ),
                ),

                // lessons for you
                const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    14,
                    8,
                    8,
                    8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Lessons for you',
                        style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'View all',
                            style: GoogleFonts.robotoSlab(
                              textStyle:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 320,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:
                    ListView.builder(
                      scrollDirection: Axis.horizontal  ,
                      itemCount: itemsTwo.length,
                      itemBuilder: (context, index) {
                        // List<Item> items = apiData[index].items;
                        return HomeCards3(
                          imgA: 'assets/img.png',
                          titleA: itemsTwo[index].category,
                          subtitleA: itemsTwo[index].name,
                          duration: itemsTwo[index].duration.toString(),
                          isLocked: itemsTwo[index].locked,

                          // lockIcon: ,

                        );
                      },
                    ),
                  ),
                ),





                // SizedBox(
                //   height: 320,
                //   child: Padding(
                //     padding: const EdgeInsets.all(9.0),
                //     child: ListView(
                //       scrollDirection: Axis.horizontal,
                //       children: const [
                //         HomeCards3(
                //           lessonsA: '3 min',
                //           imgA: 'assets/img_1.png',
                //           titleA: 'Babycare ',
                //           subtitleA: 'Understanding of human behaviour',
                //         ),
                //         HomeCards3(
                //           lessonsA: '1 min',
                //           imgA: 'assets/img_1.png',
                //           titleA: 'Babycare',
                //           subtitleA: 'Understanding of human behaviour',
                //         ),
                //         HomeCards3(
                //           lessonsA: '1 min',
                //           imgA: 'assets/img_1.png',
                //           titleA: 'Babycare',
                //           subtitleA: 'Understanding of human behaviour',
                //         ),
                //         HomeCards3(
                //           lessonsA: '3 min',
                //           imgA: 'assets/img_1.png',
                //           titleA: 'Babycare',
                //           subtitleA: 'Understanding of human behaviour',
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

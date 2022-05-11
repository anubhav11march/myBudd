import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_savedcards.dart';
import 'package:mybud/api_service/get_user_image.dart';
import 'package:mybud/api_service/get_user_profile.dart';
import 'package:mybud/api_service/swipe_cards.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/screen_bio_three.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:provider/provider.dart';

class SavedProfileScreen extends StatefulWidget {
  static const String route = '/notification_screen';
  const SavedProfileScreen({Key? key}) : super(key: key);

  @override
  _SavedProfileScreenState createState() => _SavedProfileScreenState();
}

class _SavedProfileScreenState extends State<SavedProfileScreen> {
  var cards;
  var prof;
  saved() async {
    cards = await getsavedCards(tokenProfile?.token);
    prof = await getdetails(tokenProfile?.token);
    return prof;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );
    Widget spacehort = SizedBox(
      width: size.width * 0.06,
    );
    Widget spacehort1 = SizedBox(
      width: size.width * 0.35,
    );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.02,
    );
    Widget spacevert2 = SizedBox(
      height: size.height * 0.4,
    );
    final swipeprov = Provider.of<SwipeCards>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFE5E5E5),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_widthScale * 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          //  Navigator.of(context).popAndPushNamed(MainPage.route);
                          //Scaffold.of(context).openDrawer();
                        },
                        child: Image.asset(
                          "assets/Vector.png",
                          height: _heightScale * 24,
                          width: _widthScale * 27,
                        )),
                    SizedBox(
                      width: _widthScale * 15,
                    ),
                    Text(
                      "Saved Profiles",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF775594),
                        fontSize: _widthScale * 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: saved(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: Text(
                  "No Profiles Saved",
                style: GoogleFonts.poppins(
                    color: Color(0xFF263238),
                    fontSize: 18 * _widthScale,
                    fontWeight: FontWeight.w400),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 23 * _widthScale, vertical: 10 * _heightScale),
              child: Container(
                alignment: Alignment.center,
                height: 700 * _heightScale,
                width: 350 * _widthScale,
                child: cards == null
                    ? CircularProgressIndicator(color: Color(0xFFA585C1))
                    : ListView.builder(
                    itemCount: cards == null ? 0 : cards['data'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8 * _heightScale),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 0,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.0 * _heightScale),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xFFA585C1),
                                  backgroundImage: NetworkImage(
                                    cards['data'][index]['result'][0]['image']
                                    ['location'],
                                  ),
                                ),
                                title: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ScreenBioThree(
                                              image: cards['data'][index]['result']
                                              [0]['image']['location'],
                                              name: cards['data'][index]
                                              ['result'][0]['username'],
                                              profession: cards['data']
                                              [index]['result'][0]
                                              ['Info']['profession'],
                                              details: cards['data'][index]['result']
                                              [0]['Info']['details'],
                                              location: cards['data'][index]
                                              ['result'][0]['location'],
                                              objective: cards['data'][index]['result'][0]['objective']['title'],
                                              skills: cards['data'][index]['result'][0]['skillsets'],
                                              swipedby: prof['_id'],
                                              swipedon: cards['data'][index]
                                              ['result'][0]['_id'],
                                            )));
                                  },
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cards['data'][index]['result'][0]
                                        ['username'],
                                        style: GoogleFonts.poppins(
                                            color: Color(0xFF5E3E79),
                                            fontSize: 18 * _widthScale,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        cards['data'][index]['result'][0]
                                        ['Info']['profession'],
                                        style: GoogleFonts.poppins(
                                            color: Color(0xFF263238),
                                            fontSize: 10 * _widthScale,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: Container(
                                  width: 60 * _widthScale,
                                  child: GestureDetector(
                                    onTap: () async {
                                      await swipeprov.addDetails(
                                          swipedby: prof['_id'],
                                          swipedon: cards['data'][index]
                                          ['result'][0]['_id'],
                                          status: '2');
                                      Fluttertoast.showToast(
                                          msg: 'Profile deleted !');
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Delete',
                                          style: GoogleFonts.poppins(
                                              color: Color(0xFFEF4C48),
                                              fontSize: 12 * _widthScale,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          width: 3 * _widthScale,
                                        ),
                                        Icon(Icons.delete,
                                            size: 15,
                                            color: Color(0xFFEF4C48))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )

                        //  Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       color: Colors.white),
                        //   height: 88 * _heightScale,
                        //   width: 328 * _widthScale,
                        //   child: Row(
                        //     children: [
                        //       Padding(
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: 9, vertical: 17),
                        //         child: CircleAvatar(
                        //           radius: 25,
                        //           backgroundColor: Color(0xFFA585C1),
                        //           backgroundImage: NetworkImage(
                        //             cards['data'][index]['result'][0]['image']
                        //                 ['location'],
                        //           ),
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: EdgeInsets.symmetric(vertical: 17),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               cards['data'][index]['result'][0]
                        //                   ['username'],
                        //               style: GoogleFonts.poppins(
                        //                   color: Color(0xFF5E3E79),
                        //                   fontSize: 18 * _widthScale,
                        //                   fontWeight: FontWeight.w600),
                        //             ),
                        //             GestureDetector(
                        //               onTap: () async {
                        //                 await swipeprov.addDetails(
                        //                     swipedby: prof['_id'],
                        //                     swipedon:  cards['data'][index]['result'][0]
                        //                   ['_id'],
                        //                     status: '2');
                        //               },
                        //               child: Row(
                        //                 children: [
                        //                   Text(
                        //                     cards['data'][index]['result'][0]
                        //                         ['Info']['profession'],
                        //                     style: GoogleFonts.poppins(
                        //                         color: Color(0xFF263238),
                        //                         fontSize: 10 * _widthScale,
                        //                         fontWeight: FontWeight.w400),
                        //                   ),
                        //                   SizedBox(
                        //                     width: 145 * _widthScale,
                        //                   ),
                        //                   Text(
                        //                     'Delete',
                        //                     style: GoogleFonts.poppins(
                        //                         color: Color(0xFFEF4C48),
                        //                         fontSize: 12 * _widthScale,
                        //                         fontWeight: FontWeight.w400),
                        //                   ),
                        //                   SizedBox(
                        //                     width: 3 * _widthScale,
                        //                   ),
                        //                   Icon(Icons.delete,
                        //                       size: 15,
                        //                       color: Color(0xFFEF4C48))
                        //                 ],
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      );
                    }),
              ),
            );
          }
        },
      ),
    );
  }

  Widget profile() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Container(
      width: _widthScale * 71,
      height: _heightScale * 71,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFA585C1),
          ),
          borderRadius: BorderRadius.all(Radius.circular(50))),
    );
  }

  Widget people() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Container(
      width: _widthScale * 328,
      height: _heightScale * 78,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        // border: Border.all(
        //   color: Color(0xFFA585C1),
        // ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10 * _widthScale,
          ),
          Container(
            width: _widthScale * 49,
            height: _heightScale * 49,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFA585C1),
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
          SizedBox(
            width: 10 * _widthScale,
          ),
          Column(
            children: [
              SizedBox(
                height: 15 * _heightScale,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " Alex Chamber",
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF5E3E79),
                      fontSize: _widthScale * 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                " Lorem ipsum dolor sit amet, consectetur.r",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF263238),
                  fontSize: _widthScale * 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

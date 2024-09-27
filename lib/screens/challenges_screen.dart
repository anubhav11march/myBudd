import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_all_challenges.dart';
import 'package:mybud/screens/challenge_bio_screen.dart';
import 'package:mybud/screens/view_challenges_screen.dart';
import 'package:mybud/widgets/token_profile.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // challenges();
  }

  var chall;
  challenges() async {
    chall = await getAllChallenges(tokenProfile?.token);
    return chall;
    // print('objectlo${chall['data'][0]["Lifestyle"]}');
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return FutureBuilder(
        future: challenges(),
        builder: (context, snapShot) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 21 * _widthScale,
                    ),
                    Text(
                      "Lifestyle Challenges",
                      style: GoogleFonts.poppins(
                          fontSize: 20 * _widthScale,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA585C1)),
                    ),
                    SizedBox(
                      width: 70 * _widthScale,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewChallengesScreen(
                                      title: "Lifestyle Challenges",
                                      name: chall['data'][0]["Lifestyle"],
                                    )));
                      },
                      child: Text(
                        "View all",
                        style: GoogleFonts.poppins(
                            fontSize: 13 * _widthScale,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA585C1).withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 180 * _heightScale,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: chall == null ? 0 : 2,

                      //chall['data'][0]["Lifestyle"].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChallengeBioScreen(
                                          name: chall['data'][0]["Lifestyle"]
                                              [index],
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 21 * _widthScale,
                                vertical: 8 * _heightScale),
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              child: ListTile(
                                leading: index % 2 == 0
                                    ? Image.asset('assets/Vector (16).png')
                                    : Image.asset('assets/Vector (15).png'),
                                title: Column(
                                  children: [
                                    Text(
                                      chall == null
                                          ? ''
                                          : chall['data'][0]["Lifestyle"]
                                              [index],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12 * _widthScale,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF4D4D4D)),
                                    ),
                                    Text(
                                      'Tap to start the challenge',
                                      style: GoogleFonts.poppins(
                                          fontSize: 11 * _widthScale,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFB9B9B9)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                        // return InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => ChallengeBioScreen(
                        //                   name: chall['data'][0]["Lifestyle"]
                        //                       [index],
                        //                 )));
                        //   },
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 21 * _widthScale,
                        //         vertical: 10 * _heightScale),
                        //     child: Row(
                        //       children: [
                        //         Container(
                        //           decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius: BorderRadius.only(
                        //                   topLeft: Radius.circular(7),
                        //                   bottomLeft: Radius.circular(7))),
                        //           width: 47 * _widthScale,
                        //           height: 72 * _heightScale,
                        //           child: Image.asset('assets/Vector (15).png'),
                        //         ),
                        //         Column(
                        //           children: [
                        //             Container(
                        //               padding: EdgeInsets.only(
                        //                   top: 6 * _heightScale),
                        //               decoration: BoxDecoration(
                        //                   color: Colors.white,
                        //                   borderRadius: BorderRadius.only(
                        //                     topRight: Radius.circular(7),
                        //                   )),
                        //               // alignment: Alignment.centerLeft,
                        //               height: 42 * _heightScale,
                        //               width: 278 * _widthScale,
                        //               //  color: Colors.white,
                        //               child: Text(
                        //                 chall == null
                        //                     ? ''
                        //                     : chall['data'][0]["Lifestyle"]
                        //                         [index],
                        //                 style: GoogleFonts.poppins(
                        //                     fontSize: 12 * _widthScale,
                        //                     fontWeight: FontWeight.w400,
                        //                     color: Color(0xFF4D4D4D)),
                        //               ),
                        //             ),
                        //             Container(
                        //               decoration: BoxDecoration(
                        //                   color: Colors.white,
                        //                   borderRadius: BorderRadius.only(
                        //                       bottomRight: Radius.circular(7))),
                        //               alignment: Alignment.center,
                        //               height: 30 * _heightScale,
                        //               width: 278 * _widthScale,
                        //               // color: Colors.white,
                        //               child: Text(
                        //                 'Tap to start the challenge',
                        //                 style: GoogleFonts.poppins(
                        //                     fontSize: 11 * _widthScale,
                        //                     fontWeight: FontWeight.w400,
                        //                     color: Color(0xFFB9B9B9)),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );
                      }),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 21 * _widthScale,
                    ),
                    Text(
                      "Health",
                      style: GoogleFonts.poppins(
                          fontSize: 20 * _widthScale,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA585C1)),
                    ),
                    SizedBox(
                      width: 205 * _widthScale,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewChallengesScreen(
                                      title: "Health",
                                      name: chall['data'][0]["Health"],
                                    )));
                      },
                      child: Text(
                        "View all",
                        style: GoogleFonts.poppins(
                            fontSize: 13 * _widthScale,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA585C1).withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 180 * _heightScale,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: chall == null ? 0 : 2,
                      // chall['data'][0]["Health"].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChallengeBioScreen(
                                          name: chall['data'][0]["Health"]
                                              [index],
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 21 * _widthScale,
                                vertical: 8 * _heightScale),
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              child: ListTile(
                                leading: index % 2 == 0
                                    ? Image.asset('assets/Vector (16).png')
                                    : Image.asset('assets/Vector (15).png'),
                                title: Column(
                                  children: [
                                    Text(
                                      chall == null
                                          ? ''
                                          : chall['data'][0]["Health"][index],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12 * _widthScale,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF4D4D4D)),
                                    ),
                                    Text(
                                      'Tap to start the challenge',
                                      style: GoogleFonts.poppins(
                                          fontSize: 11 * _widthScale,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFB9B9B9)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 21 * _widthScale,
                    ),
                    Text(
                      "Pros",
                      style: GoogleFonts.poppins(
                          fontSize: 20 * _widthScale,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA585C1)),
                    ),
                    SizedBox(
                      width: 225 * _widthScale,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewChallengesScreen(
                                      title: "Pros",
                                      name: chall['data'][0]["Pros"],
                                    )));
                      },
                      child: Text(
                        "View all",
                        style: GoogleFonts.poppins(
                            fontSize: 13 * _widthScale,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA585C1).withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 180 * _heightScale,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: chall == null ? 0 : 2,
                      // chall['data'][0]["Pros"].length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChallengeBioScreen(
                                          name: chall['data'][0]["Pros"][index],
                                        )));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 21 * _widthScale,
                                vertical: 8 * _heightScale),
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              child: ListTile(
                                leading: index % 2 == 0
                                    ? Image.asset('assets/Vector (16).png')
                                    : Image.asset('assets/Vector (15).png'),
                                title: Column(
                                  children: [
                                    Text(
                                      chall == null
                                          ? ''
                                          : chall['data'][0]["Pros"][index],
                                      style: GoogleFonts.poppins(
                                          fontSize: 12 * _widthScale,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF4D4D4D)),
                                    ),
                                    Text(
                                      'Tap to start the challenge',
                                      style: GoogleFonts.poppins(
                                          fontSize: 11 * _widthScale,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFB9B9B9)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}

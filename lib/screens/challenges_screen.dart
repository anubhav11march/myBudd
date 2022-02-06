import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_all_challenges.dart';
import 'package:mybud/screens/challenge_bio_screen.dart';
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
                  ],
                ),
                Container(
                  height: 510 * _heightScale,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: chall == null
                          ? 0
                          : chall['data'][0]["Lifestyle"].length,
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
                                horizontal: 21 * _widthScale, vertical: 10),
                            child: Container(
                              // alignment: Alignment.centerLeft,
                              height: 34 * _heightScale,
                              width: 285 * _widthScale,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10),
                                child: Text(
                                  chall == null
                                      ? ''
                                      : chall['data'][0]["Lifestyle"][index],
                                  style: GoogleFonts.poppins(
                                      fontSize: 12 * _widthScale,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4D4D4D)),
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
                      "Health",
                      style: GoogleFonts.poppins(
                          fontSize: 20 * _widthScale,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFA585C1)),
                    ),
                  ],
                ),
                Container(
                  height: 350 * _heightScale,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          chall == null ? 0 : chall['data'][0]["Health"].length,
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
                                horizontal: 21 * _widthScale, vertical: 10),
                            child: Container(
                              // alignment: Alignment.centerLeft,
                              height: 34 * _heightScale,
                              width: 285 * _widthScale,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10),
                                child: Text(
                                  chall == null
                                      ? ''
                                      : chall['data'][0]["Health"][index],
                                  style: GoogleFonts.poppins(
                                      fontSize: 12 * _widthScale,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4D4D4D)),
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
                  ],
                ),
                Container(
                  height: 350 * _heightScale,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          chall == null ? 0 : chall['data'][0]["Pros"].length,
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
                                horizontal: 21 * _widthScale, vertical: 10),
                            child: Container(
                              // alignment: Alignment.centerLeft,
                              height: 34 * _heightScale,
                              width: 285 * _widthScale,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10),
                                child: Text(
                                  chall == null
                                      ? ''
                                      : chall['data'][0]["Pros"][index],
                                  style: GoogleFonts.poppins(
                                      fontSize: 12 * _widthScale,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4D4D4D)),
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

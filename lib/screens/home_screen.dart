import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_savedcards.dart';
import 'package:mybud/screens/profile.dart';
import 'package:mybud/screens/saved_profile_screen.dart';
import 'package:mybud/widgets/token_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  var cards;
  saved() async {
    cards = await getsavedCards(tokenProfile?.token);
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: saved(),
            builder: (context, snapShot) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15 * _widthScale),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: basic(Color(0xFFEF4C48), 'Tasks', '4 Tasks',
                              'assets/Group (4).png'),
                        ),
                        SizedBox(
                          width: 20 * _widthScale,
                        ),
                        basic(Color(0xFFA585C1), 'Challenges',
                            '3 Active Challenges', 'assets/Group (5).png'),
                      ],
                    ),
                    SizedBox(
                      height: 20 * _heightScale,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SavedProfileScreen()));
                          },
                          child: basic(
                              Color(0xFFF4C82A),
                              'Saved Profiles',
                              cards == null
                                  ? 0.toString() + ' Profiles'
                                  : cards['data'].length.toString() +
                                      ' Profiles',
                              'assets/Group (6).png'),
                        ),
                        SizedBox(
                          width: 20 * _widthScale,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ProfileScreen.route);
                          },
                          child: basic(const Color(0xFF19C720), 'My Profile',
                              'Tap to View more', 'assets/Group (7).png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20 * _heightScale,
                    ),
                    Container(
                      height: 160.5 * _heightScale,
                      width: 343 * _widthScale,
                      decoration: BoxDecoration(
                          color: Color(0xFF76D4C3),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 20 * _heightScale),
                              Image.asset('assets/Group (8).png'),
                              Text(
                                'Messages',
                                style: GoogleFonts.poppins(
                                    fontSize: 15 * _widthScale,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 16 * _heightScale),
                            ],
                          ),
                          //     SizedBox(height: 20 * _heightScale),
                          Row(
                            children: [
                              SizedBox(width: 10 * _heightScale),
                              Text(
                                '2 Unread Messages',
                                style: GoogleFonts.poppins(
                                    fontSize: 12.5 * _widthScale,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  Widget basic(Color colors, String title, String secondary, String image) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Container(
      height: 160.5 * _heightScale,
      width: 160.5 * _widthScale,
      decoration:
          BoxDecoration(color: colors, borderRadius: BorderRadius.circular(8)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20 * _heightScale),
              Image.asset(image),
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: 15 * _widthScale,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16 * _heightScale),
            ],
          ),
          //     SizedBox(height: 20 * _heightScale),
          Row(
            children: [
              SizedBox(width: 10 * _heightScale),
              Text(
                secondary,
                style: GoogleFonts.poppins(
                    fontSize: 12.5 * _widthScale,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}

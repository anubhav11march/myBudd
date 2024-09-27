import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_all_tasks.dart';
import 'package:mybud/api_service/get_savedcards.dart';
import 'package:mybud/api_service/update.dart';
import 'package:mybud/main.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/messages.dart';
import 'package:mybud/screens/profile.dart';
import 'package:mybud/screens/saved_profile_screen.dart';
import 'package:mybud/screens/tasks.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cards;
  var tasks;
  saved() async {
    cards = await getsavedCards(tokenProfile?.token);
     tasks = await gettasks(tokenProfile?.token);
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Nav1(ino: 1)));
                      },
                      child: basic(Color(0xFFFFFFFF), 'Find a Buddy',
                          'new profiles', 'assets/Vector (14).png', 110),
                    ),
                    SizedBox(
                      height: 15 * _heightScale,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed('/tasks_screen');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TaskScreen()));
                      },
                      child: basic(Color(0xFFFFFFFF), 'Goals',
                       tasks == null ? '0 Goals':
                       tasks['success'] == false
                      ? 'No Goals added'
                      : tasks['data'][0]['tasks1'] == null
                          ? '0 Goals'
                          :   '${tasks['data'][0]['tasks1'].length} Goals',
                          'assets/Vector (9).png', 110),
                    ),
                    SizedBox(
                      height: 15 * _heightScale,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Nav1(ino: 2)));
                      },
                      child: basic(Color(0xFFFFFFFF), 'Challenges',
                          ' Active Challenges', 'assets/Vector (10).png', 30),
                    ),
                    SizedBox(
                      height: 15 * _heightScale,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedProfileScreen()));
                      },
                      child: basic(
                          Color(0xFFFFFFFF),
                          'Saved Profiles',
                          cards == null
                              ? 0.toString() + ' Profiles'
                              : cards['data'].length.toString() + ' Profiles',
                          'assets/Vector (11).png',
                          52),
                    ),
                    SizedBox(
                      height: 15 * _heightScale,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(ProfileScreen.route);
                      },
                      child: basic(const Color(0xFFFFFFFF), 'My Profile',
                          'Tap to View more', 'assets/Vector (12).png', 35),
                    ),
                    SizedBox(
                      height: 15 * _heightScale,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(MessageScreen.route);
                      },
                      child: basic(const Color(0xFFFFFFFF), 'Messages',
                          '', 'assets/Group (10).png', 35),
                    ),
                  ],
                ),
              );
            }));
  }

  Widget basic(
      Color colors, String title, String secondary, String image, int widt) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Container(
      height: 71 * _heightScale,
      width: 340 * _widthScale,
      decoration: BoxDecoration(
          color: colors,
          border: Border.all(color: Color(0xFFC5C5C5), width: 1.5),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10 * _widthScale),

          Container(width: 35 * _widthScale, child: Image.asset(image)),
          SizedBox(width: 10 * _widthScale),
          Container(
            alignment: Alignment.centerLeft,
            height: 71 * _heightScale,
            width: 160 * _widthScale,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 20 * _heightScale),

                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 15 * _widthScale,
                      color: Color(0xFF263238),
                      fontWeight: FontWeight.w500),
                ),
                // SizedBox(height: 16 * _heightScale),
                Text(
                  secondary,
                  style: GoogleFonts.poppins(
                      fontSize: 12.5 * _widthScale,
                      color: Color(0xFFB9B9B9),
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          // SizedBox(
          //   width: widt * _widthScale,
          // ),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFFA585C1),
                  borderRadius: BorderRadius.circular(5)),
              height: 36 * _heightScale,
              width: 110 * _widthScale,
              alignment: Alignment.center,
              child: Text('Explore',
                  style: GoogleFonts.poppins(color: Color(0xFFFFFFFF)))),
          //     SizedBox(height: 20 * _heightScale),
          // Row(
          //   children: [
          //     SizedBox(width: 10 * _heightScale),

          //   ],
          // )
        ],
      ),
    );
  }
}

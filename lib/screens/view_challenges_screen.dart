import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_user_image.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/challenge_bio_screen.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';

class ViewChallengesScreen extends StatefulWidget {
  String title;
  var name;

  ViewChallengesScreen({required this.title, required this.name});

//  const ViewChallengesScreen({Key? key}) : super(key: key);

  @override
  _ViewChallengesScreenState createState() => _ViewChallengesScreenState();
}

class _ViewChallengesScreenState extends State<ViewChallengesScreen> {
  var pp;
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
                      widget.title,
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
      body: Container(
        height: 710 * _heightScale,
        width: double.infinity,
        child: ListView.builder(
            itemCount: widget.name == null ? 0 : widget.name.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChallengeBioScreen(
                                name: widget.name[index],
                              )));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 21 * _widthScale, vertical: 8 * _heightScale),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: 11 * _heightScale),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7),
                                bottomLeft: Radius.circular(7))),
                        width: 47 * _widthScale,
                        height: 72 * _heightScale,
                        child: index % 2 == 0
                            ? Image.asset('assets/Vector (16).png')
                            : Image.asset('assets/Vector (15).png'),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 7 * _heightScale),
                            // alignment: Alignment.centerLeft,
                            height: 42 * _heightScale,
                            width: 278 * _widthScale,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(7),
                                )),
                            child: Text(
                              widget.name == null ? '' : widget.name[index],
                              style: GoogleFonts.poppins(
                                  fontSize: 12 * _widthScale,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF4D4D4D)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30 * _heightScale,
                            width: 278 * _widthScale,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7))),
                            child: Text(
                              'Tap to view more',
                              style: GoogleFonts.poppins(
                                  fontSize: 11 * _widthScale,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFB9B9B9)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

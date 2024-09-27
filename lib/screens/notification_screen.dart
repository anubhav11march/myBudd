import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_user_image.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';

class NotificationScreen extends StatefulWidget {
  static const String route = '/notification_screen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                      "Notifications",
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
      // body: Padding(
      //   padding: EdgeInsets.symmetric(horizontal: _widthScale * 23),
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: _heightScale * 24,
      //       ),
      //       SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: [
      //             profile(),
      //             SizedBox(
      //               width: _widthScale * 31,
      //             ),
      //             profile(),
      //             SizedBox(
      //               width: _widthScale * 31,
      //             ),
      //             profile(),
      //             SizedBox(
      //               width: _widthScale * 31,
      //             ),
      //             profile(),
      //             SizedBox(
      //               width: _widthScale * 31,
      //             ),
      //             profile(),
      //             SizedBox(
      //               width: _widthScale * 31,
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: _heightScale * 11,
      //       ),
      //       Row(
      //         children: [
      //           Text(
      //             " If the receiver dosen’t reply in 24hrs the chat will disappear",
      //             style: GoogleFonts.poppins(
      //               color: const Color(0xFF5E3E79),
      //               fontSize: _widthScale * 10,
      //               fontWeight: FontWeight.w400,
      //             ),
      //           ),
      //         ],
      //       ),
      //       SizedBox(
      //         height: _heightScale * 11,
      //       ),
      //       Container(
      //         height: _heightScale * 1,
      //         width: double.infinity,
      //         color: const Color(0xFFABABAB),
      //       ),
      //       SizedBox(
      //         height: _heightScale * 11,
      //       ),
      //       people(),
      //     ],
      //   ),
      // ),
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

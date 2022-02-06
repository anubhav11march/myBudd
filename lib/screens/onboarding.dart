import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_user_profile.dart';
import 'package:mybud/screens/sign_in.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/token_profile.dart';

// ignore: camel_case_types
class onboardingscreen extends StatefulWidget {
  const onboardingscreen({Key? key}) : super(key: key);

  @override
  _onboardingscreenState createState() => _onboardingscreenState();
}

// ignore: camel_case_types
class _onboardingscreenState extends State<onboardingscreen> {
  double kDesignWidth = 375;
  double kDesignHeight = 812;

  @override
  Widget build(BuildContext context) {
    print('hbhjb${tokenProfile?.token}');

    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23 * _widthScale),
            child: Column(
              children: [
                SizedBox(
                  height: _heightScale * 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/Ellipse 1.png",
                      // height: 68 * _heightScale,
                      // width: 68 * _widthScale,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10 * _widthScale,
                ),
                Text(
                  "MyBudd",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: _widthScale * 24),
                ),
                SizedBox(
                  height: _heightScale * 133,
                  // width: MediaQuery.of(context).size.width * 0.96,
                ),
                Image.asset(
                  "assets/Group 1 (2).png",
                  // height: _widthScale * 330,
                  // width: _widthScale * 246,
                ),
                SizedBox(
                  height: _heightScale * 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //  SizedBox(width: _widthScale * 29),
                    Text('Proceed only if you can spare ',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: _widthScale * 15)),
                    Text('2-3 hours ',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: _widthScale * 15)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: _widthScale * 29),
                    Text('per week ',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: _widthScale * 15)),
                    Text('towards your self development ',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: _widthScale * 15)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('as well as development of your buddy ',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: _widthScale * 15)),
                  ],
                ),
                SizedBox(
                  height: _heightScale * 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: BoxColor.PurpleBox(context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Container(
                      height: 56 * _heightScale,
                      width: 330 * _widthScale,
                      alignment: Alignment.center,
                      child: Text(
                        'I Agree & Get Started',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: _widthScale * 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
                SizedBox(
                  height: _heightScale * 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

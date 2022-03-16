import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_user_profile.dart';
import 'package:mybud/screens/sign_in.dart';
import 'package:mybud/screens/sign_up.dart';
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
    final double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23 * _widthScale),
          child: Column(
            children: [
              SizedBox(
                height: _heightScale * 36,
              ),
              SizedBox(
                height: _heightScale * 68,
                child: Image.asset(
                  "assets/Ellipse 1.png",
                  // height: 68 * _heightScale,
                  // width: 68 * _widthScale,
                ),
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
                height: _heightScale * 47,
                // width: MediaQuery.of(context).size.width * 0.96,
              ),
              SizedBox(
                height: _heightScale * 288,
                child: Image.asset(
                  "assets/img.png",
                  // height: _widthScale * 330,
                  // width: _widthScale * 246,
                ),
              ),
              SizedBox(
                height: _heightScale * 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Proceed only if you can spare 2-3 hours per week towards your self development as well as development of your buddy.",
                  style: GoogleFonts.poppins(
                      color: Color(0xff767676),
                      fontWeight: FontWeight.w500,
                      fontSize: _widthScale * 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // SizedBox(
              //   height: _heightScale * 40,
              // ),

              // SizedBox(
              //   height: _heightScale * 60,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(23 * _widthScale),
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
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
                      fontSize: _widthScale * 18, fontWeight: FontWeight.w500),
                ),
              ),
            )),
      ),
    );
  }
}

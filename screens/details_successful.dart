import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/profile_picture_upload.dart';
import 'package:mybud/shared_preferences/login_preferences.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';

class VerifiedDScreen extends StatelessWidget {
  static const String route = '/verified_screen';
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  VerifiedDScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('/${tokenProfile!.token}');
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 153 * _heightScale),
            Image.asset('assets/Group 33870.png'),
            SizedBox(height: 71 * _heightScale),
            Text(
              'Congratulations!',
              style: GoogleFonts.poppins(
                  color: Color(0xFF775594),
                  fontSize: 28 * _widthScale,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 7 * _heightScale),
            Text(
              'Your email id is successfully verified',
              style: GoogleFonts.poppins(
                  color: Color(0xFF767676),
                  fontSize: 14 * _widthScale,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30 * _heightScale),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23 * _widthScale),
              child: ElevatedButton(
                onPressed: () {
               //   loginPreference!.setLoginStatu(true);

                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ProfileUploadScreen()),
                  //     (route) => false);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                       Nav1(ino: 0,)
                     //  MainPage()
                       ));
                },
                style: ElevatedButton.styleFrom(
                  primary: BoxColor.PurpleBox(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Container(
                  height: 56 * _heightScale,
                  width: 328 * _widthScale,
                  alignment: Alignment.center,
                  child: Text(
                    'View Profile',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18 * _widthScale,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//import 'package:'
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/post_challenges.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/counter_button.dart';
import 'package:mybud/widgets/token_profile.dart';

// ignore: must_be_immutable.
class ChallengeBioScreen extends StatefulWidget {
//  const ScreenBio({ Key? key }) : super(key: key);
  // String image;
  String name;
  // String profession;
  // String details;
  // String location;
  // String objective;
  // List skills;
  ChallengeBioScreen({
    // required this.image,
    required this.name,
    // required this.profession,
    // required this.details,
    // required this.location,
    // required this.objective,
    // required this.skills
  });
  @override
  _ChallengeBioScreenState createState() => _ChallengeBioScreenState();
}

class _ChallengeBioScreenState extends State<ChallengeBioScreen> {
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  int _counterValue = 0;

  void _onSubmit(context) async {
    //  if(response['success']== )
    if (_counterValue != 0) {
      var response = AddChallenge.verify(
          widget.name, tokenProfile?.token, _counterValue * 7);
      print('ress$response');
      Navigator.of(context).pop();

      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => DescribeYourselfScreen()));
    } else {
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter the details",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          // ignore: avoid_unnecessary_containers
          // Container(
          //     height: 812 * _heightScale,
          //     width: 375 * _widthScale,
          //     child: Image.asset(
          //       'assets/unsplash_Oalh2MojUuk.png',
          //       fit: BoxFit.fill,
          //     )
          //
          //     //  Image.network(
          //     //   widget.image,
          //     //   fit: BoxFit.cover,
          //     // ),
          //     ),

          Padding(
            padding: EdgeInsets.only(top: 507 * _heightScale),
            child: Container(
              height: 305 * _heightScale,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_widthScale * 25),
                    topRight: Radius.circular(_widthScale * 25)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 23 * _widthScale,
                    top: 15 * _heightScale,
                    right: 23 * _widthScale),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(height: _heightScale * 15),
                    //     Container(
                    //       height: _heightScale * 5,
                    //       width: _widthScale * 40,
                    //       color: const Color(0xFFABABAB),
                    //     ),
                    //   ],
                    // ),
                    //  SizedBox(height: _heightScale * 20),
                    Text(
                      widget.name,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF775594),
                        fontSize: _widthScale * 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No. of Weeks ',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFABABAB),
                            fontSize: _widthScale * 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        CounterButton(
                          count: _counterValue,
                          onChange: (int val) {
                            setState(() {
                              _counterValue = val;
                              print(_counterValue);
                            });
                          },
                          loading: false,
                          buttonColor: Colors.white,
                        ),
                        Text(
                          '  ' + '',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFABABAB),
                            fontSize: _widthScale * 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: _heightScale * 10,
                    ),
                    Container(
                      height: _heightScale * 1,
                      width: double.infinity,
                      color: const Color(0xFFABABAB),
                    ),
                    // Text(
                    //   widget.location,
                    //   style: GoogleFonts.poppins(
                    //     color: const Color(0xFF775594),
                    //     fontSize: _widthScale * 18,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    SizedBox(
                      height: 15 * _heightScale,
                    ),
                    // Text(
                    //   'Objective',
                    //   style: GoogleFonts.poppins(
                    //     color: const Color(0xFF775594),
                    //     fontSize: _widthScale * 20,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    // Text(
                    //   ' widget.objective',
                    //   style: GoogleFonts.poppins(
                    //     color: const Color(0xFFABABAB),
                    //     fontSize: _widthScale * 15,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15 * _heightScale,
                    // ),
                    // Text(
                    //   'SkillSets',
                    //   style: GoogleFonts.poppins(
                    //     color: const Color(0xFF775594),
                    //     fontSize: _widthScale * 20,
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    // Container(
                    //   height: 190 * _heightScale,
                    //   // width: double.infinity,
                    //   child: ListView.builder(
                    //       itemCount:
                    //           // 10,
                    //           widget.skills.length,
                    //       itemBuilder: (context, index) {
                    //         return Text(
                    //           widget.skills[index],
                    //           style: GoogleFonts.poppins(
                    //             color: const Color(0xFFABABAB),
                    //             fontSize: _widthScale * 15,
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         );
                    //       }),
                    // )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(23.0 * _widthScale),
              child: ElevatedButton(
                onPressed: () {
                  _onSubmit(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: BoxColor.PurpleBox(context),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: _heightScale * 56,
                  width: _widthScale * 328,
                  child: Text(
                    'Join Challenge',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 22 * _widthScale,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

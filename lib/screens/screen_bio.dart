import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/screens/buddy_main_page.dart';

// ignore: must_be_immutable.
class ScreenBio extends StatefulWidget {
//  const ScreenBio({ Key? key }) : super(key: key);
  String image;
  String name;
  String profession;
  String details;
  String location;
  String objective;
  List skills;
  ScreenBio(
      {required this.image,
      required this.name,
      required this.profession,
      required this.details,
      required this.location,
      required this.objective,
      required this.skills});
  @override
  _ScreenBioState createState() => _ScreenBioState();
}

class _ScreenBioState extends State<ScreenBio> {
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;

    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return SafeArea(
      child: Scaffold(
        //   extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   shadowColor: Colors.white,
        //   leading:
        // InkWell(
        //       onTap: () {
        //         Navigator.of(context).pop();
        //         //Scaffold.of(context).openDrawer();
        //       },
        //       child: Image.asset(
        //         "assets/Vector.png",
        //         height: _heightScale * 24,
        //         width: _widthScale * 27,
        //       )),
        // ),
        body: Stack(children: [
          // ignore: avoid_unnecessary_containers
          Container(
              height: 812 * _heightScale,
              width: 375 * _widthScale,
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              )),
          // Padding(
          //   padding: EdgeInsets.only(left: 15 * _widthScale),
          //   child: InkWell(
          //       onTap: () {
          //         Navigator.pop(context);
          //         //Scaffold.of(context).openDrawer();
          //       },
          //       child: Image.asset(
          //         "assets/Vector.png",
          //         height: _heightScale * 35,
          //         width: _widthScale * 35,
          //         color: Colors.white,
          //       )),
          // ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 580 * _heightScale),
              child: Container(
                height: 446 * _heightScale,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: _heightScale * 15),
                          Container(
                            height: _heightScale * 5,
                            width: _widthScale * 40,
                            color: const Color(0xFFABABAB),
                          ),
                        ],
                      ),
                      SizedBox(height: _heightScale * 20),
                      Text(
                        widget.name,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF775594),
                          fontSize: _widthScale * 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.profession,
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFABABAB),
                              fontSize: _widthScale * 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            ' , ' + widget.details,
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
                      Text(
                        'Objective',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF775594),
                          fontSize: _widthScale * 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.objective,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFABABAB),
                          fontSize: _widthScale * 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 15 * _heightScale,
                      ),
                      Text(
                        'SkillSets',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF775594),
                          fontSize: _widthScale * 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        //  height: 190 * _heightScale,
                        // width: double.infinity,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                // 10,
                                widget.skills.length,
                            itemBuilder: (context, index) {
                              return Text(
                                widget.skills[index],
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFABABAB),
                                  fontSize: _widthScale * 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            }),
                      )
                    ],
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

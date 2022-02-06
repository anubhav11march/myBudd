import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/add_details.dart';
import 'package:mybud/providers/add_detailss.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/objective_one_screen.dart';
import 'package:mybud/screens/working_professional.dart';
import 'package:mybud/shared_preferences/login_preferences.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:provider/provider.dart';

class ObjectiveTwoScreen extends StatefulWidget {
  const ObjectiveTwoScreen({Key? key}) : super(key: key);

  @override
  State<ObjectiveTwoScreen> createState() => _ObjectiveTwoScreenState();
}

class _ObjectiveTwoScreenState extends State<ObjectiveTwoScreen> {
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  _onAdd(BuildContext context) {
    AddInfo detailProvider = Provider.of<AddInfo>(context, listen: false);
    detailProvider.targ('${_data1.text},${_data2.text},${_data3.text}');
  }

  _onFetch(BuildContext context) async {
    AddInfo detailProvider = Provider.of<AddInfo>(context, listen: false);
    AddDetails fetchProvider = Provider.of<AddDetails>(context, listen: false);
    print('details');
    print(detailProvider.pprofession);
    print(detailProvider.ddetails);
    print(detailProvider.ttarget);
    print(detailProvider.dobjective);
    print(detailProvider.sskilss);
    await fetchProvider.addDetails(
        profession: detailProvider.pprofession,
        details: detailProvider.pprofession == 'Homemaker'
            ? 'none'
            : detailProvider.ddetails,
        target: detailProvider.ttarget,
        objective: detailProvider.dobjective,
        skills: detailProvider.sskilss);
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Nav1(ino: 0,)), (route) => false);

    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
    //  // MainPage()
    //   Nav1()
    //   ));
  }

  TextEditingController _data1 = TextEditingController();
  TextEditingController _data2 = TextEditingController();
  TextEditingController _data3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    Color col = Color(0xFF775594).withOpacity(0.4);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _heightScale * 37,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 18),
                child: Row(
                  children: [
                    Container(
                      height: _heightScale * 5,
                      width: _widthScale * 328,
                      color: const Color(0xFF7B2CBF),
                    ),
                    // Container(
                    //   height: _heightScale * 5,
                    //   width: _widthScale * 82,
                    //   color: const Color(0xFFF3F3F3),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: _heightScale * 36,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Text(
                  'Your Target',
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF775594)),
                ),
              ),
              SizedBox(
                height: _heightScale * 36,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Text('What is your 3 - 6 month target?',
                    style: GoogleFonts.poppins(
                      fontSize: _widthScale * 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF767676),
                    )),
              ),
              SizedBox(
                height: _heightScale * 14,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: TextField(
                  controller: _data1,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  style: TextStyle(fontSize: _widthScale * 15.0, color: col),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '3-6 month target',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: _widthScale * 14,
                            color: col,
                            fontWeight: FontWeight.w600)),
                    contentPadding: EdgeInsets.only(
                        bottom: _heightScale * 16.0, top: _heightScale * 16.0),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: const BorderSide(color: Colors.yellow),
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // UnderlineInputBorder(
                    //   borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 36,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Text('What is your 10 - 12 month target?',
                    style: GoogleFonts.poppins(
                      fontSize: _widthScale * 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF767676),
                    )),
              ),
              SizedBox(
                height: _heightScale * 14,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: TextField(
                  controller: _data2,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  style: TextStyle(fontSize: _widthScale * 15.0, color: col),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '10-12 month target',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: _widthScale * 14,
                            color: col,
                            fontWeight: FontWeight.w600)),
                    contentPadding: EdgeInsets.only(
                        bottom: _heightScale * 16.0, top: _heightScale * 16.0),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: const BorderSide(color: Colors.yellow),
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // UnderlineInputBorder(
                    //   borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 36,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Text('What is your 5 years target?',
                    style: GoogleFonts.poppins(
                      fontSize: _widthScale * 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF767676),
                    )),
              ),
              SizedBox(
                height: _heightScale * 14,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: TextField(
                  controller: _data3,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  style: TextStyle(fontSize: _widthScale * 15.0, color: col),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '5 years target',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: _widthScale * 14,
                            color: col,
                            fontWeight: FontWeight.w600)),
                    contentPadding: EdgeInsets.only(
                        bottom: _heightScale * 16.0, top: _heightScale * 16.0),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: const BorderSide(color: Colors.yellow),
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    // UnderlineInputBorder(
                    //   borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 36,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: ElevatedButton(
                  onPressed: () {
                    _onAdd(context);
                    if (_data1.text.isEmpty &&
                        _data2.text.isEmpty &&
                        _data3.text.isEmpty) {
                      const snackBar = SnackBar(
                        backgroundColor: Color(0xFFA585C1),
                        content: Text(
                          "Fill the details !",
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(milliseconds: 2000),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else
                      _onFetch(context);
                    loginPreference!.setLoginSta(true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: BoxColor.PurpleBox(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    height: _heightScale * 56,
                    width: _widthScale * 328,
                    alignment: Alignment.center,
                    child: Text(
                      'Next',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: _widthScale * 18,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Answer at least one to proceed further',
                      style: GoogleFonts.poppins(
                        fontSize: _widthScale * 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF767676),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

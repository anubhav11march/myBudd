import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/providers/add_detailss.dart';
import 'package:mybud/screens/objective_one_screen.dart';
import 'package:mybud/screens/student_screen.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:provider/provider.dart';

class WorkingProScreen extends StatefulWidget {
  const WorkingProScreen({Key? key}) : super(key: key);

  @override
  State<WorkingProScreen> createState() => _WorkingProScreenState();
}

class _WorkingProScreenState extends State<WorkingProScreen> {
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  _onAdd(BuildContext context) {
    AddInfo detailProvider = Provider.of<AddInfo>(context, listen: false);
    detailProvider.deta(_controller.text);

    //= 'Btech';
  }
  
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _widthScale * 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _heightScale * 37),
                Row(
                  children: [
                    Container(
                      height: _heightScale * 5,
                      width: _widthScale * 164,
                      color: const Color(0xFF7B2CBF),
                    ),
                    Container(
                      height: _heightScale * 5,
                      width: _widthScale * 164,
                      color: const Color(0xFFF3F3F3),
                    ),
                  ],
                ),
                SizedBox(
                  height: _heightScale * 30,
                ),
                Text(
                  'Working Professional',
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF775594)),
                ),
                SizedBox(
                  height: _heightScale * 30,
                ),
                Image.asset(
                  'assets/Group 33874.png',
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: _heightScale * 30,
                ),
                Text(
                  'What is the number of working experience you have?',
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF767676)),
                ),
                SizedBox(
                  height: _heightScale * 20,
                ),
                TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  style: TextStyle(
                      fontSize: _widthScale * 15.0, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Number of Work Experience',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: _widthScale * 14,
                            color: Color(0xFFB6B6B6),
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
                SizedBox(height: _heightScale * 28),
                ElevatedButton(
                  onPressed: () {
                    _onAdd(context);
                    if(_controller.text.isEmpty){
                          const snackBar = SnackBar(
                  backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter Working Experience ",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }else{
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ObjectiveOneScreen()));
                  }
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
                SizedBox(
                  height: _heightScale * 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

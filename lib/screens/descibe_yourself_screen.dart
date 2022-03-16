import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/providers/add_detailss.dart';
import 'package:mybud/screens/objective_one_screen.dart';
import 'package:mybud/screens/student_screen.dart';
import 'package:mybud/screens/working_professional.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:provider/provider.dart';

class DescribeYourselfScreen extends StatefulWidget {
  const DescribeYourselfScreen({Key? key}) : super(key: key);

  @override
  State<DescribeYourselfScreen> createState() => _DescribeYourselfScreenState();
}

class _DescribeYourselfScreenState extends State<DescribeYourselfScreen> {
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  bool show = false;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  _onAdd(BuildContext context) {
    AddInfo detailProvider = Provider.of<AddInfo>(context, listen: false);
    detailProvider.profess(profess);
    print('${detailProvider.pprofession}');
  }

  var profess;
  select(var value) {
    setState(() {
      profess = value;
    });
  }

  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
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
              ),
              SizedBox(
                height: _heightScale * 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 30),
                child: Text(
                  'Describe Yourself',
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF775594)),
                ),
              ),
              SizedBox(
                height: _heightScale * 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 29),
                child: Text(
                    'This will help us to connect you with a right study partner',
                    style: GoogleFonts.poppins(
                      fontSize: _widthScale * 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF767676),
                    )),
              ),
              SizedBox(
                height: _heightScale * 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 29),
                child: ElevatedButton(
                  onPressed: () {
                    if (!show) {
                      focusNode.unfocus();
                      focusNode.canRequestFocus = false;
                    }
                    setState(() {
                      show = !show;
                   //   _controller.clear();
                    });
                    select('Working Professional');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Verification()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: profess == "Working Professional"
                        ? BoxColor.PurpleBox(context)
                        : Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    height: _heightScale * 56,
                    width: _widthScale * 328,
                    alignment: Alignment.center,
                    child: Text(
                      'Working Professional',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: _widthScale * 18,
                              fontWeight: FontWeight.w700,
                              color: profess == "Working Professional"
                                  ? Colors.white
                                  : Color(0xFF775594))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 29),
                child: ElevatedButton(
                  onPressed: () {
                    if (!show) {
                      focusNode.unfocus();
                      focusNode.canRequestFocus = false;
                    }
                    setState(() {
                      show = !show;
                    });
                    select('Student');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Verification()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: profess == "Student"
                        ? BoxColor.PurpleBox(context)
                        : Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    height: _heightScale * 56,
                    width: _widthScale * 328,
                    alignment: Alignment.center,
                    child: Text(
                      'Student',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: _widthScale * 18,
                              fontWeight: FontWeight.w700,
                              color: profess == "Student"
                                  ? Colors.white
                                  : Color(0xFF775594))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 29),
                child: ElevatedButton(
                  onPressed: () {
                    if (!show) {
                      focusNode.unfocus();
                      focusNode.canRequestFocus = false;
                    }
                    setState(() {
                      show = !show;
                    });
                    select('Homemaker');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Verification()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: profess == "Homemaker"
                        ? BoxColor.PurpleBox(context)
                        : Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    height: _heightScale * 56,
                    width: _widthScale * 328,
                    alignment: Alignment.center,
                    child: Text(
                      'Homemaker',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: _widthScale * 18,
                        fontWeight: FontWeight.w700,
                        color: profess == "Homemaker"
                            ? Colors.white
                            : Color(0xFF775594),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _heightScale * 18,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 29),
                child: TextField(
                  focusNode: focusNode,
                  cursorColor: Color(0xFF775594),
                  onTap: () {
                    profess = 'Other';
                  },
                  onChanged: (val) {
                    select(_controller.text);
                  },
                  controller: _controller,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  style: TextStyle(
                      fontSize: _widthScale * 15.0,
                      color: Color(0xFF775594),
                      fontWeight: FontWeight.w600),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Other',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: _widthScale * 16,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.w600)),
                    contentPadding: EdgeInsets.only(
                        bottom: _heightScale * 16.0, top: _heightScale * 16.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF775594)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // UnderlineInputBorder(
                    //   borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                    //   borderRadius: BorderRadius.circular(6),
                    // ),
                  ),
                ),

                //  ElevatedButton(
                //   onPressed: () {
                //     select('Other');
                //     // Navigator.push(context,
                //     //     MaterialPageRoute(builder: (context) => Verification()));
                //   },
                //   style: ElevatedButton.styleFrom(
                //     side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
                //     primary: profess == "Other"
                //         ? BoxColor.PurpleBox(context)
                //         : Color(0xFFFFFFFF),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //   ),
                //   child: Container(
                //     height: _heightScale * 56,
                //     width: _widthScale * 328,
                //     alignment: Alignment.center,
                //     child: Text(
                //       'Other',
                //       style: GoogleFonts.poppins(
                //           textStyle: TextStyle(
                //               fontSize: _widthScale * 18,
                //               fontWeight: FontWeight.w600,
                //               color: profess == "Other" ? Colors.white : col)),
                //     ),
                //   ),
                // ),
              ),
              SizedBox(
                height: _heightScale * 28,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 26),
                child: ElevatedButton(
                  onPressed: () {
                    _onAdd(context);

                    if (profess != null) {
                      if (profess == 'Working Professional') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkingProScreen()));
                      } else if (profess == 'Student') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentScreen()));
                      } else if (profess == 'Other') {
                        if (_controller.text.isEmpty) {
                          const snackBar = SnackBar(
                            backgroundColor: Color(0xFFA585C1),
                            content: Text(
                              "Fill the details !",
                              style: TextStyle(color: Colors.white),
                            ),
                            duration: Duration(milliseconds: 2000),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ObjectiveOneScreen()));
                    } else if (profess == null) {
                      const snackBar = SnackBar(
                        backgroundColor: Color(0xFFA585C1),
                        content: Text(
                          "Select any one !",
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(milliseconds: 2000),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (profess == 'Other') {
                      if (_controller.text.isEmpty) {
                        const snackBar = SnackBar(
                          backgroundColor: Color(0xFFA585C1),
                          content: Text(
                            "Select any one !",
                            style: TextStyle(color: Colors.white),
                          ),
                          duration: Duration(milliseconds: 2000),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
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
              ),
              SizedBox(
                height: _heightScale * 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

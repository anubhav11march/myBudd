import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/providers/add_detailss.dart';
import 'package:mybud/screens/objective_one_screen.dart';
import 'package:mybud/screens/working_professional.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  _onAdd(BuildContext context) {
    AddInfo detailProvider = Provider.of<AddInfo>(context, listen: false);
    detailProvider.deta(deta);

    //= 'Btech';
  }
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
  var deta;
  select(var value) {
    setState(() {
      deta = value;
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
    return SafeArea(
      child: Scaffold(
        body: Column(
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
              height: _heightScale * 36,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 25),
              child: Text(
                'Student',
                style: GoogleFonts.poppins(
                    fontSize: _widthScale * 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF775594)),
              ),
            ),
            SizedBox(
              height: _heightScale * 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              child: Text(
                  'This will help us to connect you with a right study partner',
                  style: GoogleFonts.poppins(
                    fontSize: _widthScale * 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF767676),
                  )),
            ),
            SizedBox(
              height: _heightScale * 39,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              child: ElevatedButton(
                onPressed: () {
                        if (!show) {
                      focusNode.unfocus();
                      focusNode.canRequestFocus = false;
                    }
                    setState(() {
                      show = !show;
                   //  _controller.clear();
                    });
                  select('BTech');
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Verification()));
                },
                style: ElevatedButton.styleFrom(
                  primary: deta == 'BTech' ? BoxColor.PurpleBox(context): Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Container(
                  height: _heightScale * 56,
                  width: _widthScale * 328,
                  alignment: Alignment.center,
                  child: Text(
                    'BTech',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: _widthScale * 18,
                            fontWeight: FontWeight.w600,
                            color: deta == 'BTech' ? Colors.white: Color(0xFF775594))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _heightScale * 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              child: ElevatedButton(
                onPressed: () {
                         if (!show) {
                      focusNode.unfocus();
                      focusNode.canRequestFocus = false;
                    }
                    setState(() {
                      show = !show;
                    });
                  select('BBA');
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Verification()));
                },
                style: ElevatedButton.styleFrom(
                  primary:  deta == 'BBA' ? BoxColor.PurpleBox(context): Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Container(
                  height: _heightScale * 56,
                  width: _widthScale * 328,
                  alignment: Alignment.center,
                  child: Text(
                    'BBA',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: _widthScale * 18,
                            fontWeight: FontWeight.w600,
                            color: deta == 'BBA' ? Colors.white: Color(0xFF775594))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _heightScale * 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              child: ElevatedButton(
                onPressed: () {
                         if (!show) {
                      focusNode.unfocus();
                      focusNode.canRequestFocus = false;
                    }
                    setState(() {
                      show = !show;
                    });
                  select('BArch');
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Verification()));
                },
                style: ElevatedButton.styleFrom(
                  primary:  deta == 'BArch' ? BoxColor.PurpleBox(context): Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Container(
                  height: _heightScale * 56,
                  width: _widthScale * 328,
                  alignment: Alignment.center,
                  child: Text(
                    'BArch',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: _widthScale * 18,
                            fontWeight: FontWeight.w600,
                            color: deta == 'BArch' ? Colors.white: Color(0xFF775594))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _heightScale * 20,
            ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: TextField(
                  focusNode: focusNode,
                  cursorColor: Color(0xFF775594),
                  onTap: () {
                    deta = 'Other';
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
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       select('Other');
            //       // Navigator.push(context,
            //       //     MaterialPageRoute(builder: (context) => Verification()));
            //     },
            //     style: ElevatedButton.styleFrom(
            //       side: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
            //       primary:  deta == 'Other' ? BoxColor.PurpleBox(context): Color(0xFFFFFFFF),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //     ),
            //     child: Container(
            //       height: _heightScale * 56,
            //       width: _widthScale * 328,
            //       alignment: Alignment.center,
            //       child: Text(
            //         'Other',
            //         style: GoogleFonts.poppins(
            //             textStyle: TextStyle(
            //                 fontSize: _widthScale * 18,
            //                 fontWeight: FontWeight.w600,
            //                 color: deta == 'Other' ? Colors.white: col)),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: _heightScale * 28,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              child: ElevatedButton(
                onPressed: () {
                  _onAdd(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ObjectiveOneScreen()));
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
    );
  }
}

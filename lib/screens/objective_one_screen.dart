import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/providers/add_detailss.dart';
import 'package:mybud/screens/objective_one_screen.dart';
import 'package:mybud/screens/objective_two_screen.dart';
import 'package:mybud/screens/working_professional.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/ii.dart';
import 'package:provider/provider.dart';

class ObjectiveOneScreen extends StatefulWidget {
  const ObjectiveOneScreen({Key? key}) : super(key: key);

  @override
  State<ObjectiveOneScreen> createState() => _ObjectiveOneScreenState();
}

class _ObjectiveOneScreenState extends State<ObjectiveOneScreen> {
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

  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  _onAdd(BuildContext context) {
    AddInfo detailProvider = Provider.of<AddInfo>(context, listen: false);
    detailProvider.object('Start Own Business');
  }

  var deta;
  select(var value) {
    setState(() {
      deta = value;
    });
  }

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
                      width: _widthScale * 246,
                      color: const Color(0xFF7B2CBF),
                    ),
                    Container(
                      height: _heightScale * 5,
                      width: _widthScale * 82,
                      color: const Color(0xFFF3F3F3),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _heightScale * 36,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Text(
                  'Choose your',
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF775594)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Text(
                  'objective for using',
                  style: GoogleFonts.poppins(
                      fontSize: _widthScale * 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF775594)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: Text('MyBudd',
                    style: GoogleFonts.poppins(
                      fontSize: _widthScale * 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: _heightScale * 40,
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
                      _controller.clear();
                    });
                    select('Personal Growth');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Verification()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: deta == 'Personal Growth'
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
                      'Personal Growth',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: _widthScale * 18,
                              fontWeight: FontWeight.w600,
                              color: deta == 'Personal Growth'
                                  ? Colors.white
                                  : Color(0xFF775594))),
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
                      _controller.clear();
                    });
                    select('Professional Growth');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Verification()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: deta == 'Professional Growth'
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
                      'Professional Growth',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: _widthScale * 18,
                              fontWeight: FontWeight.w600,
                              color: deta == 'Professional Growth'
                                  ? Colors.white
                                  : Color(0xFF775594))),
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
                      _controller.clear();
                    });
                    select('Start own Business');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Verification()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: deta == 'Start own Business'
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
                      'Start own Business',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: _widthScale * 18,
                              fontWeight: FontWeight.w600,
                              color: deta == 'Start own Business'
                                  ? Colors.white
                                  : Color(0xFF775594))),
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
                //     primary:  deta == 'Other' ? BoxColor.PurpleBox(context): Color(0xFFFFFFFF),
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
                //               color: deta == 'Other' ? Colors.white: col)),
                //     ),
                //   ),
                // ),
              ),
              SizedBox(
                height: _heightScale * 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: ElevatedButton(
                  onPressed: () {
                    _onAdd(context);
                    if (deta == 'Other') {
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
                    }
                    if (deta == null) {
                      const snackBar = SnackBar(
                        backgroundColor: Color(0xFFA585C1),
                        content: Text(
                          "Choose your objective",
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(milliseconds: 2000),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (deta != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SkillScreen()));
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/add_details.dart';
import 'package:mybud/screens/profile.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/custom_drop_down_button.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  // const EditProfile({Key? key}) : super(key: key);
  String profess;
  String deta;
  String rea;
  String targ;
  List skills;
  EditProfile(
      {required this.profess,
      required this.deta,
      required this.rea,
      required this.targ,
      required this.skills});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _professValue = 'Working Professional';
  String _student = 'BTech';
  String _objective = 'Personal Growth';
  List profession = [
    'Working Professional',
    'Student',
    'Homemaker',
    'Other',
  ];
  List student = [
    'BTech',
    'BBA',
    'BArch',
    'Other',
  ];
  List objective = [
    'Personal Growth',
    'Professional Growth',
    'Start own Business',
    'Other',
  ];
  changeProfessionValue(String value) {
    setState(() {
      _professValue = value;
    });
    // return _professValue;
  }

  void changeStudentValue(String value) {
    setState(() {
      _student = value;
    });
  }

  void changeObjectiveValue(String value) {
    setState(() {
      _objective = value;
    });
  }

  TextEditingController _controller = TextEditingController();

  TextEditingController _target = TextEditingController();

  TextEditingController _c = TextEditingController();
  _onFetch(BuildContext context) async {
    //  AddInfo detailProvider = Provider.of<AddInfo>(context, listen: false);
    AddDetails fetchProvider = Provider.of<AddDetails>(context, listen: false);

    await fetchProvider.addDetails(
        profession: _professValue,
        details: _professValue == 'Working Professional'
            ? (_controller.text)
            : _professValue == 'Student'
                ? _student
                : ' ',
        target: _target.text.isEmpty ? widget.targ : _target.text,
        objective: _objective,
        skills:
            widget.skills.toString().replaceAll('[', '').replaceAll(']', ''));
    //  Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (context) => ProfileScreen()),
    //       (route) => false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    print('pr00${_objective}');
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFF6F6F6),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_widthScale * 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          //Scaffold.of(context).openDrawer();
                        },
                        child: Image.asset(
                          "assets/Vector.png",
                          height: _heightScale * 24,
                          width: _widthScale * 27,
                        )),
                    SizedBox(
                      width: _widthScale * 15,
                    ),
                    Text(
                      "Edit Profile",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF775594),
                        fontSize: _widthScale * 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * _widthScale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25 * _heightScale,
              ),
              Text(
                'Your current occupation',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: _widthScale * 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10 * _heightScale,
              ),
              Container(
                // padding: EdgeInsets.only(
                //     left: 20 * _widthScale, bottom: 10 * _heightScale),
                // width: 150,
                child: CustomDropDownButton(
                    widthScale: 10,
                    hintText: 'Occupation',
                    items: profession,
                    onChange: changeProfessionValue,
                    value: _professValue),
              ),
              SizedBox(
                height: 25 * _heightScale,
              ),
              if (_professValue == 'Student' ||
                  _professValue == 'Working Professional')
                Text(
                  'Your Work Experience',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: _widthScale * 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              if (_professValue == 'Student' ||
                  _professValue == 'Working Professional')
                SizedBox(
                  height: 10 * _heightScale,
                ),
              if (_professValue == 'Student')
                Container(
                  child: CustomDropDownButton(
                      widthScale: 10,
                      hintText: 'Details',
                      items: student,
                      onChange: changeStudentValue,
                      value: _student),
                ),
              if (_professValue == 'Working Professional')
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white),
                  alignment: Alignment.centerLeft,
                  height: _heightScale * 56,
                  width: _widthScale * 328,
                  child: TextFormField(
                    cursorColor: Color(0xFF775594),
                    controller: _controller,
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,

                      hintText: widget.deta,
                      hintStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 16 * _widthScale,
                              color: Color(0xFFB6B6B6),
                              fontWeight: FontWeight.w500)),
                      contentPadding: EdgeInsets.only(
                          left: 14.0 * _widthScale,
                          bottom: 14.0 * _widthScale,
                          top: 14.0 * _heightScale),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF775594)),
                        borderRadius: BorderRadius.circular(6),
                      ),
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
                height: 25 * _heightScale,
              ),
              Text(
                'Your Reason',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: _widthScale * 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10 * _heightScale,
              ),
              Container(
                // padding: EdgeInsets.only(
                //     left: 20 * _widthScale, bottom: 10 * _heightScale),
                // width: 150,
                child: CustomDropDownButton(
                    widthScale: 10,
                    hintText: 'Reason',
                    items: objective,
                    onChange: changeObjectiveValue,
                    value: _objective),
              ),
              SizedBox(
                height: 25 * _heightScale,
              ),
              Text(
                'Your Target',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: _widthScale * 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10 * _heightScale,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white),
                alignment: Alignment.centerLeft,
                height: _heightScale * 56,
                width: _widthScale * 328,
                child: TextFormField(
                  cursorColor: Color(0xFF775594),
                  controller: _target,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    hintText: widget.targ,
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.w500)),
                    contentPadding: EdgeInsets.only(
                        left: 14.0 * _widthScale,
                        bottom: 14.0 * _widthScale,
                        top: 14.0 * _heightScale),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF775594)),
                      borderRadius: BorderRadius.circular(6),
                    ),
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
                height: 25 * _heightScale,
              ),
              Text(
                'LinkedIn profile',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: _widthScale * 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10 * _heightScale,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white),
                alignment: Alignment.centerLeft,
                height: _heightScale * 56,
                width: _widthScale * 328,
                child: TextFormField(
                  cursorColor: Color(0xFF775594),
                  controller: _c,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    hintText: 'LinkedIn Profile',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.w500)),
                    contentPadding: EdgeInsets.only(
                        left: 14.0 * _widthScale,
                        bottom: 14.0 * _widthScale,
                        top: 14.0 * _heightScale),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF775594)),
                      borderRadius: BorderRadius.circular(6),
                    ),
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
                height: 45 * _heightScale,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_professValue == 'Working Professional') {
                    if (_controller.text.isEmpty) {
                      const snackBar = SnackBar(
                        backgroundColor: Color(0xFFA585C1),
                        content: Text(
                          "Enter Working Experience ",
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(milliseconds: 2000),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else
                    _onFetch(context);
                  //               }else{
                  //               Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                       builder: (context) => ObjectiveOneScreen()));
                  // }
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
                    'Save',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: _widthScale * 18,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/otp_verification.dart';
import 'package:mybud/api_service/resend_otp.dart';
import 'package:mybud/screens/verified.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/otp_pin.dart';
import 'package:mybud/widgets/otp_timer.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:timer_button/timer_button.dart';

class Verification extends StatefulWidget {
  //  Verification({Key? key}) :super(key: key);
  final String email;
  final bool verify;
  const Verification(@required this.email, @required this.verify);
  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  double kDesignWidth = 375;

  double kDesignHeight = 812;

  final TextEditingController _pinPutController = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  void _onSubmit(BuildContext context, var pin) async {
    var response = await Otp.verify(pin, widget.email);
    if (widget.verify == true) {
      print(widget.verify);
      print('${response.toString()}op');
      print(pin);
      if (response != true) {
        const snackBar = SnackBar(
          content: Text("incorrect pin"),
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (response == null) {
        print('null');
        const snackBar = SnackBar(
          content: Text("enter valid otp"),
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (response == true) {
        // ignore: curly_braces_in_flow_control_structures
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => VerifiedScreen()),
            (route) => false);
      }
    } else if (widget.verify == false) {
      print(widget.verify);
      print('${response.toString()}oo');
      print(pin);
      if (response == false) {
        print('mhiii');
        const snackBar = SnackBar(
          content: Text("incorrect pin"),
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (response == null) {
        print('null');
        const snackBar = SnackBar(
          content: Text("enter valid otp"),
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (response == true) {
        print('haan');
        // ignore: curly_braces_in_flow_control_structures
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => VerifiedScreen()),
            (route) => false);
        //  Navigator.push(
        //    context, MaterialPageRoute(builder: (context) => VerifiedScreen()));
      }
    }
  }

  // bool verified = false;
  void _onResend(BuildContext context) async {
    var response = await ResendOtp.verify(widget.email);

    // ignore: curly_braces_in_flow_control_structures

    const snackBar = SnackBar(
      content: Text("Otp send successfully !"),
      duration: Duration(milliseconds: 2000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // setState(() {
    //   verified = true;
    // });
  }

  @override
  void initState() {
    if (widget.verify == true) {
      _onResend(context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23 * _widthScale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 31 * _heightScale,
              ),
              Text(
                'Confirm your Email Id',
                style: GoogleFonts.poppins(
                  fontSize: 20 * _widthScale,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF775594),
                ),
              ),
              SizedBox(
                height: 39 * _heightScale,
              ),
              Text(
                'Please enter the Code sent on your email address to register',
                style: GoogleFonts.poppins(
                  fontSize: 13 * _widthScale,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF828282),
                ),
              ),
              SizedBox(
                height: 39 * _heightScale,
              ),
              Row(
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.06,
                  // ),
                  Text(
                    "Enter CODE",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 20 * _widthScale,
                          color: Color(0xFF775594),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 29 * _heightScale,
              ),
              Container(
                color: Colors.white,
                // margin: const EdgeInsets.all(20.0),
                // padding: const EdgeInsets.all(20.0),
                child: PinPut(
                  //  cursorHeight: 70,
                  fieldsCount: 4,
                  eachFieldHeight: 56 * _heightScale,
                  eachFieldWidth: 75 * _widthScale,
                  onSubmit: (String pin) => _onSubmit(context, pin),
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.deepPurpleAccent.withOpacity(.5),
                    ),
                  ),
                ),
              ),
              //    PinPutTest(),
              Row(
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.06,
                  // ),
                  // box("text", context),
                  // box("text", context),
                  // box("text" , context),
                  // box("text", context),
                ],
              ),
              SizedBox(
                height: 13 * _heightScale,
              ),
              TimeButton(
                buttonType: ButtonTyp.FlatButton,
                label: "Resend OTP",
                timeOutInSeconds: 59,
                onPressed: () {
                  _onResend(context);
                },
                disabledColor: Color(0xB3FFFFFF),
                color: Color(0xB3FFFFFF),
                disabledTextStyle: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 13 * _widthScale,
                      color: Color(0xFF828282),
                      fontWeight: FontWeight.w500),
                ),
                activeTextStyle: TextStyle(
                    fontSize: 13 * _widthScale,
                    color: Color(0xFF775594),
                    fontWeight: FontWeight.w500),
              ),
              //
              
              SizedBox(
                height: 32 * _heightScale,
              ),
              ElevatedButton(
                onPressed: () {
                  
                  // _onSubmit(context, pin)
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => VerifiedScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: BoxColor.PurpleBox(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: 328 * _widthScale,
                  height: 56 * _heightScale,
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18 * _widthScale,
                            fontWeight: FontWeight.w700)),
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

Widget box(String text, context) {
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
  final double _heightScale =
      MediaQuery.of(context).size.height / kDesignHeight;

  return Row(
    children: [
      Container(
        height: 56 * _heightScale,
        width: 75 * _widthScale,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0XFFCCCCCC),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 5 * _heightScale, horizontal: 25 * _widthScale),
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ),
      SizedBox(
        width: 7.2 * _widthScale,
      ),
    ],
  );
}

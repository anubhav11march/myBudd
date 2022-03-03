import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/forget_pass_email.dart';
import 'package:mybud/api_service/otp_verification.dart';
import 'package:mybud/api_service/resend_otp.dart';
import 'package:mybud/screens/otp_forget_pass.dart';
import 'package:mybud/screens/verified.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/otp_pin.dart';
import 'package:mybud/widgets/otp_timer.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:timer_button/timer_button.dart';

class VerifiyEmail extends StatefulWidget {
  //  Verification({Key? key}) :super(key: key);
  //final String email;
  // final bool verify;
  // const Verification(@required this.email, @required this.verify);
  @override
  State<VerifiyEmail> createState() => _VerifiyEmailState();
}

class _VerifiyEmailState extends State<VerifiyEmail> {
  double kDesignWidth = 375;

  double kDesignHeight = 812;

  final TextEditingController _username = TextEditingController();

  // final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  void _onSubmit(BuildContext context) async {
    if (_username.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text("Enter email"),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var response = await AddEmail.verify(_username.text);

      if (response['success'] == true) {
        Fluttertoast.showToast(msg: response['message']);
         Navigator.push(
          context, MaterialPageRoute(builder: (context) => ForgetVerification(_username.text)));
      } else if (response['success'] == false) {
        Fluttertoast.showToast(msg: response['error']);
      }
      // if (widget.verify == true) {
      //   print(widget.verify);
      //   print('${response.toString()}op');
      //   print(pin);
      //   if (response != true) {
      //     const snackBar = SnackBar(
      //       content: Text("incorrect pin"),
      //       duration: Duration(milliseconds: 2000),
      //     );
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   } else if (response == null) {
      //     print('null');
      //     const snackBar = SnackBar(
      //       content: Text("enter valid otp"),
      //       duration: Duration(milliseconds: 2000),
      //     );
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   } else if (response == true) {
      //     // ignore: curly_braces_in_flow_control_structures
      //     Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (context) => VerifiedScreen()),
      //         (route) => false);
      //   }
      // } else if (widget.verify == false) {
      //   print(widget.verify);
      //   print('${response.toString()}oo');
      //   print(pin);
      //   if (response == false) {
      //     print('mhiii');
      //     const snackBar = SnackBar(
      //       content: Text("incorrect pin"),
      //       duration: Duration(milliseconds: 2000),
      //     );
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   } else if (response == null) {
      //     print('null');
      //     const snackBar = SnackBar(
      //       content: Text("enter valid otp"),
      //       duration: Duration(milliseconds: 2000),
      //     );
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   } else if (response == true) {
      //     print('haan');
      //     // ignore: curly_braces_in_flow_control_structures
      //     Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (context) => VerifiedScreen()),
      //         (route) => false);
      //     //  Navigator.push(
      //     //    context, MaterialPageRoute(builder: (context) => VerifiedScreen()));
      //   }
      // }
    }
  }

  // bool verified = false;
  // void _onResend(BuildContext context) async {
  //   var response = await ResendOtp.verify(widget.email);

  //   // ignore: curly_braces_in_flow_control_structures

  //   const snackBar = SnackBar(
  //     content: Text("Otp send successfully !"),
  //     duration: Duration(milliseconds: 2000),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   // setState(() {
  //   //   verified = true;
  //   // });
  // }

  // @override
  // void initState() {
  //   if (widget.verify == true) {
  //     _onResend(context);
  //   }
  //   super.initState();
  // }

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
                height: 19 * _heightScale,
              ),
              Text(
                'Please enter your Email-Id to reset password',
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
                    "Enter Email",
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
              TextFormField(
                cursorColor: Color(0xFF775594),
                controller: _username,
                autofocus: false,
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter email',
                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 16 * _widthScale,
                          color: Color(0xFFB6B6B6),
                          fontWeight: FontWeight.w500)),
                  contentPadding: EdgeInsets.only(
                      left: 14.0 * _widthScale,
                      bottom: 14.0 * _widthScale,
                      top: 14.0 * _widthScale),
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
              //    PinPutTest(),

              // SizedBox(
              //   height: 13 * _heightScale,
              // ),

              //

              SizedBox(
                height: 32 * _heightScale,
              ),
              ElevatedButton(
                onPressed: () {
                  _onSubmit(context);
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

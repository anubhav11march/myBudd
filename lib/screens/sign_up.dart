import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/sign_up.dart';
import 'package:mybud/screens/sign_in.dart';
import 'package:mybud/screens/verification.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/error_snackbar.dart';

class SignUpScreen extends StatefulWidget {
   static const String route = '/signup_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  // final RegisterData _data = RegisterData();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _isUniqueEmail = true;
  bool _isLoading = false;
  var email;
  var username;
  var phoneno;
  var password;
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _phoneno = TextEditingController();
  bool _isVerify = false;
  bool isTrue = false;

  // bool _isConnected;

  //  _isEmailValid(String value, context) {
  //   if (value == null || value.isEmpty || !_isUniqueEmail) {
  //     _isUniqueEmail
  //         ? ErrorSnackBar.snackBar(context, 'Please enter Valid Email')
  //         : ErrorSnackBar.snackBar(context, 'Email already Registered');
  //    // return false;
  //   } else if (!value.contains('@') || !value.contains('.')) {
  //     ErrorSnackBar.snackBar(context, 'Invalid Email Id');

  //   }
  //   else

  //  return null;
  // }

  //    bool _isEmailValid(String value, context) {
  //   if (value == null || value.isEmpty || !_isUniqueEmail ) {
  //     _isUniqueEmail
  //         ? ErrorSnackBar.snackBar(context, 'Please enter Valid Email')
  //         : ErrorSnackBar.snackBar(context, 'Email already Registered');
  //     return false;
  //   } else if (value.length != 10 || int.tryParse(value) == null) {
  //     ErrorSnackBar.snackBar(context, 'Invalid Mobile Number');
  //     return false;
  //   }
  //   return true;
  // }

  bool _isNameValid(String value, context) {
    if (value == null || value.isEmpty) {
      ErrorSnackBar.snackBar(context, 'Please enter your name');
      return false;
    }
    return true;
  }

  _onSubmit(BuildContext context) async {
    if (_username.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter username",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_username.text.length < 3) {
      setState(() {
        _isLoading = false;
      });
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter valid username (minimum 4 words required)",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_email.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });

      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter your Email Id",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_phoneno.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });

      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter your Phone Number",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_phoneno.text.length < 10) {
      setState(() {
        _isLoading = false;
      });
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter valid Phone Number",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (!_email.text.contains('@') || !_email.text.contains('.')) {
      setState(() {
        _isLoading = false;
      });
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter valid Email Id",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_password.text.isEmpty) {
      setState(() {
        _isLoading = false;
      });

      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter your password",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_password.text != _confirmPassword.text) {
      setState(() {
        _isLoading = false;
      });

      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Confirm password !",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var response = await SignUp.signUp(
          _username.text, _password.text, _email.text, _phoneno.text);
      print('tute');
      print('${response.toString()}');

      if ('${response.toString()}' ==
          "Email already registered and verified! Login to proceed!") {
        setState(() {
          _isLoading = false;
        });
        const snackBar = SnackBar(
          backgroundColor: Color(0xFFA585C1),
          content: Text(
            "Email Id Already Registered ||  Login to proceed!",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if ('${response.toString()}' ==
          "Email already registered! Verify email to continue!") {
        const snackBar = SnackBar(
          backgroundColor: Color(0xFFA585C1),
          content: Text(
            "Email Id Already Registered ||  Login to proceed!",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          _isLoading = true;
        });

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Verification(_email.text, _isVerify = true)));
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = true;
        });
        // ignore: curly_braces_in_flow_control_structures

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Verification(_email.text, _isVerify = false)));
        setState(() {
          _isLoading = false;
        });
      }
    }
    // setState(() {
    //   _isLoading = true;
    // });

    // _isConnected = await Connection.isConnected();

    // if (!_isConnected) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   Connection.snackBar(context);
    //   return;
    // }

    _isUniqueEmail = true;

    //_formKey.currentState!.save();

    // if (!_isMobileValid(_data.mobile, context)) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   return;
    // } else if (!_isNameValid(_data.name, context)) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   return;
    // } else {
    //   if (_data.isEmptyDate) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //     ErrorSnackBar.snackBar(context, "Please select Date Of Birth");
    //     return;
    //   }
    // }

    // print('${_data.country}');
    // print('${_data.dob}');
    // print('${_data.mobile}');
    // print('${_data.name}');
    print('hii');

    print('gyaa');

    // if (response == null) {
    //   // setState(() {
    //   //   _isLoading = false;
    //   // });
    //  // print('Something really goes wrong');
    //  // return;
    // } else
    // if (response == 'The Email field must contain a unique value') {
    //   _isUniqueEmail = false;
    //   _isEmailValid(_data.email, context);
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   return;
    // }

    // showDialog(
    //     context: context,
    //     builder: (_) {
    //       return OtpScreen(
    //         mobile: _data.mobile,
    //         submitFunc: () {
    //           Navigator.of(context)
    //               .pushReplacementNamed(QuestionOneRegistrationScreen.route);
    //         },
    //         popFunc: () {
    //           Navigator.of(context)
    //               .pushNamedAndRemoveUntil(LoginScreen.route, (route) => false);
    //         },
    //       );
    //     });

    // setState(() {
    //   _isLoading = false;
    // });
  }

  Widget build(BuildContext context) {
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24 * _widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _heightScale * 31,
                ),
                Text('Lets get Started!',
                    style: GoogleFonts.poppins(
                        color: Color(0xFF3C096C),
                        fontWeight: FontWeight.w600,
                        fontSize: 28 * _widthScale)),
                Text('Sign up',
                    style: GoogleFonts.poppins(
                        color: Color(0xFF767676),
                        fontWeight: FontWeight.w500,
                        fontSize: 22 * _widthScale)),
                SizedBox(height: 36 * _heightScale),
                TextFormField(
                  cursorColor: Color(0xFF775594),
                  //       validator: (value) {
                  // if (value == null || value.isEmpty) {
                  //     return   ErrorSnackBar.snackBar(context, 'Please enter your name');
                  //         }
                  //    return null;
                  //        },
                  controller: _username,
                  autofocus: false,
                  keyboardType: TextInputType.name,
                  //    onFieldSubmitted: (value) => TextInputAction.done,
                  style: TextStyle(
                      fontSize: 15.0 * _widthScale, color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,

                    filled: true,
                    fillColor: Colors.white,

                    hintText: 'Enter Username',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.w500)),
                    contentPadding: EdgeInsets.only(
                        left: 16.0 * _widthScale,
                        bottom: 16.0 * _heightScale,
                        top: 16.0 * _heightScale),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF775594)),
                      borderRadius: BorderRadius.circular(6),
                    ),
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
                  // onSaved: (String? val) => username = val,
                ),
                SizedBox(height: 28 * _heightScale),
                TextFormField(
                  cursorColor: Color(0xFF775594),
                  controller: _email,
                  //                 validator:(value){
                  //                    if (value == null || value.isEmpty || !_isUniqueEmail) {
                  //   _isUniqueEmail
                  //       ? ErrorSnackBar.snackBar(context, 'Please enter Valid Email')
                  //       : ErrorSnackBar.snackBar(context, 'Email already Registered');
                  //  // return false;
                  // } else if (!value.contains('@') || !value.contains('.')) {
                  //   ErrorSnackBar.snackBar(context, 'Invalid Email Id');
                  // }

                  //                 },
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      fontSize: 15.0 * _widthScale, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Email Id',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.w500)),
                    contentPadding: EdgeInsets.only(
                        left: 16.0 * _widthScale,
                        bottom: 16.0 * _heightScale,
                        top: 16.0 * _heightScale),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF775594)),
                      borderRadius: BorderRadius.circular(6),
                    ),
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
                  //   onSaved: (var val) => email = val,
                ),
                SizedBox(height: 28 * _heightScale),
                TextFormField(
                  cursorColor: Color(0xFF775594),
                  autofocus: false,
                  controller: _phoneno,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 15.0 * _heightScale, color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Phone Number',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.w500)),
                    contentPadding: EdgeInsets.only(
                        left: 16.0 * _widthScale,
                        bottom: 16.0 * _heightScale,
                        top: 16.0 * _heightScale),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF775594)),
                      borderRadius: BorderRadius.circular(6),
                    ),
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
                  // onSaved: (var val) => phoneno = val,
                ),
                SizedBox(height: 28 * _heightScale),
                TextFormField(
                  cursorColor: Color(0xFF775594),
                  obscureText: true,
                  controller: _password,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: ((_password.text == _confirmPassword.text) &&
                            (_password.text != ""))
                        ? Icon(
                            Icons.lock,
                            color: Color(0xFF775594),
                          )
                        : Icon(
                            Icons.lock_open_rounded,
                            color: Color(0xFF775594),
                          ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Create Password',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.w500)),
                    contentPadding: EdgeInsets.only(
                        left: 16.0 * _widthScale,
                        bottom: 16.0 * _heightScale,
                        top: 16.0 * _heightScale),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF775594)),
                      borderRadius: BorderRadius.circular(6),
                    ),
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
                  //  onSaved: (var val) => password = val,
                ),
                SizedBox(height: 28 * _heightScale),
                TextFormField(
                  cursorColor: Color(0xFF775594),
                  obscureText: true,
                  controller: _confirmPassword,
                  autofocus: false,
                  style: TextStyle(
                      fontSize: 15.0 * _widthScale, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: ((_password.text == _confirmPassword.text) &&
                            (_confirmPassword.text != ""))
                        ? Icon(
                            Icons.lock,
                            color: Color(0xFF775594),
                          )
                        : Icon(
                            Icons.lock_open_rounded,
                            color: Color(0xFF775594),
                          ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Confirm Password',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Color(0xFFB6B6B6),
                            fontWeight: FontWeight.w500)),
                    contentPadding: EdgeInsets.only(
                        left: 16.0 * _widthScale,
                        bottom: 16.0 * _heightScale,
                        top: 16.0 * _heightScale),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF775594)),
                      borderRadius: BorderRadius.circular(6),
                    ),
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
                  //   onSaved: (String? val) => _data.password = val!,
                ),
                SizedBox(height: 28 * _heightScale),
                ElevatedButton(
                  onPressed: () async{
                    setState(() {
                      _isLoading = true;
                    });
                  await  _onSubmit(context);

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: BoxColor.PurpleBox(context),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 56 * _heightScale,
                    width: 328 * _widthScale,
                    child: _isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: _heightScale * 20,
                                width: _widthScale * 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: _widthScale * 20,
                              ),
                              Text("Please Wait...")
                            ],
                          )
                        : Text(
                            'Next',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 18 * _widthScale,
                                    fontWeight: FontWeight.w700)),
                          ),
                  ),
                ),
                SizedBox(
                  height: 15 * _heightScale,
                ),
                Row(
                  children: [
                    Text(
                      "Already a Member?",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 13 * _widthScale,
                            color: Color(0xFF737373),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 5 * _widthScale,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 13 * _widthScale,
                              color: Color(0xFF775594),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

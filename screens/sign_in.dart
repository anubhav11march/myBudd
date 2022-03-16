import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_user_profile.dart';
import 'package:mybud/api_service/sign_in.dart';
import 'package:mybud/main.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/descibe_yourself_screen.dart';
import 'package:mybud/screens/details_successful.dart';
import 'package:mybud/screens/forget_pass_email.dart';
import 'package:mybud/screens/onboarding.dart';
import 'package:mybud/screens/profile_picture_upload.dart';
import 'package:mybud/screens/sign_up.dart';
import 'package:mybud/screens/verified.dart';
import 'package:mybud/shared_preferences/login_preferences.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    loginPreference = LoginPreference();
  }

  double kDesignWidth = 375;
  double kDesignHeight = 812;
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isLoading1 = false;
  var res;
  bool isLogin = false;
  bool isVerify = false;
  bool isDone = false;
  bool isFinal = false;
  Future<bool> screen() async {
    print('inside screen()');
    bool val = await loginPreference!.getLoginStatus();
    bool valu = await loginPreference!.getLoginStatu();
    bool value = await loginPreference!.getLoginStat();
    bool values = await loginPreference!.getLoginSta();
    isLogin = val;
    isVerify = valu;
    isDone = value;
    isFinal = values;
    return val;
  }

  Future<void> getData() async {
    res = await getdetails(tokenProfile?.token);
    // print('opop$res');
  }

  _onSubmit(BuildContext context) async {
    String? token = await firebaseMessaging.getToken();
    print('FCM TOKEN : $token');
    if (_username.text.isEmpty) {
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter username !",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_username.text.length < 3) {
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter valid username (minimum 4 words required)",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var response = await LogIn.signIn(_username.text, _password.text, token);
      if (response['success'] == false &&
          response['error'] == 'All fields should be present!') {
        setState(() {
          isLoading1 = false;
        });

        const snackBar = SnackBar(
          backgroundColor: Color(0xFFA585C1),
          content: Text(
            "All fields must be present!",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (response['success'] == false &&
          response['error'] == 'Email or password incorrect!') {
        setState(() {
          isLoading1 = false;
        });

        const snackBar = SnackBar(
          backgroundColor: Color(0xFFA585C1),
          content: Text(
            "Email or password incorrect!",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('09090');
        print('tute');
        print('${response['error']}');
        print('gett');
        print('ressas$res');

        await getData();

        if (res != null) {
          if (res['image'] == null) {
            loginPreference?.setLoginSta(false);
            loginPreference?.setLoginStat(false);
            loginPreference?.setLoginStatu(false);
            loginPreference?.setLoginStatus(true);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => VerifiedScreen()),
                (route) => false);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => VerifiedScreen()));
          } else if (res['Info'] == null && res['image'] != null) {
            loginPreference?.setLoginSta(false);
            loginPreference?.setLoginStat(true);
            loginPreference?.setLoginStatu(true);
            loginPreference?.setLoginStatus(true);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => DescribeYourselfScreen()),
                (route) => false);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DescribeYourselfScreen()));
          } else {
            print('not');
            loginPreference?.setLoginSta(true);
            loginPreference?.setLoginStat(true);
            loginPreference?.setLoginStatu(true);
            loginPreference?.setLoginStatus(true);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => Nav1(
                          ino: 0,
                        )),
                (route) => false);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Nav1()
            //         // MainPage()
            //         ));
          }
        } else if (res == null) {
          if (response['error'] ==
              'Email not Verified! Please verify your mail!') {
            setState(() {
              isLoading1 = false;
            });
            loginPreference?.setLoginSta(false);
            loginPreference?.setLoginStat(false);
            loginPreference?.setLoginStatu(false);
            loginPreference?.setLoginStatus(false);
            const snackBar = SnackBar(
              backgroundColor: Color(0xFFA585C1),
              content: Text(
                "Email not Verified! Please verify your mail!",
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(milliseconds: 2000),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          loginPreference?.setLoginSta(false);
          loginPreference?.setLoginStat(false);
          loginPreference?.setLoginStatu(false);
          loginPreference?.setLoginStatus(false);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }

        print('ankit$res');
      }
    }
    //
  }

  @override
  Widget build(BuildContext context) {
    print('[[[[${tokenProfile?.token}');
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return FutureBuilder(
        future: screen(),
        builder: (context, snapShot) {
          return Scaffold(
            backgroundColor: Color(0xFFFFFFFF),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: _heightScale * 36,
                    ),
                    SizedBox(
                      height: 68 * _heightScale,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/Ellipse 1.png"),
                        ],
                      ),
                    ),
                    SizedBox(height: 7 * _heightScale),
                    Text(
                      "MyBudd",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 24 * _widthScale),
                    ),
                    SizedBox(
                      height: _heightScale * 101,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 23 * _widthScale),
                          child: Text(
                            "Welcome Back!",
                            style: GoogleFonts.poppins(
                                color: Color(0xFF3C096C),
                                fontWeight: FontWeight.w600,
                                fontSize: 28 * _widthScale),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 7,
                    // ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 23 * _widthScale),
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.poppins(
                                color: Color(0xFF767676),
                                fontWeight: FontWeight.w500,
                                fontSize: 22 * _widthScale),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30 * _heightScale,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 23.0 * _widthScale, right: 24 * _widthScale),
                      child: TextFormField(
                        cursorColor: Color(0xFF775594),
                        controller: _username,
                        autofocus: false,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Username',
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
                            borderSide:
                                const BorderSide(color: Color(0xFF775594)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFCCCCCC)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          // UnderlineInputBorder(
                          //   borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                          //   borderRadius: BorderRadius.circular(6),
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(height: 28 * _heightScale),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0 * _widthScale, right: 20 * _widthScale),
                      child: TextFormField(
                        cursorColor: Color(0xFF775594),
                        controller: _password,
                        autofocus: false,
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.lock_open_outlined,
                            size: 18 * _widthScale,
                            color: Color(0xFF775594),
                          ),
                          hintText: 'Enter Password',
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
                            borderSide:
                                const BorderSide(color: Color(0xFF775594)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFCCCCCC)),
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
                      height: 10 * _widthScale,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 23.0 * _widthScale),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VerifiyEmail()));
                            },
                            child: Text(
                              "Forget your password?",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 12 * _widthScale,
                                    color: Color(0xFF9B9B9B),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32 * _heightScale,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 23 * _widthScale),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (isLoading1) return;
                          setState(() {
                            isLoading1 = true;
                          });
                          // await Future.delayed(Duration(seconds: 2));
                          await _onSubmit(context);

                          setState(() {
                            isLoading1 = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: BoxColor.PurpleBox(context),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: _heightScale * 56,
                          width: _widthScale * 328,
                          child: isLoading1
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
                                  'Sign in',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 18 * _widthScale,
                                          fontWeight: FontWeight.w700)),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13 * _widthScale,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 23 * _widthScale),
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account?",
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
                                    builder: (context) => SignUpScreen())),
                            child: Text(
                              "Sign up",
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
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

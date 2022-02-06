import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/add_details.dart';
import 'package:mybud/api_service/swipe_cards.dart';
import 'package:mybud/api_service/upload_image.dart';
import 'package:mybud/providers/add_detailss.dart';
//import 'package:mybud/providers/cardProvider.dart';
import 'package:mybud/providers/card_provider.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/buddy_match_screen.dart';
import 'package:mybud/screens/descibe_yourself_screen.dart';
import 'package:mybud/screens/individ_message.dart';
import 'package:mybud/screens/messages.dart';
import 'package:mybud/screens/notification_screen.dart';
import 'package:mybud/screens/onboarding.dart';
import 'package:mybud/screens/profile.dart';
import 'package:mybud/screens/profile_picture_upload.dart';
import 'package:mybud/screens/sign_in.dart';
import 'package:mybud/screens/verified.dart';
import 'package:mybud/shared_preferences/login_preferences.dart';
import 'package:mybud/shared_preferences/token_preferences.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/ii.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //initstate() is used to initialize the contents of an already existing object.
    super.initState();
    print('loginPreference in initState');
    loginPreference = LoginPreference();
    tokenPreference = TokenPreference();

    getUserData();
  }

  void getUserData() async {
    if (await loginPreference!.getLoginStatus()) {
      tokenProfile =
          TokenProfile.fromJson(await tokenPreference.getTokenPreferenceData());
      print("User Data");
      //  print(constant.api);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CardProvider>(
          create: (context) => CardProvider(),
        ),
        ChangeNotifierProvider<AddDetails>(
          create: (context) => AddDetails(),
        ),
        ChangeNotifierProvider<AddInfo>(
          create: (context) => AddInfo(),
        ),
        ChangeNotifierProvider<AddImage>(
          create: (context) => AddImage(),
        ),
        ChangeNotifierProvider<SwipeCards>(
          create: (context) => SwipeCards(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => CardProvider(),
        child: FutureBuilder(
            future: screen(),
            builder: (context, snapShot) {
              if (!snapShot.hasData) {
                return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: Scaffold(
                      body: Center(
                        child: Text(
                          'MyBudd',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF775594)),
                          ),
                        ),
                      ),
                    ));
              } else if (snapShot.hasData) {
                print('asd');
                print(snapShot.data);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  // home: onboardingscreen(),
                  // snapShot.data ?
                  //   initialRoute: isLogin ? VerifiedScreen.route : LoginScreen.route ,
                  routes: {
                    VerifiedScreen.route: (ctx) => VerifiedScreen(),
                    LoginScreen.route: (ctx) => LoginScreen(),
                    //   Nav1.route: (ctx) => Nav1(),
                    ProfileScreen.route: (ctx) => ProfileScreen(),
                    SkillScreen.route: (ctx) => SkillScreen(),
                    MainPage.route: (ctx) => MainPage(),
                    BuddyMatchScreen.route: (ctx) => BuddyMatchScreen(),
                    MessageScreen.route: (ctx) => MessageScreen(),
                    NotificationScreen.route : (ctx) => NotificationScreen(),
                   // IndividMessageScreen.route : (ctx) => IndividMessageScreen()
                  },
                  //    VerifiedScreen() : LoginScreen(),
                  home: isLogin
                      ? isVerify
                          ? isDone
                              ? isFinal
                                  ? Nav1(ino: 0,)
                                  //? MainPage()
                                  : DescribeYourselfScreen()
                              : ProfileUploadScreen()
                          : VerifiedScreen()
                      : onboardingscreen(),
                );
              } else {
                return onboardingscreen();
              }
            }),
      ),
    );
  }
}

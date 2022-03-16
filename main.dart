import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
import 'package:mybud/screens/sign_up.dart';
import 'package:mybud/screens/tasks.dart';
import 'package:mybud/screens/verified.dart';
import 'package:mybud/shared_preferences/login_preferences.dart';
import 'package:mybud/shared_preferences/token_preferences.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/ii.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'Local_Notification/local_notification.dart';

final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

LocalNotification localNotification = LocalNotification();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  //  'This channel is used for important notifications.', // description
  importance: Importance.high,
  playSound: true,
  //sound: RawResourceAndroidNotificationSound('whistlesound')
);

const AndroidNotificationDetails firstNotificationAndroidSpecifics =
    AndroidNotificationDetails(
  'high_importance_channel', // id
  'High Importance Notifications', // title
//  'This channel is used for important notifications.',
//  sound: RawResourceAndroidNotificationSound('whistlesound'),
  playSound: true,
  importance: Importance.high,
  priority: Priority.high,
);

const NotificationDetails firstNotificationPlatformSpecifics =
    NotificationDetails(android: firstNotificationAndroidSpecifics);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _messageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // // setState()

  // //  sets
  // prefs.setString('status', "Pending");
  flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.notification?.title,
      message.notification?.body,
      NotificationDetails(
          android: AndroidNotificationDetails(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        //   'This channel is used for important notifications.',
        //   sound: RawResourceAndroidNotificationSound('whistlesound'),
        playSound: true,
        importance: Importance.high,
        priority: Priority.high,
      )),
      payload: jsonEncode({"Data": "Got it."}));

  // localNotification.showNotification(message.notification);
  print('background message ${message.notification!.body}');
  if (message.notification!.body == "You Can Now Accept The Orders") {
    FirebaseMessaging.onMessageOpenedApp.listen((snapshot) async {
      // print('ppoopopp');

      prefs.setString('status', "Pending");
      //Calls when the notification is been clicked.
      // localNotification.notificationRoute(snapshot.data);
      //  localNotification.showNotification(snapshot.notification);
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //globalSharedPref = await SharedPreferences.getInstance();
  Future.delayed(Duration(seconds: 5), () async {
    await localNotification.initializeLocalNotificationSettings();
  });

  // _notificationHandler();
  FirebaseMessaging.onMessage.listen((event) async {
    //  prefs.setString('status', "Pending");
   // localNotification.testNotification();
    // localNotification.showNotification(event.data.)
    localNotification.showNotification(event.data);
    print('event ${event.data['title']}');
    // localNotification.showNotification(event.notification);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((snapshot) async {
    print('ppoopopp');

    //  prefs.setString('status', "Pending");
    //Calls when the notification is been clicked.
    // localNotification.notificationRoute(snapshot.data);
    //  localNotification.showNotification(snapshot.notification);
  });
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
                    SignUpScreen.route: (ctx) => SignUpScreen(),
                    TaskScreen.route: (ctx) => TaskScreen(),
                    //   Nav1.route: (ctx) => Nav1(),
                    ProfileScreen.route: (ctx) => ProfileScreen(),
                    SkillScreen.route: (ctx) => SkillScreen(),
                    MainPage.route: (ctx) => MainPage(),
                    //   BuddyMatchScreen.route: (ctx) => BuddyMatchScreen(),
                    MessageScreen.route: (ctx) => MessageScreen(),
                    NotificationScreen.route: (ctx) => NotificationScreen(),
                    // IndividMessageScreen.route : (ctx) => IndividMessageScreen()
                  },
                  //    VerifiedScreen() : LoginScreen(),
                  home: isLogin
                      ? isVerify
                          ? isDone
                              ? isFinal
                                  ? Nav1(
                                      ino: 0,
                                    )
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

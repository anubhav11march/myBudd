import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_cards.dart';
import 'package:mybud/providers/card_provider.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/buddy_match_screen.dart';
import 'package:mybud/screens/challenges_screen.dart';
import 'package:mybud/screens/dummy_dp.dart';
import 'package:mybud/screens/home_screen.dart';
import 'package:mybud/screens/imagee.dart';
import 'package:mybud/screens/messages.dart';
import 'package:mybud/screens/notification_screen.dart';
import 'package:mybud/screens/objective_two_screen.dart';
import 'package:mybud/screens/profile.dart';
import 'package:mybud/screens/search_buddy_screen.dart';
import 'package:mybud/widgets/app_drawer.dart';
import 'package:mybud/widgets/custom_challenge_button.dart';
import 'package:mybud/widgets/ii.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:provider/provider.dart';

class Nav1 extends StatefulWidget {
  static const String route = '/custtom bar_screen';
  var ino;
  Nav1({required this.ino});
  @override
  _Nav1State createState() => _Nav1State();
}

class _Nav1State extends State<Nav1> {
  var isSelected = false;
  var ind = 0;
  int _selectedIndex = 0;
  // List<Widget> _widgetOptions = <Widget>[
  //   HomePage(),
  //   Calendar(),
  //   NotificationsPage(),
  //   ProfileScreen(),
  // ];
  @override
  void initState() {
    super.initState();
    Provider.of<CardProvider>(context, listen: false);
    setState(() {
      _selectedIndex = widget.ino == null ? ind : widget.ino;
    });

    //  getData();
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      isSelected = true;
      //isSelected++;
    });
  }

  ee() {
    Navigator.of(context).pushNamed(ProfileScreen.route);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<CardProvider>(context, listen: false);
    //   print('//$res');
    print('/${tokenProfile!.token}');
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    List _widgetOptions = [
      HomeScreen(),
      MainPage(),
      CustomChallenge(),
      //Imageee(),
      //  ObjectiveTwoScreen(),
      // Dummy(),
      MainPage(),
      //BuddyMatchScreen()
      // ProfileScreen(),
      //     Navigator.of(context).pushNamed(ProfileScreen.route)
      //  ee(),
    ];

    var size = MediaQuery.of(context).size;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CardProvider>(
          create: (context) => CardProvider(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (context) => CardProvider(),
        child: Scaffold(
          backgroundColor: Colors.white,
          //drawer: CustomAppDrawer(),
          drawer: CustomAppDrawer(),

          appBar: _selectedIndex == 2
              ? null
              : AppBar(
                  // leading:
                  title: Row(
                    children: [
                      Builder(builder: (context) {
                        return InkWell(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Image.asset(
                            "assets/Vector (1).png",
                            height: _heightScale * 23,
                            width: _widthScale * 22,
                          ),
                        );
                      }),
                      SizedBox(width: 15 * _widthScale),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchBuddyScreen()));
                        },
                        child: Container(
                          child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 78 * _widthScale,
                              ),
                              Text(
                                'Mybudd',
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF7B2CBF).withOpacity(0.3),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14 * _widthScale),
                              ),
                              SizedBox(
                                width: 61 * _widthScale,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 6 * _heightScale,
                                    bottom: 6 * _heightScale),
                                child: Image.asset('assets/Group (3).png'),

                                // AssetImage('')
                              ),
                            ],
                          ),
                          height: 33 * _heightScale,
                          width: 221 * _widthScale,
                          decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: Color(0xFFC5C5C5),
                                    width: 1 * _widthScale,
                                    style: BorderStyle.solid),
                                left: BorderSide(
                                    color: Color(0xFFC5C5C5),
                                    width: 1 * _widthScale,
                                    style: BorderStyle.solid),
                                bottom: BorderSide(
                                    color: Color(0xFFC5C5C5),
                                    width: 1 * _widthScale,
                                    style: BorderStyle.solid),
                                right: BorderSide(
                                    color: Color(0xFFC5C5C5),
                                    width: 1 * _widthScale,
                                    style: BorderStyle.solid),
                              ),
                              borderRadius:
                                  BorderRadius.circular(17 * _widthScale)),
                        ),
                      ),
                      SizedBox(width: 15 * _widthScale),
                      // SizedBox(width: 50 * _widthScale),
                      InkWell(
                        onTap: () {
                                                    //  Navigator.of(context).pushNamed(NotificationScreen.route);
                        },
                        child: Image.asset(
                          "assets/Vector (5).png",
                          height: _heightScale * 23,
                          width: _widthScale * 22,
                        ),
                      ),
                      SizedBox(width: 15 * _widthScale),
                      // SizedBox(
                      //   width: 15 * _widthScale,
                      // ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()));
                            //  Navigator.of(context).pushNamed(NotificationScreen.route);
                          },
                          child: Icon(
                            Icons.account_circle_rounded,
                            color: Color(0xFFA585C1),
                            size: 30 * _widthScale,
                          )),
                    ],
                  ),
                  //  centerTitle: true,
                  //  title: ,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
          // appBar: AppBar(
          //   leading: InkWell(
          //     onTap:()=> Scaffold.of(context).openDrawer(),
          //     child: Image.asset(
          //       "assets/Vector (1).png",
          //       height: _heightScale * 23,
          //       width: _widthScale * 22,
          //     ),
          //   ),
          //   //  title: ,
          //   automaticallyImplyLeading: false,
          //   elevation: 0,
          //   backgroundColor: Colors.white,

          // ),
          // drawer: CustomAppDrawer(),

          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 23 * _widthScale, vertical: 23 * _heightScale),
            child: Container(
              height: _heightScale * 56,
              width: _widthScale * 330,
              // margin: EdgeInsets.only(
              //     left: _widthScale * 15,
              //     right: _widthScale * 15,
              //     bottom: _widthScale * 8),
              decoration: BoxDecoration(
                color: Color(0xFFA585C1),
                borderRadius:
                    BorderRadius.all(Radius.circular(_widthScale * 15)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: _widthScale * 10,
                      ),
                      Expanded(
                          child: buildNavBarItem(
                              Icons.home, Icons.home_outlined, 0, 27, 14)),
                      Expanded(
                          child: buildNavBarItem(
                              Icons.group, Icons.group_add, 1, 29, 12)),
                      Expanded(
                          child: buildNavBarItem(
                              Icons.now_widgets_rounded,
                              Icons.now_widgets_outlined,
                              2,
                              26,
                              14)), //dashboard customizr or now icons
                      Expanded(
                          child: buildNavBarItem(Icons.message,
                              Icons.message_outlined, 3, 26, 14)),
                      SizedBox(
                        width: _widthScale * 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavBarItem(
      IconData icon, IconData icon2, int index, int size, double height) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return GestureDetector(
      onTap: () {
        // widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
        // if (index == 2) {
        //   Navigator.of(context).pushNamed(ChallengeScreen.route);
        // } else
        if (index == 3) {
          //   setState(() {
          //  index == 1;
          //   });
          Navigator.of(context).pushNamed(MessageScreen.route);
        }
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: _heightScale * height, bottom: height * _heightScale),
            child: Icon(
              _selectedIndex == index ? icon : icon2, color: Colors.white,
              // color: index == _selectedIndex ? Colors.black : Colors.grey,
              size: _widthScale * size,
            ),
          ),
          // SizedBox(
          //   height: _widthScale * 12,
          // ),
          // Container(
          //   height: _heightScale * 5,
          //   width: _widthScale * 16,
          //   decoration: BoxDecoration(
          //     color: index == _selectedIndex ? Colors.white : Colors.blue,
          //     borderRadius: BorderRadius.all(Radius.circular(_widthScale * 2)),
          //   ),
          // ),
        ],
      ),
    );
  }
}

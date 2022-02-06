import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/screens/challenges_screen.dart';
import 'package:mybud/screens/notification_screen.dart';
import 'package:mybud/screens/to_do_list_screen.dart';

class CustomChallenge extends StatefulWidget {
  const CustomChallenge({Key? key}) : super(key: key);

  @override
  _CustomChallengeState createState() => _CustomChallengeState();
}

class _CustomChallengeState extends State<CustomChallenge> {
  int _selectedIndex = 0;
  List _widgetOptions = [
    ToDoListScreen(),
    ChallengeScreen(),
  ];
  PageController _pageController = PageController();
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  @override
  Widget build(BuildContext context) {
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                _pageController.animateToPage(0,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Column(
                children: [
                  Text(
                    'To-do list',
                    style: GoogleFonts.poppins(
                        color: _selectedIndex == 0
                            ? Color(0xFFA585C1)
                            : Color(0xFFCDCDCD),
                        fontSize: 20 * _widthScale,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: _heightScale * 5,
                    width: _widthScale * 170.5,
                    color: _selectedIndex == 0
                        ? Color(0xFFA585C1)
                        : Color(0xFFCDCDCD),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                _pageController.animateToPage(1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Column(
                children: [
                  Text(
                    'Challenges',
                    style: GoogleFonts.poppins(
                        color: _selectedIndex == 1
                            ? Color(0xFFA585C1)
                            : Color(0xFFCDCDCD),
                        fontSize: 20 * _widthScale,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: _heightScale * 5,
                    width: _widthScale * 170.5,
                    color: _selectedIndex == 1
                        ? Color(0xFFA585C1)
                        : Color(0xFFCDCDCD),
                  ),
                ],
              ),
            ),
          ],
        ),
        centerTitle: true,
        //  title: ,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xFFF6F6F6),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        children: [
          ToDoListScreen(),
          ChallengeScreen(),

          // Center(
          // child: _widgetOptions.elementAt(_selectedIndex),
          //  ),
        ],
      ),
    );
  }
}

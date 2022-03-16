import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_cards.dart';
import 'package:mybud/api_service/get_user_image.dart';
import 'package:mybud/api_service/get_user_info.dart';
import 'package:mybud/api_service/get_user_profile.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/individ_message.dart';
import 'package:mybud/screens/new_message.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';

class MessageBioScreen extends StatefulWidget {
  static const String route = '/message_screen';
  String id;
  MessageBioScreen(
      {required this.id}); //  const MessageBioScreen({Key? key}) : super(key: key);

  @override
  _MessageBioScreenState createState() => _MessageBioScreenState();
}

class _MessageBioScreenState extends State<MessageBioScreen> {
  int _selectedIndex = 0;
  var profil;
  var res;
  userid() async {
    res = await getUserInfo(tokenProfile?.token, widget.id);
    print('buddyyyyy${res['isBuddy']}');
    print('userId${profil['_id']}');
  }

  PageController _pageController = PageController();
  var pp;
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return FutureBuilder(
        future: userid(),
        builder: (context, snapShot) {
          return Scaffold(
            backgroundColor: const Color(0xFFE5E5E5),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 84 * _heightScale,
              leadingWidth: 70,
              titleSpacing: 0,
              leading: Padding(
                padding: EdgeInsets.only(
                    top: 25.0 * _heightScale, bottom: 30 * _heightScale),
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 35 * _heightScale,
                        color: Color(0xFF775594),
                      ),
                    ],
                  ),
                ),
              ),
              title: Row(
                children: [
                  InkWell(
                    onTap: () {
                      showCupertinoDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (contex) {
                            return Container(
                              alignment: Alignment.center,
                              child: Container(
                                height: 450 * _heightScale,
                                width: 350 * _widthScale,
                                //   child:
                                // Image.network(
                                //   widget.buddyimage,
                                //   fit: BoxFit.cover,
                                // )
                              ),
                            );
                          });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 18.0, bottom: 20),
                      child: CircleAvatar(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFFB9B9B9),
                        radius: 25 * _widthScale,

                        backgroundImage:
                            //  res == null ? NetworkImage(''):

                            NetworkImage(res['data']['userdetails']['image']
                                ['location']),

                        //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
                        //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(res['data']['userdetails']['username'],
                              style: GoogleFonts.poppins(
                                fontSize: 18 * _widthScale,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF5E3E79),
                              )),
                          // Text(
                          //   "last seen today at 12:05",
                          //   style: TextStyle(
                          //     fontSize: 13,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                // IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
                // IconButton(icon: Icon(Icons.call), onPressed: () {}),
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Color(0xFF5E3E79),
                  ),
                  //  color: Color(0xFF5E3E79),
                  padding: EdgeInsets.all(0),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (BuildContext contesxt) {
                    return [
                      PopupMenuItem(
                        child: Text("View Buddy"),
                        value: "View Buddy",
                      ),
                    ];
                  },
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22 * _widthScale),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 27 * _heightScale,
                    ),
                    Text(
                      'Buddy Info',
                      style: GoogleFonts.poppins(
                          color: Color(0xFFA585C1),
                          fontSize: 20 * _widthScale,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10 * _heightScale,
                    ),
                    Container(
                      height: 180 * _heightScale,
                      width: 331 * _widthScale,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.all(21 * _widthScale),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/ls_bag.png'),
                                SizedBox(width: 8 * _widthScale),
                                Text(
                                    res['data']['userdetails']['Info']
                                        ['profession'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 16 * _widthScale,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFB9B9B9))),
                                if (res['data']['userdetails']['Info']
                                        ['profession'] ==
                                    'Working Professional')
                                  SizedBox(
                                    width: 80 * _widthScale,
                                  ),
                                // if (widget.profession == 'Homemaker')
                                //   SizedBox(
                                //     width: 0 * _widthScale,
                                //   ),
                                if (res['data']['userdetails']['Info']
                                        ['profession'] !=
                                    'Working Professional')
                                  SizedBox(
                                    width: 115 * _widthScale,
                                  ),
                                Text(
                                    res['data']['userdetails']['Info']
                                        ['details'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 16 * _widthScale,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFB9B9B9))),
                              ],
                            ),
                            SizedBox(
                              height: 12 * _heightScale,
                            ),
                            Row(
                              children: [
                                Image.asset('assets/Group (9).png'),
                                SizedBox(width: _widthScale * 8),
                                Text(
                                    res['data']['userdetails']['objective']
                                        ['title'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 16 * _widthScale,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFB9B9B9))),
                              ],
                            ),
                            SizedBox(
                              height: 12 * _heightScale,
                            ),
                            Row(
                              children: [
                                Image.asset('assets/Vector (7).png'),
                                SizedBox(width: _widthScale * 8),
                                Text('No. of Challenges Completed : 0',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16 * _widthScale,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFB9B9B9))),
                              ],
                            ),
                            SizedBox(
                              height: 12 * _heightScale,
                            ),
                            Row(
                              children: [
                                Image.asset('assets/Vector (8).png'),
                                SizedBox(width: _widthScale * 8),
                                SizedBox(width: 5 * _widthScale),
                                Text(res['data']['userdetails']['location'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 16 * _widthScale,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFB9B9B9))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16 * _heightScale,
                    ),
                    Text(
                      'Skills',
                      style: GoogleFonts.poppins(
                          color: Color(0xFFA585C1),
                          fontSize: 20 * _widthScale,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10 * _heightScale,
                    ),
                    Container(
                        // height: 190 * _heightScale,
                        // width: 331 * _widthScale,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: res['data']['userdetails']['skillsets']
                                  .length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 14 * _widthScale,
                                      color: Color(0xFFB9B9B9),
                                    ),
                                    Text(
                                      res['data']['userdetails']['skillsets']
                                          [index],
                                      style: GoogleFonts.poppins(
                                          color: Color(0xFFB9B9B9),
                                          fontSize: 14 * _widthScale,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                );
                              }),
                        )),
                    SizedBox(
                      height: 16 * _heightScale,
                    ),
                    Text(
                      'Recent',
                      style: GoogleFonts.poppins(
                          color: Color(0xFFA585C1),
                          fontSize: 20 * _widthScale,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
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
                                'Goals',
                                style: GoogleFonts.poppins(
                                    color: _selectedIndex == 0
                                        ? Color(0xFFA585C1)
                                        : Color(0xFFCDCDCD),
                                    fontSize: 20 * _widthScale,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 5 * _heightScale,
                              ),
                              Container(
                                height: _heightScale * 5,
                                width: _widthScale * 165.5,
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
                                height: 5 * _heightScale,
                              ),
                              Container(
                                height: _heightScale * 5,
                                width: _widthScale * 165.5,
                                color: _selectedIndex == 1
                                    ? Color(0xFFA585C1)
                                    : Color(0xFFCDCDCD),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //  if (_selectedIndex == 1)

                    Container(
                      height: 200 * _heightScale,
                      width: 330 * _widthScale,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _selectedIndex = page;
                          });
                        },
                        children: [
                          Container(
                              child: ListView.builder(
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 0,
                                      color: Colors.white,
                                      child: ListTile(
                                        //   shape: ShapeBorder.lerp(a, b, t),
                                        title: Text(
                                            res['data']['tasks'][0]['task']
                                                [index]['taskname'],
                                            style: GoogleFonts.poppins(
                                                color: Color(0xFF464646),
                                                fontSize: 14 * _widthScale,
                                                fontWeight: FontWeight.w400)),
                                        // trailing: Text(
                                        //     '${tasks['data'][0]['tasks1'][index]['remainingdays'].toString()}' +
                                        //         ' days left',
                                        //     style: GoogleFonts.poppins(
                                        //         color: Color(0xFF464646),
                                        //         fontSize: 14 * _widthScale,
                                        //         fontWeight: FontWeight.w400)),
                                      ),
                                    );
                                  })),
                          Container(
                              child: ListView.builder(
                                  itemCount: res['data']['challenge'].length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 0,
                                      color: Colors.white,
                                      child: ListTile(
                                        leading: Image.asset(
                                            'assets/Vector (16).png'),
                                        //   shape: ShapeBorder.lerp(a, b, t),
                                        title: Text(
                                            res['data']['challenge'][index]
                                                ['name'],
                                            style: GoogleFonts.poppins(
                                                color: Color(0xFF464646),
                                                fontSize: 14 * _widthScale,
                                                fontWeight: FontWeight.w400)),
                                        // trailing: Text(
                                        //     '${tasks['data'][0]['tasks1'][index]['remainingdays'].toString()}' +
                                        //         ' days left',
                                        //     style: GoogleFonts.poppins(
                                        //         color: Color(0xFF464646),
                                        //         fontSize: 14 * _widthScale,
                                        //         fontWeight: FontWeight.w400)),
                                      ),
                                    );
                                  })),

                          // ToDoListScreen(),
                          // ChallengeScreen(),

                          // Center(
                          // child: _widgetOptions.elementAt(_selectedIndex),
                          //  ),
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

  Widget profile() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return FutureBuilder(
        future: userid(),
        builder: (context, snapShot) {
          return CircleAvatar(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFFB9B9B9),
            radius: 36 * _widthScale,

            backgroundImage: res == null
                ? NetworkImage('')
                : NetworkImage(res['buddydetails'] != null
                    ? res['buddydetails'][0]['image']['location']
                    : res['data']['image']['location']),

            //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
            //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
          );
        });
  }

  // Widget people() {
  //   const double kDesignWidth = 375;
  //   const double kDesignHeight = 812;
  //   double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
  //   double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

  //   return FutureBuilder(
  //       future: userid(),
  //       builder: (context, snapShot) {
  //         return GestureDetector(
  //           onTap: () {
  //             //   socket.dispose();
  //             //  await connect();
  //             // print('lopi$msgs');
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => IndividualPage(
  //                           name: res['buddydetails'] != null
  //                               ? res['buddydetails'][0]['username']
  //                               : res['data']['username'],
  //                           userid: profil['_id'],
  //                           buddyid: res['buddydetails'] != null
  //                               ? res['buddydetails'][0]['_id']
  //                               : res['data']['_id'],
  //                           buddyimage: res['buddydetails'] != null
  //                               ? res['buddydetails'][0]['image']['location']
  //                               : res['data']['image']['location'],
  //                         )
  //                     // IndividMessageScreen(name: name)
  //                     //IndividMessageScreen(name: res['data']['username'],)
  //                     ));
  //           },
  //           child: Container(
  //             width: _widthScale * 328,
  //             height: _heightScale * 78,
  //             decoration: BoxDecoration(
  //               color: Colors.white.withOpacity(0.4),
  //               // border: Border.all(
  //               //   color: Color(0xFFA585C1),
  //               // ),
  //               borderRadius: BorderRadius.all(Radius.circular(5)),
  //             ),
  //             child: Row(
  //               children: [
  //                 SizedBox(
  //                   width: 10 * _widthScale,
  //                 ),
  //                 CircleAvatar(
  //                   foregroundColor: Colors.white,
  //                   backgroundColor: Color(0xFFB9B9B9),
  //                   radius: 25 * _widthScale,

  //                   backgroundImage: res == null
  //                       ? NetworkImage('')
  //                       : NetworkImage(res['buddydetails'] != null
  //                           ? res['buddydetails'][0]['image']['location']
  //                           : res['data']['image']['location']),

  //                   //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
  //                   //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
  //                 ),
  //                 SizedBox(
  //                   width: 10 * _widthScale,
  //                 ),
  //                 Column(
  //                   children: [
  //                     SizedBox(
  //                       height: 15 * _heightScale,
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           res == null
  //                               ? " "
  //                               : res['buddydetails'] != null
  //                                   ? res['buddydetails'][0]['username']
  //                                   : res['data']['username'],
  //                           style: GoogleFonts.poppins(
  //                             color: const Color(0xFF5E3E79),
  //                             fontSize: _widthScale * 18,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     Text(
  //                       " Lorem ipsum dolor sit amet, consectetur.r",
  //                       style: GoogleFonts.poppins(
  //                         color: const Color(0xFF263238),
  //                         fontSize: _widthScale * 10,
  //                         fontWeight: FontWeight.w400,
  //                       ),
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }
}

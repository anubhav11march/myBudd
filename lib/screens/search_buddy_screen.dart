import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_skills.dart';
import 'package:mybud/api_service/search_buddy.dart';
import 'package:mybud/api_service/send_invite.dart';
import 'package:mybud/providers/add_detailss.dart';
import 'package:mybud/screens/objective_one_screen.dart';
import 'package:mybud/screens/objective_two_screen.dart';
import 'package:mybud/screens/screen_bio_two.dart';
import 'package:mybud/screens/working_professional.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchBuddyScreen extends StatefulWidget {
  static const String route = '/search buddy_screen';
  const SearchBuddyScreen({Key? key}) : super(key: key);

  @override
  State<SearchBuddyScreen> createState() => _SearchBuddyScreenState();
}

Map<String, bool>? players;
Map<String, bool>? playersName;

class _SearchBuddyScreenState extends State<SearchBuddyScreen> {
  bool selects = false;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  _onAdd(BuildContext context) {
    AddInfo detailProvider = Provider.of<AddInfo>(context, listen: false);
    print(
        'final skills ${players!.keys.toString().replaceAll('(', '').replaceAll(')', '')}');
    detailProvider
        .skii(players!.keys.toString().replaceAll('(', '').replaceAll(')', ''));

    //= 'Btech';
  }

  // var deta;
  // select(var value) {
  //   setState(() {
  //     deta = value;
  //   });
  // }

  TextEditingController _controller = TextEditingController();
// var res;
//   Future<void> getData() async {
//     res = await getUserImage(tokenProfile?.token);
//     print('opop$res');
//     // final ByteData imageData =
//     //     await NetworkAssetBundle(Uri.parse("uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png")).load("");
//     // final Uint8List bytes = imageData.buffer.asUint8List();
//     // print('bytes$bytes');
//     // Image.memory(bytes);
//   }
  var name = '';
  @override
  // void initState() {
  //   super.initState();
  //   skills(name);
  // }

  //List res = [];

  var res;
  skills(name) async {
    res = await getSEarch(tokenProfile?.token, name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    players = {};
    players!.length;
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    timer!.cancel();
    // players = {};
    // players!.length;
  }

  //var dt ;
  int tt = 0;
  int ff() {
    setState(() {
      tt = players!.length;
    });
    return tt;
  }

  var sendinvite;

  invites(buddy) async {
    sendinvite = await SendInvite.verify(buddy, tokenProfile!.token);
    print(sendinvite);
  }

  Timer? timer;
  @override
  Widget build(BuildContext context) {
    //  timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
    ff();
    // });
    // print('...p${players!.length}');

    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    Color col = Color(0xFF775594).withOpacity(0.4);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _heightScale * 29,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: TextField(
                  controller: _controller,
                  onChanged: (val) async {
                    // Future.delayed(Duration(seconds: 5));
                    setState(() {
                      print(val);
                      // getSearch(page, val);
                      skills(val);
                      //  Future.delayed(Duration(seconds: 5));
                      print('t... $res');
                      print("Name is getting printed$val");
                    });
                  },
                  autofocus: false,
                  style: TextStyle(
                      fontSize: _widthScale * 15.0, color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: _widthScale * 10.0, right: _widthScale * 10),
                      child: Icon(
                        Icons.search,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                    // suffix: Padding(
                    //   padding: EdgeInsets.only(right: _widthScale * 18.0),
                    //   child: Image.asset(
                    //     "assets/filter.png",
                    //     height: _heightScale * 20,
                    //     width: _widthScale * 20,
                    //   ),
                    // ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.39),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: _widthScale * 14, color: Color(0xFFCCCCCC)),
                    ),
                    contentPadding: EdgeInsets.only(
                        left: _widthScale * 14.0,
                        bottom: _widthScale * 8.0,
                        top: _widthScale * 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(_widthScale * 6),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(_widthScale * 6),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24 * _widthScale),
                child:
                    // res.isEmpty ? CircularProgressIndicator():

                    Container(
                  height: 660 * _heightScale,
                  width: 330 * _widthScale,
                  child:

                      // res.length == 0 ? CircularProgressIndicator():
                      FutureBuilder(
                          future: skills(_controller.text),
                          builder: (context, snapShot) {
                            print('coni ${_controller.text}');

                            return res == null
                                ? Container(
                                    height: 44 * _heightScale,
                                    width: 330 * _widthScale,
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      color: Color(0xFF775594),
                                    )))
                                : res['data'] == null
                                    ? res['error'] != null
                                        ? Container(
                                            height: 44 * _heightScale,
                                            width: 330 * _widthScale,
                                            child: Center(
                                                child: res['error'] ==
                                                        "No buddyid provided!"
                                                    ? Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              'No buddyId Provided !'),
                                                          Text(
                                                              ' please search your Buddy Id'),
                                                        ],
                                                      )
                                                    : Text("error: " + res['error'])))
                                        : Container(
                                            height: 44 * _heightScale,
                                            width: 330 * _widthScale,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator(
                                              color: Color(0xFF775594),
                                            )))
                                    : Container(
                                        height: 100,
                                        width: 330,
                                        color: Colors.white,
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            radius: 25,
                                            backgroundColor: Color(0xFFA585C1),
                                            backgroundImage: NetworkImage(
                                              res['data']['image']['location'],
                                            ),
                                          ),
                                          title: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => ScreenBioTwo(
                                                          image: res['data']
                                                                  ['image']
                                                              ['location'],
                                                          name: res['data']
                                                              ['username'],
                                                          profession: res['data']
                                                                  ['Info']
                                                              ['profession'],
                                                          details: res['data']
                                                                  ['Info']
                                                              ['details'],
                                                          location: res['data']
                                                              ['location'],
                                                          objective: res['data']
                                                                  ['objective']
                                                              ['title'],
                                                          skills: res['data']
                                                              ['skillsets'])));
                                            },
                                            child: Column(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.center,
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment
                                              //         .start,
                                              children: [
                                                Text(
                                                  res['data']['username'],
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontSize:
                                                              _widthScale * 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color(
                                                              0xFF775594))),
                                                ),
                                                Text(
                                                  res['data']['Info']
                                                      ['profession'],
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontSize:
                                                              _widthScale * 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xFF263238))),
                                                ),
                                              ],
                                            ),
                                          ),
                                          trailing: GestureDetector(
                                            onTap: () async {
                                              showCupertinoDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (contex) {
                                                    return Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black54,
                                                                  offset:
                                                                      const Offset(
                                                                    2.0,
                                                                    2.0,
                                                                  ),
                                                                  blurRadius:
                                                                      6.0,
                                                                  spreadRadius:
                                                                      2.0,
                                                                ), //BoxShadow
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .white,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          0.0),
                                                                  blurRadius:
                                                                      0.0,
                                                                  spreadRadius:
                                                                      0.0,
                                                                ),
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color:
                                                                  Colors.white),
                                                          height: 143 *
                                                              _heightScale,
                                                          width:
                                                              261 * _widthScale,
                                                          child: Column(
                                                            children: [
                                                              // SizedBox(
                                                              //   height: 18 *
                                                              //       _heightScale,
                                                              // ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: Color(
                                                                            0xFFA585C1)),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 8 *
                                                                          _widthScale),
                                                                ],
                                                              ),
                                                              Text(
                                                                'Are you sure you want to',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12 *
                                                                      _widthScale,
                                                                  color: Color(
                                                                      0xFF5E3E79),
                                                                ),
                                                              ),
                                                              Text(
                                                                ' send invite to this person ?',
                                                                style:
                                                                    GoogleFonts
                                                                        .poppins(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12 *
                                                                      _widthScale,
                                                                  color: Color(
                                                                      0xFF5E3E79),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 20 *
                                                                      _heightScale),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  ElevatedButton(
                                                                    style: ButtonStyle(
                                                                        backgroundColor: MaterialStateProperty.all(
                                                                      Colors
                                                                          .red,
                                                                    )),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                      '     No    ',
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                        fontSize:
                                                                            14 *
                                                                                _widthScale,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  ElevatedButton(
                                                                    style: ButtonStyle(
                                                                        backgroundColor: MaterialStateProperty.all(
                                                                      Color(
                                                                          0xFFA585C1),
                                                                    )),
                                                                    onPressed:
                                                                        () async {
                                                                      await invites(res['data']['buddyid']);
                                                                      if (sendinvite[
                                                                              'message'] ==
                                                                          "Invite Sent!") {
                                                                        Fluttertoast.showToast(
                                                                            textColor:
                                                                                Colors.white,
                                                                            backgroundColor: Color(0xFFA585C1),
                                                                            msg: 'Invitation sent to ${res['data']['username']} mail');

                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      } else {
                                                                        Fluttertoast.showToast(
                                                                            msg:
                                                                                'error');
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      '   Yes   ',
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        decoration:
                                                                            TextDecoration.none,
                                                                        fontSize:
                                                                            14 *
                                                                                _widthScale,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                          // Image.network(
                                                          //   widget.buddyimage,
                                                          //   fit: BoxFit.cover,
                                                          // )
                                                          ),
                                                    );
                                                  });
                                            },
                                            child: Text(
                                              'Invite',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontSize:
                                                          _widthScale * 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Color(0xFF775594))),
                                            ),
                                            //   )
                                            // ],
                                          ),
                                        ),
                                      );
                          }),
                ),
              ),
              // SizedBox(
              //   height: _heightScale * 38,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       //  dispose();
              //       _onAdd(context);
              //       if (players!.keys.isEmpty) {
              //         const snackBar = SnackBar(
              //           backgroundColor: Color(0xFFA585C1),
              //           content: Text(
              //             "Choose your Current SkillSet",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           duration: Duration(milliseconds: 2000),
              //         );
              //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //       } else
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => ObjectiveTwoScreen()));
              //     },
              //     style: ElevatedButton.styleFrom(
              //       primary: BoxColor.PurpleBox(context),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //     ),
              //     child: Container(
              //       height: _heightScale * 56,
              //       width: _widthScale * 328,
              //       alignment: Alignment.center,
              //       child: Text(
              //         'Next',
              //         style: GoogleFonts.poppins(
              //             textStyle: TextStyle(
              //           fontSize: _widthScale * 18,
              //           fontWeight: FontWeight.w700,
              //         )),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: _heightScale * 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void showCupertinoDialog({bool barrierDismissible, BuildContext context, Container Function(contex) builder}) {}
}

class PlayerCard extends StatefulWidget {
  final String profile;

  // bool isSelected;

  PlayerCard({required this.profile});

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  // select() {
  //   selectPlayers(false);

  //   // selectPlayer(false);
  // }

  // selectPlayers(bool isCheck) {
  //   if (isCheck == true) {
  //     setState(() {
  //       // if (!players.containsKey('${widget.profile.id}')) {
  //       // players.remove('${widget.profile.id}');
  //       // } else {

  //       players!['${widget.profile}'] = isCheck;
  //       // ff();
  //       //     players!.length;
  //       // playersName['${widget.profile.name}'] = isCheck;

  //       // }
  //     });
  //   } else if (isCheck == false) {
  //     setState(() {
  //       players!.remove('${widget.profile}');
  //     });
  //   }
  //   // print(matchId);
  //   print('players sel: ${players}');
  //   print('players sele: ${players!.values.toString()}');
  //   print('player select : ${players!.length} }');
  // }

  // sele() {
  //   if ((players!['${widget.profile}'] == null) ||
  //       (players!['${widget.profile}'] == false)) {
  //     selectPlayers(true);
  //     // players!.length;
  //   } else if ((players!['${widget.profile}'] == true)) {
  //     selectPlayers(false);
  //   }
  //   //selectPlayer(true);
  // }

  // erer() {
  //   func = widget.players!.length;
  // }

  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;

    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Padding(
      padding: EdgeInsets.only(top: 20 * _heightScale),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)),
        height: _heightScale * 56,
        width: _widthScale * 328,
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(
              width: 15 * _widthScale,
            ),
            Text(
              widget.profile,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: _widthScale * 18,
                      fontWeight: FontWeight.w600,
                      color: (players!['${widget.profile}']) == true
                          ? Colors.white
                          : Color(0xFF775594))),
            ),
            SizedBox(width: 130 * _widthScale),
            GestureDetector(
              onTap: () async {
                //await invites();
              },
              child: Text(
                'Invite',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: _widthScale * 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF775594))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

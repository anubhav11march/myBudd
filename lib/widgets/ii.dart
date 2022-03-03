import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_skills.dart';
import 'package:mybud/providers/add_detailss.dart';
import 'package:mybud/screens/objective_one_screen.dart';
import 'package:mybud/screens/objective_two_screen.dart';
import 'package:mybud/screens/working_professional.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SkillScreen extends StatefulWidget {
  static const String route = '/skills_screen';
  const SkillScreen({Key? key}) : super(key: key);

  @override
  State<SkillScreen> createState() => _SkillScreenState();
}

Map<String, bool>? players;
Map<String, bool>? playersName;

class _SkillScreenState extends State<SkillScreen> {
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

  List res = [];
  skills(name) async {
    res = await getSkills(tokenProfile?.token, name);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _heightScale * 37,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 18),
              child: Row(
                children: [
                  Container(
                    height: _heightScale * 5,
                    width: _widthScale * 246,
                    color: const Color(0xFF7B2CBF),
                  ),
                  Container(
                    height: _heightScale * 5,
                    width: _widthScale * 82,
                    color: const Color(0xFFF3F3F3),
                  ),
                ],
              ),
            ),
            // Text('${widget.players!.length}',         style: GoogleFonts.poppins(
            //         fontSize: _widthScale * 14,
            //         fontWeight: FontWeight.w200,
            //         color: Color(0xFF775594)),),
            SizedBox(
              height: _heightScale * 27,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 25),
              child: Text(
                'Choose your Current Skillset ',
                style: GoogleFonts.poppins(
                    fontSize: _widthScale * 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF775594)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 23 * _widthScale),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    players!.length == null ? '0 selected' : '${tt} selected',
                    style: GoogleFonts.poppins(
                        fontSize: _widthScale * 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF775594)),
                    // textAlign: TextAlign.right
                  ),
                ],
              ),
            ),

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
                autofocus: true,
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
                height: 440 * _heightScale,
                width: 330 * _widthScale,
                child:

                    // res.length == 0 ? CircularProgressIndicator():
                    FutureBuilder(
                        future: skills(_controller.text),
                        builder: (context, snapShot) {
                          print('coni$_controller');

                          return res.isEmpty
                              ? Container(
                                  height: 44 * _heightScale,
                                  width: 330 * _widthScale,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Color(0xFF775594),
                                  )))
                              : SmartRefresher(
                                  controller: refreshController,
                                  enablePullUp: false,
                                  enablePullDown: false,
                                  // onRefresh: _onRefresh,
                                  //   onLoading: () => _onLoading(context),
                                  child: ListView.builder(
                                      itemCount: res.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return PlayerCard(
                                          profile: res[index],
                                        );
                                        // return Padding(
                                        //   padding: EdgeInsets.symmetric(
                                        //       horizontal: _widthScale * 24),
                                        //   child: ElevatedButton(
                                        //     onPressed: () {
                                        //       //   select(res);
                                        //       // Navigator.push(context,
                                        //       //     MaterialPageRoute(builder: (context) => Verification()));
                                        //       // setState(() {
                                        //       //   selects = true;
                                        //       // });
                                        //     },
                                        //     // style: ElevatedButton.styleFrom(
                                        //     //   primary: selects== true
                                        //     //       ? BoxColor.PurpleBox(context)
                                        //     //       : Color(0xFFFFFFFF),
                                        //     //   shape: RoundedRectangleBorder(
                                        //     //     borderRadius: BorderRadius.circular(10.0),
                                        //     //   ),
                                        //     // ),
                                        //     child: Container(
                                        //       height: _heightScale * 56,
                                        //       width: _widthScale * 328,
                                        //       alignment: Alignment.center,
                                        //       child: Text(
                                        //         res[index],
                                        //         style: GoogleFonts.poppins(
                                        //             textStyle: TextStyle(
                                        //                 fontSize: _widthScale * 18,
                                        //                 fontWeight: FontWeight.w600,
                                        //                 color: deta == 'BTech'
                                        //                     ? Colors.white
                                        //                     : Color(0xFF775594))),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // );
                                        // return box2(
                                        //     "assets/Ellipse 9.png",
                                        //     // "Manideep Mittapelli",
                                        //     res != null ? filterUsers[index]['name'] : "",
                                        //     "Sr Technical Program Manager",
                                        //     "assets/Ellipse 182.png",
                                        //     "University Of HartFort",
                                        //     "assets/Rectangle 704.png");
                                      }),
                                );
                        }),
              ),
            ),
            // SizedBox(
            //   height: _heightScale * 38,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              child: ElevatedButton(
                onPressed: () {
                  //  dispose();
                  _onAdd(context);
                  if (players!.keys.isEmpty) {
                    const snackBar = SnackBar(
                      backgroundColor: Color(0xFFA585C1),
                      content: Text(
                        "Choose your Current SkillSet",
                        style: TextStyle(color: Colors.white),
                      ),
                      duration: Duration(milliseconds: 2000),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ObjectiveTwoScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: BoxColor.PurpleBox(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Container(
                  height: _heightScale * 56,
                  width: _widthScale * 328,
                  alignment: Alignment.center,
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: _widthScale * 18,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _heightScale * 15,
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerCard extends StatefulWidget {
  final String profile;

  // bool isSelected;

  PlayerCard({required this.profile});

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  select() {
    selectPlayers(false);

    // selectPlayer(false);
  }

  selectPlayers(bool isCheck) {
    if (isCheck == true) {
      setState(() {
        // if (!players.containsKey('${widget.profile.id}')) {
        // players.remove('${widget.profile.id}');
        // } else {

        players!['${widget.profile}'] = isCheck;
        // ff();
        //     players!.length;
        // playersName['${widget.profile.name}'] = isCheck;

        // }
      });
    } else if (isCheck == false) {
      setState(() {
        players!.remove('${widget.profile}');
      });
    }
    // print(matchId);
    print('players sel: ${players}');
    print('players sele: ${players!.values.toString()}');
    print('player select : ${players!.length} }');
  }

  sele() {
    if ((players!['${widget.profile}'] == null) ||
        (players!['${widget.profile}'] == false)) {
      selectPlayers(true);
      // players!.length;
    } else if ((players!['${widget.profile}'] == true)) {
      selectPlayers(false);
    }
    //selectPlayer(true);
  }

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
        height: 56 * _heightScale,
        width: 328 * _widthScale,
        child: ElevatedButton(
          onPressed: () {
            // if (widget.players!.values == (false) || widget.players!.values.isEmpty) {
            sele();
            // } else if (widget.players!.values == (true)) {
            //   select();
            // }
            //    selectPlayers(val);
            //   select(res);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => Verification()));
            // setState(() {
            //   selects = true;
            // });
          },
          style: ElevatedButton.styleFrom(
            primary: (players!['${widget.profile}']) == true
                ? BoxColor.PurpleBox(context)
                : Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: Container(
            height: _heightScale * 56,
            width: _widthScale * 328,
            alignment: Alignment.center,
            child: Text(
              widget.profile,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: _widthScale * 18,
                      fontWeight: FontWeight.w600,
                      color: (players!['${widget.profile}']) == true
                          ? Colors.white
                          : Color(0xFF775594))),
            ),
          ),
        ),
      ),
    );
  }
}

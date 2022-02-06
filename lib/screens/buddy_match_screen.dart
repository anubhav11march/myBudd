import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_cards.dart';
import 'package:mybud/api_service/get_user_profile.dart';
import 'package:mybud/screens/messages.dart';
import 'package:mybud/widgets/token_profile.dart';

class BuddyMatchScreen extends StatefulWidget {
  static const String route = '/buddy_page_screen';
  const BuddyMatchScreen({Key? key}) : super(key: key);

  @override
  _BuddyMatchScreenState createState() => _BuddyMatchScreenState();
}

class _BuddyMatchScreenState extends State<BuddyMatchScreen> {
  TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool show = false;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  var profile;
  var res;
  getJobs(page) async {
    profile = await getdetails(tokenProfile?.token);
    print('goog${profile['image']['location']}');
    res = await getdummy(page, tokenProfile?.token);
    print('opop${res['data']['image']['location']}');
  }

  Tween<double> _scaleTween = Tween<double>(begin: 1.7, end: 1);
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return FutureBuilder(
        future: getJobs(1),
        builder: (context, snapShot) {
          return Scaffold(
            backgroundColor: Color(0xFFA585C1),
            body: profile == null
                ? Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 172 * _heightScale,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 113 * _widthScale),
                          child: Text(
                            'BOOM',
                            style: GoogleFonts.poppins(
                                fontSize: 42 * _widthScale,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 93 * _widthScale),
                          child: Text(
                            'Buddy Match',
                            style: GoogleFonts.poppins(
                                fontSize: 28 * _widthScale,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 57 * _heightScale,
                        ),
                        // ignore: prefer_const_constructors
                        Stack(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TweenAnimationBuilder(
                              curve: Curves.easeInOutBack,
                              tween: _scaleTween,
                              duration: Duration(milliseconds: 1500),
                              builder: (context, double scale, child) {
                                return Transform.scale(
                                    scale: scale, child: child);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 61 * _widthScale,
                                    right: 174 * _widthScale),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircleAvatar(
                                      // foregroundColor: Colors.white,
                                      backgroundColor: Color(0xFFFFFFFF),
                                      radius: 70 * _widthScale,
                                    ),
                                    // if(profile != null)
                                    CircleAvatar(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xFFB9B9B9),
                                      radius: 65 * _widthScale,

                                      backgroundImage: profile == null
                                          ? NetworkImage('')
                                          : NetworkImage(
                                              profile['image']['location']),

                                      //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
                                      //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: -10,
                            // ),
                            TweenAnimationBuilder(
                              tween: _scaleTween,
                              curve: Curves.easeInCirc,
                              duration: Duration(milliseconds: 1500),
                              builder: (context, double scale, child) {
                                return Transform.scale(
                                    scale: scale, child: child);
                              },
                              child: InkWell(
                                onTap: () {
                                  showCupertinoDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 20 * _heightScale,
                                              ),
                                              Container(
                                                  height: 450 * _heightScale,
                                                  width: 350 * _widthScale,
                                                  child: Image.network(
                                                    res == null
                                                        ? ''
                                                        : res['data']['image']
                                                            ['location'],
                                                    fit: BoxFit.cover,
                                                  )),
                                              Text(res['data']['username'],
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                      fontSize:
                                                          24 * _widthScale,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: _widthScale * 174,
                                      right: _widthScale * 61),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      CircleAvatar(
                                        // foregroundColor: Colors.white,
                                        backgroundColor: Color(0xFFFFFFFF),
                                        radius: 70 * _widthScale,
                                      ),
                                      //  if(res != null)
                                      CircleAvatar(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Color(0xFFB9B9B9),
                                        radius: 65 * _widthScale,

                                        backgroundImage: res == null
                                            ? NetworkImage('')
                                            : NetworkImage(res['data']['image']
                                                ['location']),

                                        //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
                                        //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 57 * _heightScale,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.5 * _widthScale),
                          child: TextField(
                            onTap: () {
                              if (!show) {
                                focusNode.unfocus();
                                focusNode.canRequestFocus = false;
                              }
                              setState(() {
                                show = !show;
                                _controller.clear();
                              });
                              Navigator.of(context)
                                  .pushNamed(MessageScreen.route);
                            },
                            focusNode: focusNode,
                            controller: _controller,
                            textAlign: TextAlign.left,
                            autofocus: false,
                            style: TextStyle(
                                fontSize: _widthScale * 15.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              // suffix: Image.asset(
                              //   'assets/Vector (6).png',
                              //   height: 27 * _heightScale,
                              //   width: 27 * _widthScale,
                              //   // color: Colors.purple,
                              // ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Start Conversation',
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: _widthScale * 14,
                                      color: Color(0xFFB6B6B6),
                                      fontWeight: FontWeight.w600)),
                              contentPadding: EdgeInsets.only(
                                  bottom: _heightScale * 16.0,
                                  top: _heightScale * 16.0,
                                  left: 20.0 * _widthScale),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
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
                        SizedBox(height: 10 * _heightScale),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 93 * _widthScale),
                          child: InkWell(
                            child: Text(
                              "Don't know what to say?",
                              style: GoogleFonts.poppins(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14 * _widthScale,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10 * _heightScale,
                                            ),
                                            Text(
                                              "Suggestions",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 22 * _widthScale,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF5E3E79)),
                                            ),
                                          ],
                                        ),
                                        height: 302 * _heightScale,
                                        width: 375 * _widthScale,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                _widthScale * 25),
                                            topRight: Radius.circular(
                                                _widthScale * 25),
                                          ),
                                        ));
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }
}

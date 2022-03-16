import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_cards.dart';
import 'package:mybud/api_service/get_user_image.dart';
import 'package:mybud/api_service/get_user_profile.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/individ_message.dart';
import 'package:mybud/screens/new_message.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageScreen extends StatefulWidget {
  static const String route = '/message_screen';
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with TickerProviderStateMixin {
  late IO.Socket socket;
  late AnimationController animationController;
  // var response;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // socket =
    //       IO.io("https://sheltered-earth-76230.herokuapp.com", <String, dynamic>{
    //     "transports": ["websocket"],
    //     "autoConnect": false,
    //   });
    connect();
    animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animationController.repeat();
  }

  var profil;
  var res;
  userid() async {
    profil = await getdetails(tokenProfile?.token);
    res = await getdummy(1, tokenProfile?.token);
    print('buddyyyyy${res['isBuddy']}');
    print('userId${profil['_id']}');
    return res;
  }

  // List msgs = [];
  connect() async {
    //   await userid();
    socket =
        IO.io("https://sheltered-earth-76230.herokuapp.com", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
  }

  var pp;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    Widget spacevert = SizedBox(
      height: size.height * 0.04,
    );
    Widget spacehort = SizedBox(
      width: size.width * 0.06,
    );
    Widget spacehort1 = SizedBox(
      width: size.width * 0.35,
    );
    Widget spacevert1 = SizedBox(
      height: size.height * 0.02,
    );
    Widget spacevert2 = SizedBox(
      height: size.height * 0.4,
    );

    return Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color(0xFFE5E5E5),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(_widthScale * 1),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            //Scaffold.of(context).openDrawer();
                          },
                          child: Image.asset(
                            "assets/Vector.png",
                            height: _heightScale * 24,
                            width: _widthScale * 27,
                          )),
                      SizedBox(
                        width: _widthScale * 15,
                      ),
                      Text(
                        "Messages",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF775594),
                          fontSize: _widthScale * 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: FutureBuilder(
            future: userid(),
            builder: (context, snapShot) {
              return res == null
                  ? Center(
                      child: CircularProgressIndicator(
                          valueColor: animationController.drive(ColorTween(
                              begin: Color(0xFFA585C1),
                              end: Color(0xFFB9B9B9)))))
                  : res['isBuddy'] == false
                      ? Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: Container(
                            child: Text(
                              'No Buddy Found',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF5E3E79),
                                fontSize: _widthScale * 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _widthScale * 23),
                          child: Column(
                            children: [
                              SizedBox(
                                height: _heightScale * 24,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    profile(),
                                    // SizedBox(
                                    //   width: _widthScale * 31,
                                    // ),
                                    // profile(),
                                    // SizedBox(
                                    //   width: _widthScale * 31,
                                    // ),
                                    // profile(),
                                    // SizedBox(
                                    //   width: _widthScale * 31,
                                    // ),
                                    // profile(),
                                    // SizedBox(
                                    //   width: _widthScale * 31,
                                    // ),
                                    // profile(),
                                    // SizedBox(
                                    //   width: _widthScale * 31,
                                    // ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: _heightScale * 11,
                              ),
                              Row(
                                children: [
                                  Text(
                                    " If the receiver dosen’t reply in 24hrs the chat will disappear",
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF5E3E79),
                                      fontSize: _widthScale * 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: _heightScale * 11,
                              ),
                              Container(
                                height: _heightScale * 1,
                                width: double.infinity,
                                color: const Color(0xFFABABAB),
                              ),
                              SizedBox(
                                height: _heightScale * 11,
                              ),
                              people(),
                            ],
                          ),
                        );
            }));
  }

  Widget profile() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Container(
      height: 100 * _heightScale,
      width: 330,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: res['buddydetails'] == null
              ? res['data'] == null
                  ? 0
                  : 1
              : res['buddydetails'].length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: _widthScale * 10),
              child: CircleAvatar(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFB9B9B9),
                radius: 36 * _widthScale,

                backgroundImage: res == null
                    ? NetworkImage('')
                    : NetworkImage(res['buddydetails'] != null
                        ? res['buddydetails'][index]['image']['location']
                        : res['data']['image']['location']),

                //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
                //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
              ),
            );
          }),
    );
  }

  Widget people() {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return ListView.builder(
        shrinkWrap: true,
        itemCount: res['buddydetails'] == null
            ? res['data'] == null
                ? 0
                : 1
            : res['buddydetails'].length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4 * _heightScale),
            child: GestureDetector(
              onTap: () async{
                socket.dispose();
                 await connect();
                // print('lopi$msgs');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IndividualPage(
                              ind: res['buddydetails'] == null
                                  ? res['data'] == null
                                      ? 0
                                      : 0
                                  : res['buddydetails'].length - 1 - index,
                              name: res['buddydetails'] != null
                                  ? res['buddydetails'][index]['username']
                                  : res['data']['username'],
                              userid: profil['_id'],
                              buddyid: res['buddydetails'] != null
                                  ? res['buddydetails'][index]['_id']
                                  : res['data']['_id'],
                              buddyimage: res['buddydetails'] != null
                                  ? res['buddydetails'][index]['image']
                                      ['location']
                                  : res['data']['image']['location'],
                            )
                        // IndividMessageScreen(name: name)
                        //IndividMessageScreen(name: res['data']['username'],)
                        ));
              },
              child: Container(
                width: _widthScale * 328,
                height: _heightScale * 78,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  // border: Border.all(
                  //   color: Color(0xFFA585C1),
                  // ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10 * _widthScale,
                    ),
                    CircleAvatar(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFFB9B9B9),
                      radius: 25 * _widthScale,

                      backgroundImage: res == null
                          ? NetworkImage('')
                          : NetworkImage(res['buddydetails'] != null
                              ? res['buddydetails'][index]['image']['location']
                              : res['data']['image']['location']),

                      //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
                      //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
                    ),
                    SizedBox(
                      width: 10 * _widthScale,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15 * _heightScale,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              res == null
                                  ? " "
                                  : res['buddydetails'] != null
                                      ? res['buddydetails'][index]['username']
                                      : res['data']['username'],
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF5E3E79),
                                fontSize: _widthScale * 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          " Lorem ipsum dolor sit amet, consectetur.r",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF263238),
                            fontSize: _widthScale * 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

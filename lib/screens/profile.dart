import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_user_image.dart';
import 'package:mybud/api_service/get_user_profile.dart';
import 'package:mybud/screens/buddy_main_page.dart';
import 'package:mybud/screens/edit_profile.dart';
import 'package:mybud/screens/edit_skills.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:clipboard/clipboard.dart';

class ProfileScreen extends StatefulWidget {
  static const String route = '/profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  var response;
  late AnimationController animationController;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();
    animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animationController.repeat();
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }

  var res;
  var profile;
  Future<void> getData() async {
    res = await getUserImage(tokenProfile?.token);
    profile = await getdetails(tokenProfile?.token);
    print('opop$res');
    // final ByteData imageData =
    //     await NetworkAssetBundle(Uri.parse("uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png")).load("");
    // final Uint8List bytes = imageData.buffer.asUint8List();
    // print('bytes$bytes');
    // Image.memory(bytes);
  }

// display it with the Image.memory widget

  var pp;
  @override
  Widget build(BuildContext context) {
    print('1234$res');
    print(response != null ? "ffdj${response}" : 'aa');
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
    return FutureBuilder(
        future: getData(),
        builder: (context, snapShot) {
          return Scaffold(
            backgroundColor: const Color(0xFFF6F6F6),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: const Color(0xFFF6F6F6),
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
                                Navigator.pop(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Nav1()
                                //         // MainPage()
                                //         ));

                                //   .popAndPushNamed(MainPage.route);
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
                            "My Profile",
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
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
                child: (res == null || profile == null)
                    ? Container(
                        height: _heightScale * 600,
                        width: double.infinity,
                        child: Center(
                            child: CircularProgressIndicator(
                                valueColor: animationController.drive(
                                    ColorTween(
                                        begin: Color(0xFFA585C1),
                                        end: Color(0xFFB9B9B9)))
                                //  color: Color(0xFFA585C1),
                                )))
                    : Column(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.en,
                        children: [
                          SizedBox(
                            height: _heightScale * 29,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFFB9B9B9),
                                  radius: _widthScale * 37.5,

                                  backgroundImage:
                                      //  res == null ? NetworkImage(''):
                                      NetworkImage(res),

                                  //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
                                  //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
                                ),
                              ),
                              SizedBox(
                                width: 190 * _widthScale,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile(
                                                profess: profile['Info']
                                                    ['profession'],
                                                deta: profile['Info']
                                                    ['details'],
                                                rea: profile['objective']
                                                    ['title'],
                                                targ: profile['objective']
                                                    ['target'],
                                                skills: profile['skillsets'],
                                              )));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Edit",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF775594),
                                        fontSize: _widthScale * 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: _widthScale * 5,
                                    ),
                                    Image.asset(
                                      "assets/Group 1067.png",
                                      height: _heightScale * 20,
                                      width: _widthScale * 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _heightScale * 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // SizedBox(width: 10 * _widthScale),
                              Text(
                                'Buddy Id : ',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF828282),
                                  fontSize: 14,
                                ),
                              ),
                              Container(
                                width: 180 * _widthScale,
                                child: Text(
                                  ' ${profile['buddyid']}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12, color: Color(0xFF828282)),
                                  maxLines: 1,
                                  // softWrap: true,
                                  //   overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                'Copy',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF775594),
                                  fontSize: _widthScale * 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 5 * _widthScale),
                              InkWell(
                                  onTap: () {
                                    FlutterClipboard.copy(
                                            profile['buddyid'].toString())
                                        .then((value) => Fluttertoast.showToast(
                                            msg: 'copied',
                                            gravity: ToastGravity.CENTER));
                                    //.then(( value ) => print('copied'));
                                  },
                                  child: Icon(
                                    Icons.copy_outlined,
                                    size: 20,
                                    color: const Color(0xFF775594),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: _heightScale * 10,
                          ),
                          field("Your full name", profile['username']),
                          fields("Your Current Occupation",
                              profile['Info']['profession']),
                          fields("Your Work Experience",
                              profile['Info']['details']),
                          fields("Your Reason", profile['objective']['title']),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'No. of Challenges completed : 0',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xFF828282),
                                    fontSize: _widthScale * 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              // textDirection: TextDirection.ltr,
                              //  textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            height: _heightScale * 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Current Skillset',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(0xFF828282),
                                      fontSize: _widthScale * 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                // textDirection: TextDirection.ltr,
                                //  textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 145 * _widthScale,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditSkills()));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Edit",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF775594),
                                        fontSize: _widthScale * 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: _widthScale * 5,
                                    ),
                                    Image.asset(
                                      "assets/Group 1067.png",
                                      height: _heightScale * 20,
                                      width: _widthScale * 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 300 * _heightScale,
                            width: 330 * _widthScale,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200 * _widthScale,
                                        childAspectRatio: 5 / 2,
                                        crossAxisSpacing: 20 * _widthScale,
                                        mainAxisSpacing: 20 * _widthScale),
                                itemCount: profile['skillsets'].length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 56 * _heightScale,
                                      width: 155 * _widthScale,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          profile['skillsets'][index].toString().trim(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              color: Color(0xFFB6B6B6),
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: _heightScale * 32,
                          ),
                          SizedBox(
                            height: _heightScale * 25,
                          ),
                        ],
                      ),
              ),
            ),
          );
        });
  }

  Widget fields(String title, String name) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        // SizedBox(
        //   height: 30,
        // ),
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Color(0xFF828282),
                    fontSize: _widthScale * 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 5,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Colors.white),
          alignment: Alignment.centerLeft,
          height: _heightScale * 56,
          width: _widthScale * 328,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _widthScale * 8.0),
            child: Text(
              name,
              style: TextStyle(
                  fontSize: _widthScale * 16.0, color: Color(0xFFB6B6B6)),
            ),
          ),
        ),
        SizedBox(
          height: _heightScale * 15,
        ),
      ],
    );
  }

  Widget field(String title, String name) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Column(
      children: [
        // SizedBox(
        //   height: 30,
        // ),
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Color(0xFF828282),
                    fontSize: _widthScale * 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _heightScale * 5,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7), color: Colors.white),
          alignment: Alignment.centerLeft,
          height: _heightScale * 56,
          width: _widthScale * 328,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _widthScale * 8.0),
            child: Text(
              name,
              style: TextStyle(
                  fontSize: _widthScale * 16.0, color: Color(0xFFB6B6B6)),
            ),
          ),
        ),
        SizedBox(
          height: _heightScale * 15,
        ),
      ],
    );
  }
}
// currentUrl(dataPost) {
//   var img = dataPost;
//   if (img != null) {
//     if (img.startsWith('http') && img.startsWith('https')) {
//       return img;
//     } else {
//       return imageUrl2 + img;
//     }
//   } else {
//     return errorImageUrl;
//   }
// }
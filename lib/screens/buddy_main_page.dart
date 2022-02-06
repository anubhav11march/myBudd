import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/add_details.dart';
import 'package:mybud/api_service/get_cards.dart';
import 'package:mybud/api_service/get_user_profile.dart';
import 'package:mybud/api_service/swipe_cards.dart';
import 'package:mybud/providers/add_detailss.dart';
import 'package:mybud/providers/card_provider.dart';
import 'package:mybud/screens/buddy_match_screen.dart';
import 'package:mybud/screens/home_screen.dart';
import 'package:mybud/screens/notification_screen.dart';
import 'package:mybud/screens/profile.dart';
import 'package:mybud/screens/screen_bio.dart';
import 'package:mybud/widgets/app_drawer.dart';
import 'package:mybud/widgets/ii.dart';
import 'package:mybud/widgets/tindercard.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainPage extends StatefulWidget {
  static const String route = '/page_screen';
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double kDesignWidth = 375;
  double kDesignHeight = 812;
  bool gg = false;

  ggg() {
    setState(() {
      gg = true;
    });
  }

//bool
  bool isLoading = false;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  var res;
  List data = [];
  List filter = [];
  List responsejob = [];
  int page = 1;
  //List responsejob=[];

  _onRefresh() async {
    print("vjbdvjhdbvjif");
    page = 1;
    getj(page);
    // await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  void _onLoading(context) async {
    print("loadedede");
    //getJobs(page, valueChoose);
    page = page + 1;
    getJobs(page);
  }

  var profile;
  @override
  void initState() {
    super.initState();

    // apicall = 0;

    //  Provider.of<CardProvider>(context, listen: false);

    getj(page);
  }

  // int apicall = 0;
  getj(page) async {
    res = await getdummy(page, tokenProfile?.token);
    profile = await getdetails(tokenProfile?.token);
    setState(() {
      //   data = response;
      if (page > 1) {
        print("me chla");
        // data.addAll(res['data']); //
        filter = res['data'];

        //  [
        //   ...filter,
        //   ...res['data'],
        // ];
        refreshController.loadComplete();
        print('uioiu$filter');
      } else {
        print("Doneer");
        filter = res['message'] == 'Already have a buddy!' ? [] : res['data'];
      }
      EasyLoading.dismiss();
    });
  }

  // var res;
  getJobs(page) async {
    print('ggtt${tokenProfile?.token}');
    res = await getdummy(page, tokenProfile?.token);
    profile = await getdetails(tokenProfile?.token);
    print('opop$res');

    setState(() {
      //   data = response;
      if (page > 1) {
        print("me chla");
        // data.addAll(res['data']); //
        filter = res['data'];

        //  [
        //   ...filter,
        //   ...res['data'],
        // ];
        refreshController.loadComplete();
        print('uioiu$filter');
      } else {
        print("Donery");
        setState(() {
          isLoading = false;
        });
        filter = res['message'] == 'Already have a buddy!' ? [] : res['data'];
      }
      EasyLoading.dismiss();
    });

    //  print('koko${filter[0]['username']}');
    // print('opop$res');
  }

  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    final provider = Provider.of<CardProvider>(context);

    // if (provider.like()) {
    //   print('jjii');
    // }
    //provider.pop(filter);

    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: CustomAppDrawer(),
      // appBar: AppBar(
      //   leading: Builder(builder: (context) {
      //     return InkWell(
      //       onTap: () => Scaffold.of(context).openDrawer(),
      //       child: Image.asset(
      //         "assets/Vector (1).png",
      //         height: _heightScale * 23,
      //         width: _widthScale * 22,
      //       ),
      //     );
      //   }),
      //   title: Row(
      //     children: [
      //       SizedBox(width: 34 * _widthScale),
      //       Container(
      //         child: Row(
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.only(
      //                   left: 50 * _widthScale,
      //                   top: 6 * _heightScale,
      //                   bottom: 6 * _heightScale),
      //               child: Text(
      //                 'Mybudd',
      //                 style: GoogleFonts.poppins(
      //                     color: Color(0xFF7B2CBF).withOpacity(0.3),
      //                     fontWeight: FontWeight.w600,
      //                     fontSize: 14 * _widthScale),
      //               ),
      //             ),
      //             SizedBox(
      //               width: 24 * _widthScale,
      //             ),
      //             Padding(
      //               padding: EdgeInsets.only(
      //                   top: 6 * _heightScale, bottom: 6 * _heightScale),
      //               child: Image.asset('assets/Group (3).png'),

      //               // AssetImage('')
      //             ),
      //           ],
      //         ),
      //         height: 33 * _heightScale,
      //         width: 159 * _widthScale,
      //         decoration: BoxDecoration(
      //             border: Border(
      //               top: BorderSide(
      //                   color: Color(0xFFC5C5C5),
      //                   width: 1 * _widthScale,
      //                   style: BorderStyle.solid),
      //               left: BorderSide(
      //                   color: Color(0xFFC5C5C5),
      //                   width: 1 * _widthScale,
      //                   style: BorderStyle.solid),
      //               bottom: BorderSide(
      //                   color: Color(0xFFC5C5C5),
      //                   width: 1 * _widthScale,
      //                   style: BorderStyle.solid),
      //               right: BorderSide(
      //                   color: Color(0xFFC5C5C5),
      //                   width: 1 * _widthScale,
      //                   style: BorderStyle.solid),
      //             ),
      //             borderRadius: BorderRadius.circular(17 * _widthScale)),
      //       ),
      //       SizedBox(width: 64 * _widthScale),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => HomeScreen()));
      //           //     Navigator.of(context).pushNamed(NotificationScreen.route);
      //         },
      //         child: Image.asset(
      //           "assets/Vector (5).png",
      //           height: _heightScale * 23,
      //           width: _widthScale * 22,
      //         ),
      //       ),
      //     ],
      //   ),
      //   centerTitle: true,
      //   //  title: ,
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 3.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _widthScale * 22),
            child: Container(
              height: 519 * _heightScale,
              width: 330 * _widthScale,
              alignment: Alignment.center,
              //   padding: EdgeInsets.symmetric(horizontal: 22 * _widthScale),
              child: buildCards(),
              //TinderCard(urlImage: 'assets/unsplash__iKNFEIVthQ (1).png',),
            ),
          ),
          //  Text('yy'),
          SizedBox(
            height: 17.9 * _heightScale,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  final provider =
                      Provider.of<CardProvider>(context, listen: false);
                  provider.dislike();
                },
                child: gg == true
                    ? Image.asset(
                        'assets/Ellipse 153.png',
                        height: _heightScale * 68,
                        width: _widthScale * 68,
                      )
                    : Stack(
                        children: [
                          Image.asset(
                            'assets/Ellipse 153.png',
                            height: _heightScale * 68,
                            width: _widthScale * 68,
                          ),
                          Image.asset(
                            'assets/Vector (2).png',
                            height: _heightScale * 68,
                            width: _widthScale * 68,
                          ),
                        ],
                      ),
              ),
              SizedBox(
                width: 14 * _widthScale,
              ),
              InkWell(
                onTap: () {
                  final provider =
                      Provider.of<CardProvider>(context, listen: false);
                     provider.superLike();
                  //               final rotatedMatrix = Matrix4.identity()
                  //   ..translate(0, 0)
                  //   ..rotateZ(40)
                  //  // ..translate(-center.dx, -center.dy)
                  //   ;
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/Ellipse 154.png',
                      height: _heightScale * 68,
                      width: _widthScale * 68,
                    ),
                    Image.asset(
                      'assets/Vector (3).png',
                      height: _heightScale * 68,
                      width: _widthScale * 68,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 14 * _widthScale,
              ),
              InkWell(
                onTap: () {
                  final provider =
                      Provider.of<CardProvider>(context, listen: false);
                  provider.like();
                  //               final rotatedMatrix = Matrix4.identity()
                  //   ..translate(0, 0)
                  //   ..rotateZ(40)
                  //  // ..translate(-center.dx, -center.dy)
                  //   ;
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/Ellipse 155.png',
                      height: _heightScale * 68,
                      width: _widthScale * 68,
                    ),
                    Image.asset(
                      'assets/Vector (4).png',
                      height: _heightScale * 68,
                      width: _widthScale * 68,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCards() {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    final provider = Provider.of<CardProvider>(context);
    final nameProvider = Provider.of<AddInfo>(context);
    final swipeprov = Provider.of<SwipeCards>(context);
    //  provider.thth(filter);
    final urlImages = provider.urlImages;
    final urlN = provider.truenu;
    final urlNa = nameProvider.urlNames;
    final liker = provider.likes;
    final unliker = provider.unlikes;
    final load = provider.load;
    final superliker = provider.superlikes;
    int numm = provider.num;
    int yu = provider.yuyu;
    int pag = provider.pages;
    provider.pop(filter);
    var response;

    likes() async {
      response = await swipeprov.addDetails(
          swipedby: profile['_id'], swipedon: filter[numm]['_id'], status: '1');
      //   await getJobs(page);
    }

    unlikes() async {
      response = await swipeprov.addDetails(
          swipedby: profile['_id'], swipedon: filter[numm]['_id'], status: '2');

      //  await getJobs(page);
    }

    superlikes() async {
      response = await swipeprov.addDetails(
          swipedby: profile['_id'], swipedon: filter[numm]['_id'], status: '3');

      //  await getJobs(page);
    }

    yy() async {
      if (liker == true) {
        setState(() {
          isLoading = true;
        });
        print('hvhvioliker${profile['_id']}');
        print('hvhv${filter[numm]['_id']}');
        await likes();
        // Future.delayed(Duration(milliseconds: 5000));

        if (response['body']['message'] == "It's a Match!") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BuddyMatchScreen()));
        } else if (response['body']['message'] == "Swiped Successfuly!") {
          print('bhjvjv');
        }
      } else if (unliker == true) {
        setState(() {
          isLoading = true;
        });

        // print('hvhviounliker${profile['_id']}');
        // print('hvhv${filter[numm]['_id']}');
        await unlikes();
      } else if (superliker == true) {
        setState(() {
          isLoading = true;
        });

        // print('hvhviounliker${profile['_id']}');
        // print('hvhv${filter[numm]['_id']}');
        await superlikes();
      }
      if (numm == 0 && provider.truenu == true) {
        print('00000qqqqqppppppppppppppp$pag');

        // setState(() {
        //   //   data = response;
        //   if (page > 1) {
        //     print("me chla");
        //     // data.addAll(res['data']); //
        //     filter = res['data'];

        //     //  [
        //     //   ...filter,
        //     //   ...res['data'],
        //     // ];
        //     refreshController.loadComplete();
        //     print('uioiu$filter');
        //   } else if(page ==1) {
        //     print("Doneer");
        //     filter =
        //         res['message'] == 'Already have a buddy!' ? [] : res['data'];
        //   }
        //   EasyLoading.dismiss();
        // });
        await getJobs(1);
        setState(() {
          numm == 1;
        });
        //  numm == 1;
        print('rttrr$numm');
      }
    }

    //   yy();

    return FutureBuilder(
        future: yy(),
        builder: (context, snapShot) {
          return res == null
              ? const CircularProgressIndicator(
                  color: Color(0xFFA585C1),
                )
              // : isLoading == true
              //     ?

              //     //  filter[numm]['_id'] == res[numm]['_id'] ?
              //     // yu == 1 ?
              //     const CircularProgressIndicator(
              //         color: Color(0xFFA585C1),
              //       )
              : res['message'] == 'Already have a buddy!'
                  ? InkWell(
                      child: Text(
                        'Buddy Found',
                        style: GoogleFonts.poppins(
                            color: Color(0xFFA585C1),
                            fontWeight: FontWeight.w600,
                            fontSize: 20 * _widthScale),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(BuddyMatchScreen.route);
                      },
                    )
                  : filter.isEmpty
                      ? const CircularProgressIndicator(
                          color: Color(0xFFA585C1),
                        )
                      :
                      //numm == null ?

                      numm == filter.length
                          ? Text('List is empty')
                          : filter[numm]['Info'] == null
                              ? Text('list is empty')
                              : InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ScreenBio(
                                                  image: filter[numm]['image']
                                                      ['location'],
                                                  profession: filter[numm]
                                                      ['Info']['profession'],
                                                  name: filter[numm]
                                                      ['username'],
                                                  details: filter[numm]['Info']
                                                      ['details'],
                                                  location: filter[numm]
                                                      ['location'],
                                                  objective: filter[numm]
                                                      ['objective']['title'],
                                                  skills: filter[numm]
                                                      ['skillsets'],
                                                )));
                                  },
                                  child: Stack(
                                    children: urlImages
                                        .map((urlImage) => TinderCard(
                                            // nam: urlNames.map((urll) {
                                            //   return urll;
                                            // }).first,

                                            nam: filter[numm]['username'],
                                            profession: filter[numm]['Info']
                                                ['profession'],
                                            details: filter[numm]['Info']
                                                ['details'],
                                            location: filter[numm]['location'],
                                            skills: filter[numm]['skillsets'],
                                            reason: filter[numm]['objective']
                                                ['title'],
                                            //  urlNames.map((urlName) =>  urlName),

                                            // urlNames.forEach((int element) =>
                                            //    urlNames[urlNames[element],
                                            // )     ,
                                            urlImage: urlImage,
                                            // urlImage: urlImage,
                                            isFront:
                                                urlImages.last == urlImage))
                                        .toList(),
                                    // urlNames.map((e) => null)
                                  ),
                                );
        });

    //  urlNames.map((e) => null)
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
        if (index == 0) {
          Navigator.of(context).pushReplacementNamed(ProfileScreen.route);
        } else if (index == 1) {
          Navigator.of(context).pushReplacementNamed(MainPage.route);
        } else if (index == 2) {
          Navigator.of(context).pushReplacementNamed(BuddyMatchScreen.route);
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

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/get_user_challenges.dart';
import 'package:mybud/api_service/post_user_attendance.dart';
import 'package:mybud/screens/active_challenge_bio_screen.dart';
import 'package:mybud/widgets/chat.dart';
import 'package:mybud/widgets/data.dart';
import 'package:mybud/widgets/dismissible_widget.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:mybud/widgets/utils.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  @override
  void initState() {
    super.initState();
    iioo();
  }

  attend(name) async {
    var atten = await PostAttendance.verify(name, tokenProfile?.token);

    // if (atten['success'] == false) {
    //   Fluttertoast.showToast(msg: atten['error']);
    // } else {
    //   Fluttertoast.showToast(msg: atten['message']);
    // }

    // setState(() {
    //   isLO = false;
    // });

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => Nav1(
    //               ino: 2,
    //             )));
  }

  var res;
  var x;
  var days;
  List items = [];
  List day = [];
  List startdates = [];
  List enddates = [];
  List counters = [];
  List ider = [];
  List complete = [];
  var startdate;
  var enddate;
  var y;
  var counter;
  var id;
  var co;
  iioo() async {
    res = await getUserChallenges(tokenProfile?.token);

    print('${res['data']}');
    x = List.generate(res == null ? 0 : res['data'].length,
        (index) => res['data'][index]['name']);

    days = List.generate(res == null ? 0 : res['data'].length,
        (index) => res['data'][index]['days']);

    startdates = List.generate(res == null ? 0 : res['data'].length,
        (index) => res['data'][index]['createdDate']);

    enddates = List.generate(res == null ? 0 : res['data'].length,
        (index) => res['data'][index]['finalDate']);

    counters = List.generate(res == null ? 0 : res['data'].length,
        (index) => res['data'][index]['counter']);

    ider = List.generate(res == null ? 0 : res['data'].length,
        (index) => res['data'][index]['_id']);
    complete = List.generate(res == null ? 0 : res['data'].length,
        (index) => res['data'][index]['isCompleted']);
    //  print('list............$x');
    //setState(() {
    items = x;
    day = days;
    startdate = startdates;
    enddate = enddates;
    counter = counters;
    id = ider;
    co = complete;
    //  });
    // items =
    //     // x;
    //     //  List.generate(res['data'].length, (index) => res['data'][index]);
    //     x;
    print('items-----$items');
    print('counterrrrrrr.....$counter');
  }

  // ignore: avoid_print

  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;

    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return FutureBuilder(
        future: iioo(),
        builder: (context, snapShot) {
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 21 * _widthScale, vertical: 8 * _heightScale),
                  child: Row(
                    children: [
                      Text(
                        'Active Challenges',
                        style: GoogleFonts.poppins(
                            fontSize: 20 * _widthScale,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA585C1)),
                      ),
                      SizedBox(
                        width: 100 * _widthScale,
                      ),
                      Text(
                        x == null
                            ? 0.toString() + '/' + '3'
                            : x.length.toString() + '/' + '3',
                        style: GoogleFonts.poppins(
                            fontSize: 20 * _widthScale,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFA585C1)),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 330 * _heightScale,
                  child: ListView.separated(
                    itemCount: x == null ? 0 : x.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final da = day[index];
                      final start = startdate[index];
                      final end = enddate[index];
                      final count = counter[index];
                      final ids = id[index];
                      final comps = co[index];

                      return DismissibleWidget(
                        item: item,
                        child: Column(
                          children: [
                            buildListTile(item, da, start, end, count,
                                _widthScale, ids, comps),
                          ],
                        ),
                        onDismissed: (direction) =>
                            dismissItem(context, index, direction),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  void dismissItem(
    BuildContext context,
    int index,
    DismissDirection direction,
  ) {
    switch (direction) {
      case DismissDirection.endToStart:
        Utils.showSnackBar(context, 'Challenge deleted', Color(0xFFEF4C48));
        break;
      case DismissDirection.startToEnd:
        attend(items[index]);
        // setState(() {
        //   iioo();
        // });
        Utils.showSnackBar(context, 'Challenge Done !', Color(0xFFA585C1));
        break;
      default:
        break;
    }
    setState(() {
      items.removeAt(index);
      iioo();
    });
  }

  Widget buildListTile(
          item, dd, starts, ends, counts, double _width, idd, comp) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.black54, width: 0.0, style: BorderStyle.none),
            color: Colors.white,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10 * _width,
              vertical: 3,
            ),
            // leading: CircleAvatar(
            //   radius: 28,
            //   backgroundImage: NetworkImage(item.urlAvatar),
            // ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item,
                  style: GoogleFonts.poppins(
                      fontSize: 14 * _width,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4D4D4D)),
                ),
                const SizedBox(height: 10),
                LinearPercentIndicator(
                  barRadius: Radius.circular(10),
                  width: 310 * _width,
                  animation: true,
                  lineHeight: 8.0,
                  animationDuration: 1500,
                  percent: counts.length / dd,
                  // center: Text("80.0%"),
                  //   linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Color(0xFFA585C1),
                ),
                SizedBox(height: 5),
                Text(
                  '(' + (dd).toString() + ' days' + ')',
                  style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4D4D4D)),
                ),
                //  Text(item.message)
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ActiveChallengeScreen(
                            name: item,
                            startdate: starts,
                            enddate: ends,
                            counts: counts,
                            id: idd,
                            comp: comp,
                          )));
            },
          ),
        ),
      );
}

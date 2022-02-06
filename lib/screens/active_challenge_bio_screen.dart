import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mybud/api_service/post_user_attendance.dart';
import 'package:mybud/screens/to_do_list_screen.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class ActiveChallengeScreen extends StatefulWidget {
  var name;
  var startdate;
  var enddate;
  var counts;
  ActiveChallengeScreen(
      {required this.name,
      required this.startdate,
      required this.enddate,
      required this.counts});
  // const ActiveChallengeScreen({Key? key}) : super(key: key);

  @override
  _ActiveChallengeScreenState createState() => _ActiveChallengeScreenState();
}

class _ActiveChallengeScreenState extends State<ActiveChallengeScreen> {
  attend() async {
    var atten = await PostAttendance.verify(widget.name, tokenProfile?.token);

    Navigator.push(context, MaterialPageRoute(builder: (context) => Nav1(ino: 2,)));
  }

  Widget build(BuildContext context) {
    print('popo${widget.counts}');
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
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
        title: Text(
          widget.name,
          style: GoogleFonts.poppins(
            color: const Color(0xFF775594),
            fontSize: _widthScale * 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 337,
              child: TableCalendar(
                //     onDaySelected: (selectedDay, focusedDay) => ,
                calendarStyle: CalendarStyle(
                    weekendTextStyle: GoogleFonts.poppins(color: Colors.white),
                    weekendDecoration: BoxDecoration(
                        color: Color(0xFFABABAB).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    defaultTextStyle: GoogleFonts.poppins(color: Colors.white),
                    defaultDecoration: BoxDecoration(
                        color: Color(0xFFABABAB).withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10))),
                firstDay: DateTime.utc(2010, 10, 16),
                rangeStartDay: DateTime.parse(widget.startdate),
                //DateTime.now().add(Duration(days: 1)),
                rangeEndDay: DateTime.parse(widget.enddate),
                //DateTime.now().add(Duration(days: 3)),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                calendarBuilders: CalendarBuilders(
                  todayBuilder: (context, day, focusedDay) {
                    if (widget.counts
                        .toString()
                        .contains(day.toString().replaceRange(10, 24, ''))) {
                      print(
                          '[][][][${widget.counts.toString().contains(day.toString().replaceRange(10, 24, ''))}');
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFA585C1),
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    } else
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFF76D4C3), width: 2),
                              // color: Color(0xFFA585C1),
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Color(0xFF76D4C3)),
                            ),
                          ),
                        ),
                      );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF76D4C3),
                            borderRadius: BorderRadius.circular(10)),

                        //   color: Color(0xFF76D4C3),
                        child: Center(
                          child: Text(
                            day.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  rangeStartBuilder: (context, day, focusedDay) {
                    if (widget.counts.toString().contains(
                                day.toString().replaceRange(10, 24, '')) ==
                            false &&
                        ((focusedDay.microsecondsSinceEpoch -
                                day.microsecondsSinceEpoch) >
                            0)) {
                      print(
                          '[][][][${widget.counts.toString().contains(day.toString().replaceRange(10, 24, ''))}');
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    } else if (widget.counts
                        .toString()
                        .contains(day.toString().replaceRange(10, 24, ''))) {
                      print(
                          '[][][pppp][${widget.counts.toString().contains(day.toString().replaceRange(10, 24, ''))}');
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFA585C1),
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF76D4C3),
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  rangeEndBuilder: (context, day, focusedDay) {
                    if (widget.counts.toString().contains(
                                day.toString().replaceRange(10, 24, '')) ==
                            false &&
                        ((focusedDay.microsecondsSinceEpoch -
                                day.microsecondsSinceEpoch) >
                            0)) {
                      print(
                          '[][][][${widget.counts.toString().contains(day.toString().replaceRange(10, 24, ''))}');
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    } else if (widget.counts
                        .toString()
                        .contains(day.toString().replaceRange(10, 24, ''))) {
                      print(
                          '[][][][${widget.counts.toString().contains(day.toString().replaceRange(10, 24, ''))}');
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFA585C1),
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF76D4C3),
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  withinRangeBuilder: (context, day, focusedDay) {
                    if (widget.counts.toString().contains(
                                day.toString().replaceRange(10, 24, '')) ==
                            false &&
                        ((focusedDay.microsecondsSinceEpoch -
                                day.microsecondsSinceEpoch) >
                            0)) {
                      print(
                          '[][][][${widget.counts.toString().contains(day.toString().replaceRange(10, 24, ''))}');
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    } else if (widget.counts
                        .toString()
                        .contains(day.toString().replaceRange(10, 24, ''))) {
                      print(
                          '[][][][${widget.counts.toString().contains(day.toString().replaceRange(10, 24, ''))}');
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFA585C1),
                              borderRadius: BorderRadius.circular(10)),

                          //   color: Color(0xFF76D4C3),
                          child: Center(
                            child: Text(
                              day.day.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    } else
                      print('[][][][]${day.day.toString()}');
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF76D4C3),
                            borderRadius: BorderRadius.circular(10)),

                        //   color: Color(0xFF76D4C3),
                        child: Center(
                          child: Text(
                            day.day.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  rangeHighlightBuilder: (context, day, isWithinRange) {
                    if (isWithinRange == true)
                      return Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          // child: Text(
                          //   day.day.toString(),
                          //   style: TextStyle(color: Colors.white),
                          // ),
                        ),
                      );
                  },
                  // dowBuilder: (context, day) {
                  //   if (day.weekday == DateTime.sunday) {
                  //     final text = DateFormat.E().format(day);

                  //     return Center(
                  //       child: Text(
                  //         text,
                  //         style: TextStyle(color: Colors.red),
                  //       ),
                  //     );
                  //   }
                  // },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: _heightScale * 8,
                  width: _widthScale * 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFA585C1),
                  ),
                ),
                SizedBox(width: _widthScale * 8),
                Text(
                  'Completed',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFABABAB),
                    fontSize: _widthScale * 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: _widthScale * 32),
                Container(
                  height: _heightScale * 8,
                  width: _widthScale * 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFEF4C48),
                  ),
                ),
                SizedBox(width: _widthScale * 8),
                Text(
                  'Not Completed',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFABABAB),
                    fontSize: _widthScale * 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: _heightScale * 8,
                  width: _widthScale * 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF76D4C3),
                  ),
                ),
                SizedBox(width: _widthScale * 8),
                Text(
                  'Next Due',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFABABAB),
                    fontSize: _widthScale * 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: _widthScale * 47),
                Container(
                  height: _heightScale * 8,
                  width: _widthScale * 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFABABAB),
                  ),
                ),
                SizedBox(width: _widthScale * 8),
                Text(
                  'Yet to come',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFABABAB),
                    fontSize: _widthScale * 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100 * _heightScale,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 21.0 * _widthScale),
                  child: ElevatedButton(
                    onPressed: () async {
                      await attend();
                      //   _onSubmit(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: BoxColor.PurpleBox(context),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: _heightScale * 56,
                      width: _widthScale * 130,
                      child: Text(
                        'Done !',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 22 * _widthScale,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 6 * _heightScale,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 21.0 * _widthScale),
                  child: ElevatedButton(
                    onPressed: () {
                      //   _onSubmit(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFEF4C48),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: _heightScale * 56,
                      width: _widthScale * 130,
                      child: Text(
                        'Delete ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 22 * _widthScale,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//   CalendarController _controller = CalendarController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(19.0),
//         child: Container(
//           alignment: Alignment.center,
//           height: 371,
//           width: 337,
//           child: SfCalendar(
//             controller: _controller,
//             appointmentBuilder: (context, calendarAppointmentDetails) {
//               if (calendarAppointmentDetails.isMoreAppointmentRegion) {
//                 return Container(
//                   color: Colors.amber,
//                   width: calendarAppointmentDetails.bounds.width,
//                   height: calendarAppointmentDetails.bounds.height,
//                   child: Text('+More'),
//                 );
//               } else if (_controller.view == CalendarView.month) {
//                 // return Padding(
//                 //   padding: const EdgeInsets.all(4.0),
//                 //   child: Container(
//                 //     decoration: BoxDecoration(
//                 //       borderRadius: BorderRadius.circular(10),
//                 //       color: Colors.amber,
//                 //     ),
//                 //     alignment: Alignment.center,
//                 //     child: Text(
//                 //       'kln',
//                 //     ),
//                 //   ),
//                 // );
//                 //   }
//                 // final Appointment appointment =
//                 //     calendarAppointmentDetails.appointments.first;
//                 return Container(
//                   //   height: 10,
//                   decoration: BoxDecoration(
//                     color: Colors.pink,
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.all(Radius.circular(40.0)),
//                     // gradient: LinearGradient(
//                     //     colors: [Colors.red, Colors.cyan],
//                     //     begin: Alignment.centerRight,
//                     //     end: Alignment.centerLeft)
//                   ),
//                   alignment: Alignment.center,
//                   // child: appointment.isAllDay
//                   //     ? Text('${appointment.subject}',
//                   //         textAlign: TextAlign.left,
//                   //         style: TextStyle(color: Colors.white, fontSize: 10))
//                   //     : Column(
//                   //         mainAxisAlignment: MainAxisAlignment.center,
//                   //         children: [
//                   //           Text('${appointment.subject}',
//                   //               textAlign: TextAlign.left,
//                   //               style: TextStyle(
//                   //                   color: Colors.white, fontSize: 10)),
//                   //           Text(
//                   //               '${DateFormat('hh:mm a').format(appointment.startTime)} - ' +
//                   //                   '${DateFormat('hh:mm a').format(appointment.endTime)}',
//                   //               textAlign: TextAlign.left,
//                   //               style: TextStyle(
//                   //                   color: Colors.white, fontSize: 10))
//                   //         ],
//                   //       )
//                 );
//               } else {
//                 final Appointment appointment =
//                     calendarAppointmentDetails.appointments.first;
//                 return Container(
//                   color: Colors.amber,
//                   width: calendarAppointmentDetails.bounds.width,
//                   height: calendarAppointmentDetails.bounds.height,
//                   child: Text(appointment.subject),
//                 );
//               }
//             },
//             //   },
//             // specialRegions: _getTimeRegions(),
//             // timeRegionBuilder:
//             //     (BuildContext contex, TimeRegionDetails timeRegionDetails) {
//             //   return Container(
//             //     margin: EdgeInsets.all(1),
//             //     alignment: Alignment.center,
//             //     child: Text(
//             //       'mknjnjn',
//             //       style: TextStyle(color: Colors.black),
//             //     ),
//             //     decoration: BoxDecoration(
//             //         color: Colors.amber,
//             //         shape: BoxShape.rectangle,
//             //         borderRadius: BorderRadius.all(Radius.circular(4.0)),
//             //         gradient: LinearGradient(
//             //             colors: [timeRegionDetails.region.color!, Colors.cyan],
//             //             begin: Alignment.centerRight,
//             //             end: Alignment.centerLeft)),
//             //   );
//             // },
//             monthCellBuilder:
//                 (BuildContext buildContext, MonthCellDetails details) {
//               return Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Color(0xFFABABAB),
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(
//                     details.date.day.toString(),
//                   ),
//                 ),
//               );
//             },
//             backgroundColor: Colors.white,

//             view: CalendarView.month,
//             dataSource: MeetingDataSource(_getDataSource()),
//             // by default the month appointment display mode set as Indicator, we can
//             // change the display mode as appointment using the appointment display
//             // mode property
//             monthViewSettings: const MonthViewSettings(
//                 appointmentDisplayMode:
//                     MonthAppointmentDisplayMode.appointment),
//           ),
//         ),
//       ),
//     ));
//   }

// // Widget timeRegionBuilder(
// //     BuildContext context, TimeRegionDetails timeRegionDetails) {
// //   if (timeRegionDetails.region.text == "Lunch") {
// //     return Container(
// //       color: timeRegionDetails.region.color,
// //       alignment: Alignment.center,
// //       child: Icon(
// //         Icons.restaurant,
// //         color: Colors.grey.withOpacity(0.5),
// //       ),
// //     );
// //   } else if (timeRegionDetails.region.text == "WeekEnd") {
// //     return Container(
// //       color: timeRegionDetails.region.color,
// //       alignment: Alignment.center,
// //       child: Icon(
// //         Icons.weekend,
// //         color: Colors.grey.withOpacity(0.5),
// //       ),
// //     );
// //   }
// // }
//   List<TimeRegion> _getTimeRegions() {
//     final List<TimeRegion> regions = <TimeRegion>[];
//     regions.add(TimeRegion(
//         startTime: DateTime.now(),
//         endTime: DateTime.now().add(Duration(days: 7)),
//         enablePointerInteraction: false,
//         color: Colors.grey,
//         text: 'Break'));

//     return regions;
//   }

//   List<Meeting> _getDataSource() {
//     final List<Meeting> meetings = <Meeting>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//         DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime = startTime.add(const Duration(days: 7));
//     meetings.add(
//         Meeting('Confe', startTime, endTime, const Color(0xFFA585C1), false));
//     return meetings;
//   }
// }

// /// An object to set the appointment collection data source to calendar, which
// /// used to map the custom appointment data to the calendar appointment, and
// /// allows to add, remove or reset the appointment collection.
// class MeetingDataSource extends CalendarDataSource {
//   /// Creates a meeting data source, which used to set the appointment
//   /// collection to the calendar
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }

//   @override
//   DateTime getStartTime(int index) {
//     return _getMeetingData(index).from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return _getMeetingData(index).to;
//   }

//   @override
//   String getSubject(int index) {
//     return _getMeetingData(index).eventName;
//   }

//   @override
//   Color getColor(int index) {
//     return _getMeetingData(index).background;
//   }

//   @override
//   bool isAllDay(int index) {
//     return _getMeetingData(index).isAllDay;
//   }

//   Meeting _getMeetingData(int index) {
//     final dynamic meeting = appointments![index];
//     late final Meeting meetingData;
//     if (meeting is Meeting) {
//       meetingData = meeting;
//     }

//     return meetingData;
//   }
// }

// /// Custom business object class which contains properties to hold the detailed
// /// information about the event data which will be rendered in calendar.
// class Meeting {
//   /// Creates a meeting class with required details.
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;

//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;

//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;

//   /// Background which is equivalent to color property of [Appointment].
//   Color background;

//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }

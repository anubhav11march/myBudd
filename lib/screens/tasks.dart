import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/api_service/delete_task.dart';
import 'package:mybud/api_service/get_all_tasks.dart';
import 'package:mybud/screens/add_tasks_screen.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskScreen extends StatefulWidget {
  static const String route = '/tasks_screen';
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<String> items = [];
  final ScrollController _scrollController = ScrollController();
  double indicator = 10.0;
  bool onTop = true;
  Map<String, dynamic> goals = {};

  @override
  void initState() {
    task();
    getgoals();
    super.initState();
    // Future.delayed(Duration(seconds: 5), () {
    //   print('6515165');
    //   task();
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  var tasks;
  task() async {
    tasks = await gettasks(tokenProfile?.token);
    // return tasks;
  }

  delete(task) async {
    var del = await DeleteTask.verify(task, tokenProfile?.token);
  }

  getgoals() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    var goal = prefs.getString("/GOALS");
    setState(() {
      goals = jsonDecode(goal!);
    });
    print(goals);
  }

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  // void _onRefresh() async {
  //   setState(() {
  //     print("vjbdvjhdbvjif");
  //     task();
  //     print("23");
  //     // await Future.delayed(Duration(milliseconds: 1000));

  //     refreshController.refreshCompleted();
  //     print("22");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

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
                            Navigator.of(context).pop();
                            //  Navigator.of(context).popAndPushNamed(MainPage.route);
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
                        "Goals",
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
        body: Column(
          children: [
            yourgoals(goals),
            FutureBuilder(
                future: task(),
                builder: (context, snapShot) {
                  return tasks == null
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.purple[300],
                        ))
                      : tasks['success'] == false
                          ? Container()
                          : tasks['data'][0]['tasks1'] == null
                              ? Center(child: Text('No tasks created'))
                              : Container(
                                  child: ListView.builder(
                                      controller: _scrollController,
                                      itemCount: tasks['data'][0]['tasks1'].length,
                                      itemBuilder: (BuildContext ctxt, int index) {
                                        return
                                            //  Container(
                                            //   height: 52 * _heightScale,
                                            //   width: 332 * _widthScale,
                                            //   color: Colors.white,
                                            //   child: Text(tasks['data'][0]['tasks1'][index]
                                            //       ['taskname']),
                                            // );

                                            GestureDetector(
                                          onTap: () {
                                            showCupertinoDialog(
                                                barrierDismissible: true,
                                                context: context,
                                                builder: (contex) {
                                                  return Container(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(10),
                                                            color: Colors.white),
                                                        height: 100 * _heightScale,
                                                        width: 300 * _widthScale,
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                                  10 * _heightScale,
                                                            ),
                                                            Text(
                                                              'Do you want to delete the task ?',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                fontSize: 14 *
                                                                    _widthScale,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 8 *
                                                                    _heightScale),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                          backgroundColor:
                                                                              MaterialStateProperty
                                                                                  .all(
                                                                    Colors.grey,
                                                                  )),
                                                                  onPressed:
                                                                      () async {
                                                                    Navigator.pop(
                                                                        context);
                                                                    // setState(() {
                                                                    //  await gettasks(tokenProfile?.token);
                                                                    //  });
                                                                  },
                                                                  child: Text(
                                                                    '    Cancel   ',
                                                                    style:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      fontSize: 14 *
                                                                          _widthScale,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                                ElevatedButton(
                                                                  style:
                                                                      ButtonStyle(
                                                                          backgroundColor:
                                                                              MaterialStateProperty
                                                                                  .all(
                                                                    Colors.red,
                                                                  )),
                                                                  onPressed:
                                                                      () async {
                                                                    await delete(tasks[
                                                                                'data'][0]
                                                                            [
                                                                            'tasks1']
                                                                        [
                                                                        index]['_id']);
                                                                    Navigator.pop(
                                                                        context);
                                                                    Fluttertoast
                                                                        .showToast(
                                                                            msg:
                                                                                'Tasks Deleted Successfully !');
                                                                    setState(() {
                                                                      task();
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    '   Delete   ',
                                                                    style:
                                                                        GoogleFonts
                                                                            .poppins(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      fontSize: 14 *
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
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 22 * _widthScale,
                                                vertical: 4 * _heightScale),
                                            child: Card(
                                              elevation: 0,
                                              color: Colors.white,
                                              child: ListTile(
                                                // selectedTileColor: Colors.yellowAccent,
                                                //   shape: ShapeBorder.lerp(a, b, t),
                                                title: Text(
                                                    tasks['data'][0]['tasks1']
                                                        [index]['taskname'],
                                                    style: GoogleFonts.poppins(
                                                        color: Color(0xFF464646),
                                                        fontSize: 14 * _widthScale,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                                trailing: Text(
                                                    '${tasks['data'][0]['tasks1'][index]['remainingdays'].toString()}' +
                                                        ' days left',
                                                    style: GoogleFonts.poppins(
                                                        color: Color(0xFF464646),
                                                        fontSize: 14 * _widthScale,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                );
                }),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTasksScreen()))
                .then((data) async {
              setState(() {
                task();
              });}
            );
          },
          child: Icon(
              Icons.add_circle,
            size: 54 * _widthScale,
            color: Color(0xffA585C1),
          ),
        ),
        // floatingActionButton: ScrollingFabAnimated(
        //   color: Color(0xFFA585C1),
        //   icon: Icon(
        //     Icons.add,
        //     color: Colors.white,
        //   ),
        //   text: Text(
        //     'Add Task',
        //     style: TextStyle(color: Colors.white, fontSize: 14.0),
        //   ),
        //   onPress: () {
        //       // then will return value when the loginScreen's pop is called.
        //       //   await gettasks(tokenProfile?.token);
        //       //  debugPrint(data);
        //     });
        //   },
        //   animateIcon: true,
        // )
    );
  }
  yourgoals(Map<String, dynamic> data) {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.keys.length,
            itemBuilder: (context, index) {
              print(data.keys.length);
              return ListTile(
                title: Text(data.keys.elementAt(index)),
                subtitle: TextFormField(
                  initialValue: data.values.elementAt(index),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder()
                  ),
                  onChanged: (val) {
                    setState(() {
                      data.update(data.keys.elementAt(index), (value) => val.toString());
                    });
                  },
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setString("/GOALS", jsonEncode(data));
              Fluttertoast.showToast(msg: "Goals updated");
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: const Color(0xffA585C1),
                borderRadius: BorderRadius.circular(20)
              ),
              child: const Center(
                child: Text(
                  "Update your Goals",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          )
        ],
      );
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:mybud/api_service/add_task.dart';
import 'package:mybud/api_service/get_all_tasks.dart';
import 'package:mybud/screens/tasks.dart';
import 'package:mybud/theme_modules/box_color.dart';
import 'package:mybud/widgets/token_profile.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({Key? key}) : super(key: key);

  @override
  _AddTasksScreenState createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  TextEditingController _controller = TextEditingController();
  bool isLoading1 = false;
  String? time;

//  Future<void> getData() async {
//     res = await getdetails(tokenProfile?.token);
//     // print('opop$res');
//   }

  _onSubmit(BuildContext context) async {
    if (_controller.text.isEmpty) {
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Enter title",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (time == null) {
      setState(() {
        isLoading1 = false;
      });
      const snackBar = SnackBar(
        backgroundColor: Color(0xFFA585C1),
        content: Text(
          "Select Future time",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      var response = await AddTask.verify(
          _controller.text.trim(), time!, tokenProfile?.token);
      if (response['success'] == false &&
          response['error'] ==
              "Completion date should be greater than today's date") {
        setState(() {
          isLoading1 = false;
        });

        const snackBar = SnackBar(
          backgroundColor: Color(0xFFA585C1),
          content: Text(
            "Completion date should be greater than today's date",
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(milliseconds: 2000),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        // Navigator.popAndPushNamed(context, TaskScreen.route);
        //  await gettasks(tokenProfile?.token);
        setState(() {
          isLoading1 = false;
        });
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => TaskScreen()));
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => TaskScreen()),
        //     (route) => false);
        Navigator.pop(context);
        Fluttertoast.showToast(msg: 'Tasks Added Successfully !');
      }
      //
    }
  }

  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFFFFFFF),
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
                      "Add Task",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23 * _widthScale),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15 * _heightScale,
            ),
            Text(
              'Title *',
              style: GoogleFonts.poppins(
                color: const Color(0xFF775594),
                fontSize: _widthScale * 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFormField(
              minLines: 1,
              maxLines: 5,
              cursorColor: Color(0xFF775594),
              controller: _controller,
              autofocus: false,
              style: GoogleFonts.poppins(
                decoration: TextDecoration.none,
                // fontWeight: FontWeight.normal,
                // color: Colors.purple,
                // fontSize: 15,
              ),

              //TextStyle(fontSize: 15.0, color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                // prefixIcon: Icon(
                //   Icons.lock_open_outlined,
                //   size: 18 * _widthScale,
                //   color: Color(0xFF775594),
                // ),
                hintText: 'Title',
                hintStyle: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16 * _widthScale,
                        color: Color(0xFFB6B6B6),
                        fontWeight: FontWeight.w500)),
                contentPadding: EdgeInsets.only(
                    left: 14.0 * _widthScale,
                    bottom: 14.0 * _widthScale,
                    top: 14.0 * _heightScale),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF775594)),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                  borderRadius: BorderRadius.circular(6),
                ),
                // UnderlineInputBorder(
                //   borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                //   borderRadius: BorderRadius.circular(6),
                // ),
              ),
            ),
            SizedBox(height: 10 * _heightScale),
            DateTimePicker(
              selectableDayPredicate: (DateTime val) =>
                  val.weekday == 8 ? false : true,

              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                // fillColor: Color(0xFF775594),
                labelStyle: GoogleFonts.poppins(
                  color: Color(0xFF775594),
                ),
                labelText: 'Completion Date',
                // focusColor: Color(0xFF775594),
                icon: Icon(
                  Icons.event,
                  color: Color(0xFF775594),
                ),
              ),
              style: GoogleFonts.poppins(
                color: Color(0xFF775594),
              ),

              //   decoration: InputDecoration(border: InputBorder.none),
              type: DateTimePickerType.date,
              dateMask: 'd MMM, yyyy',
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),

              timeLabelText: "Hour",
              // selectableDayPredicate: (date) {
              //   // Disable weekend days to select from the calendar
              //   if (date.weekday == 6 || date.weekday == 7) {
              //     return false;
              //   }

              //   return true;
              // },
              onChanged: (val) {
                setState(() {
                  time = val;
                });
                print(val);
              },
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => setState(() {
                time = val;
              }),
            ),
            SizedBox(height: 40 * _heightScale),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  if (isLoading1) return;
                  setState(() {
                    isLoading1 = true;
                  });
                  // await Future.delayed(Duration(seconds: 2));
                  await _onSubmit(context);

                  setState(() {
                    isLoading1 = false;
                  });
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
                  width: _widthScale * 160,
                  child: isLoading1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: _heightScale * 20,
                              width: _widthScale * 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: _widthScale * 20,
                            ),
                            Text("Please Wait...")
                          ],
                        )
                      : Text(
                          'Add Task',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 18 * _widthScale,
                                  fontWeight: FontWeight.w700)),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

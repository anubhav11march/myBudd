// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:heybuddy/color&font/colors.dart';
// import 'package:heybuddy/widgets/user_model.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';

// class NewSkills extends StatefulWidget {
//   const NewSkills({Key? key}) : super(key: key);

//   @override
//   _NewSkillsState createState() => _NewSkillsState();
// }

// class _NewSkillsState extends State<NewSkills> {
//   GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
//   late UserModel userModel = new UserModel(
//     "",
//     // 18,
//     new List<String>.empty(growable: true),
//   );

//   @override
//   void initState() {
//     super.initState();

//     userModel.skills.add("");
//   }

//   @override
//   Widget build(BuildContext context) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
//     return Scaffold(
//         backgroundColor: backgroundColor,
//         appBar: AppBar(
//           backgroundColor: white.withOpacity(0.6),
//           elevation: 0,
//           leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back,
//               color: text9,
//             ),
//           ),
//           title: Text(
//             "Skills",
//             style: GoogleFonts.poppins(
//                 color: blue22,
//                 fontSize: _widthScale * 18,
//                 fontWeight: FontWeight.w500),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: _heightScale * 44,
//               ),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: _widthScale * 24,
//                   ),
//                   Text(
//                     "Add Your Skills",
//                     style: GoogleFonts.poppins(
//                         fontSize: _widthScale * 20,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: _heightScale * 15,
//               ),
//               _uiWidget(),
//             ],
//           ),
//         ));
//   }

//   Widget _uiWidget() {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
//     return new Form(
//       key: globalFormKey,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: _widthScale * 24.0),
//                     child: Text(
//                       "General Conversation*",
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: text2,
//                             fontSize: _widthScale * 13,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: _heightScale * 13,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: white,
//                     borderRadius: BorderRadius.circular(_widthScale * 6),
//                   ),
//                   height: _heightScale * 45,
//                   width: double.infinity,
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                       left: _widthScale * 16.0,
//                       //  top: _heightScale * 16,
//                       // bottom: _heightScale * 16
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "General Conversation",
//                               style: GoogleFonts.poppins(
//                                   textStyle: TextStyle(
//                                       fontSize: _widthScale * 16,
//                                       color: black.withOpacity(0.8))),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // TextFormField(
//                 //   initialValue: "General Conversation",

//                 //   validator: (onValidateVal) {
//                 //     if (onValidateVal!.isEmpty) {
//                 //       return 'User Name can\'t be empty.';
//                 //     }

//                 //     return null;
//                 //   },
//                 //   onSaved: (onSavedVal) => {
//                 //     this.userModel.generalConversation = onSavedVal!,
//                 //   },
//                 //   // onEditingComplete: validateAndSave,
//                 //   autofocus: false,
//                 //   style: TextStyle(
//                 //       fontSize: _widthScale * 15.0,
//                 //       color: black.withOpacity(0.6)),
//                 //   decoration: InputDecoration(
//                 //     filled: true,
//                 //     fillColor: white.withOpacity(0.5),
//                 //     hintText: "General Conversation",
//                 //     hintStyle: GoogleFonts.poppins(
//                 //         textStyle: TextStyle(
//                 //             fontSize: _widthScale * 16,
//                 //             color: text12.withOpacity(0.8))),
//                 //     contentPadding: EdgeInsets.only(
//                 //         left: _widthScale * 14.0,
//                 //         bottom: _heightScale * 8.0,
//                 //         top: _heightScale * 8.0),
//                 //     focusedBorder: OutlineInputBorder(
//                 //       borderSide: BorderSide(color: col1),
//                 //       borderRadius: BorderRadius.circular(_widthScale * 6),
//                 //     ),
//                 //     enabledBorder: UnderlineInputBorder(
//                 //       borderSide: BorderSide(color: textFieldColor),
//                 //       borderRadius: BorderRadius.circular(_widthScale * 6),
//                 //     ),
//                 //   ),
//                 // ),
//               ),
//               SizedBox(
//                 height: _heightScale * 15,
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: _widthScale * 24.0),
//                     child: Text(
//                       "Skills*",
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             color: text2,
//                             fontSize: _widthScale * 13,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: _heightScale * 15,
//               ),
//               emailsContainerUI(),
//               SizedBox(
//                 height: _heightScale * 25,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
//                 child: Container(
//                   height: _widthScale * 56,
//                   width: _widthScale * 340,
//                   child: ElevatedButton(
//                       onPressed: () async {
//                         if (validateAndSave()) {
                          
//                           print(this.userModel.toJson());
//                           // Navigator.push(context,
//                           //     MaterialPageRoute(builder: (context) => SlotConfirm()));
//                         } else {
//                           print("data not save");
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: text6,
//                         shape: new RoundedRectangleBorder(
//                           borderRadius:
//                               new BorderRadius.circular(_widthScale * 10.0),
//                         ),
//                       ),
//                       child: Text(
//                         'Save',
//                         style: GoogleFonts.poppins(
//                             textStyle: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: _widthScale * 18)),
//                       )),
//                 ),
//               ),
//               // new Center(
//               //   child: FormHelper.submitButton(
//               //     "Save",
//               //     () async {
//               //       if (validateAndSave()) {
//               //         print(this.userModel.toJson());
//               //       }
//               //     },
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget emailsContainerUI() {
//     return ListView.separated(
//       shrinkWrap: true,
//       physics: ScrollPhysics(),
//       itemCount: this.userModel.skills.length,
//       itemBuilder: (context, index) {
//         return Column(
//           children: <Widget>[
//             Row(children: <Widget>[
//               Flexible(
//                 fit: FlexFit.loose,
//                 child: emailUI(index),
//               ),
//             ]),
//           ],
//         );
//       },
//       separatorBuilder: (context, index) => Divider(),
//     );
//   }

//   Widget emailUI(index) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
//       child: Row(
//         children: [
//           Flexible(
//             flex: 1,
//             child: TextFormField(
//               validator: (onValidateVal) {
//                 if (onValidateVal!.isEmpty) {
//                   return 'Skills ${index + 1} can\'t be empty.';
//                 }

//                 return null;
//               },
//               onSaved: (onSavedVal) => {
//                 this.userModel.skills[index] = onSavedVal!,
//               },
//               autofocus: false,
//               style: TextStyle(fontSize: _widthScale * 15.0, color: black),
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: white.withOpacity(0.5),
//                 hintText: "Enter Your Skills",
//                 hintStyle: GoogleFonts.poppins(
//                     textStyle: TextStyle(
//                         fontSize: _widthScale * 16,
//                         color: text12.withOpacity(0.8))),
//                 contentPadding: EdgeInsets.only(
//                     left: _widthScale * 14.0,
//                     bottom: _heightScale * 8.0,
//                     top: _heightScale * 8.0),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: col1),
//                   borderRadius: BorderRadius.circular(_widthScale * 6),
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: textFieldColor),
//                   borderRadius: BorderRadius.circular(_widthScale * 6),
//                 ),
//               ),
//             ),
//             //  FormHelper.inputFieldWidget(
//             //   context,
//             //   Icon(Icons.web),
//             //   "email_$index",
//             //   "",
//             //   (onValidateVal) {
//             //     if (onValidateVal.isEmpty) {
//             //       return 'Email ${index + 1} can\'t be empty.';
//             //     }

//             //     return null;
//             //   },
//             //   (onSavedVal) => {
//             //     this.userModel.emails[index] = onSavedVal,
//             //   },
//             //   initialValue: this.userModel.emails[index],
//             //   obscureText: false,
//             //   borderFocusColor: Theme.of(context).primaryColor,
//             //   prefixIconColor: Theme.of(context).primaryColor,
//             //   borderColor: Theme.of(context).primaryColor,
//             //   borderRadius: 2,
//             //   paddingLeft: 0,
//             //   paddingRight: 0,
//             //   showPrefixIcon: false,
//             //   fontSize: 13,
//             //   onChange: (val) {},
//             // ),
//           ),
//           Visibility(
//             child: SizedBox(
//               width: 35,
//               child: IconButton(
//                 icon: Icon(
//                   Icons.add_circle,
//                   color: Colors.green,
//                 ),
//                 onPressed: () {
//                   addEmailControl();
//                 },
//               ),
//             ),
//             visible: index == this.userModel.skills.length - 1,
//           ),
//           Visibility(
//             child: SizedBox(
//               width: 35,
//               child: IconButton(
//                 icon: Icon(
//                   Icons.remove_circle,
//                   color: Colors.redAccent,
//                 ),
//                 onPressed: () {
//                   removeEmailControl(index);
//                 },
//               ),
//             ),
//             visible: index > 0,
//           )
//         ],
//       ),
//     );
//   }

//   void addEmailControl() {
//     setState(() {
//       this.userModel.skills.add("");
//     });
//   }

//   void removeEmailControl(index) {
//     setState(() {
//       if (this.userModel.skills.length > 1) {
//         this.userModel.skills.removeAt(index);
//       }
//     });
//   }

//   bool validateAndSave() {
//     final form = globalFormKey.currentState;
//     if (form!.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }
// }






// //////
// ///
// ///
// ///

// class UserModel {
//   late String generalConversation;
//   // late int userAge;
//   late List<String> skills;

//   UserModel(
//       this.generalConversation,
//       //this.userAge,
//       this.skills);

//   UserModel.fromJson(Map<String, dynamic> json) {
//     generalConversation = json['GeneralConversation'];
//     //  userAge = json['UserAge'];
//     skills = json['Skills'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['GeneralConversation'] = "General Conversation";
//     //  data['UserAge'] = this.userAge;
//     data['Skills'] = this.skills;
//     print("Data is.....$data");
//     return data;
//   }
// }



// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mybud/api_service/get_cards.dart';
// import 'package:mybud/api_service/get_user_image.dart';
// import 'package:mybud/api_service/get_user_profile.dart';
// import 'package:mybud/screens/buddy_main_page.dart';
// import 'package:mybud/widgets/custom_navigation_bar.dart';
// import 'package:mybud/widgets/message_model.dart';
// import 'package:mybud/widgets/own_message_card.dart';
// import 'package:mybud/widgets/reply_card.dart';
// import 'package:mybud/widgets/token_profile.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class IndividMessageScreen extends StatefulWidget {
//   static const String route = '/individ _message_screen';
//   // const IndividMessageScreen({Key? key}) : super(key: key);
//   var name;
//   IndividMessageScreen({required this.name});
//   @override
//   _IndividMessageScreenState createState() => _IndividMessageScreenState();
// }

// class _IndividMessageScreenState extends State<IndividMessageScreen> {
//     bool show = false;
//   late IO.Socket socket;
//    FocusNode focusNode = FocusNode();
//      bool sendButton = false;
//   List<MessageModel> messages = [];
//   // var response;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//       focusNode.addListener(() {
//       if (focusNode.hasFocus) {
//         setState(() {
//           show = false;
//         });
//       }
//     });

//     connect();
//   }

//   var profil;
//   var res;
//   userid() async {
//     profil = await getdetails(tokenProfile?.token);
//     res = await getdummy(1, tokenProfile?.token);
//     print('buddy${res['data']['username']}');
//     print('userId${profil['_id']}');
//   }
  
//   // void connect() {
//   //   // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
//   //   socket = IO.io("http://192.168.0.106:5000", <String, dynamic>{
//   //     "transports": ["websocket"],
//   //     "autoConnect": false,
//   //   });
//   //   socket.connect();
//   //  // socket.emit("signin", widget.sourchat.id);
//   //   socket.onConnect((data) {
//   //     print("Connected");
//   //     socket.on("message", (msg) {
//   //       print(msg);
//   //       setMessage("destination", msg["message"]);
//   //       _scrollController.animateTo(_scrollController.position.maxScrollExtent,
//   //           duration: Duration(milliseconds: 300), curve: Curves.easeOut);
//   //     });
//   //   });
//   //   print(socket.connected);
//   // }
//   void connect() async {
//     await userid();
//     socket =
//         IO.io("https://sheltered-earth-76230.herokuapp.com", <String, dynamic>{
//       "transports": ["websocket"],
//       "autoConnect": false,
//     });
//     socket.connect();
//     socket.emit('updatesocketid', profil['_id']);
//     socket.onConnect((data) => print("Socket Connected Successfully"));
//     print(socket.connected);
//   }
//    void sendMessage(String message, int sourceId, int targetId) {
//     setMessage("source", message);
//     socket.emit("message",
//         {"user1": sourceId, "user2": targetId, "message": message});
//   }

//     void setMessage(String type, String message) {
//     MessageModel messageModel = MessageModel(
//         type: type,
//         message: message,
//        // time: DateTime.now().toString().substring(10, 16)
//         );
//     print(messages);

//     setState(() {
//       messages.add(messageModel);
//     });
//   }

//   TextEditingController _controller = TextEditingController();
//    ScrollController _scrollController = ScrollController();

//   var pp;
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;

//     Widget spacevert = SizedBox(
//       height: size.height * 0.04,
//     );
//     Widget spacehort = SizedBox(
//       width: size.width * 0.06,
//     );
//     Widget spacehort1 = SizedBox(
//       width: size.width * 0.35,
//     );
//     Widget spacevert1 = SizedBox(
//       height: size.height * 0.02,
//     );
//     Widget spacevert2 = SizedBox(
//       height: size.height * 0.4,
//     );

//     return Scaffold(
//       backgroundColor: const Color(0xFFE5E5E5),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: const Color(0xFFE5E5E5),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(_widthScale * 1),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: _widthScale * 24),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                           //Scaffold.of(context).openDrawer();
//                         },
//                         child: Image.asset(
//                           "assets/Vector.png",
//                           height: _heightScale * 24,
//                           width: _widthScale * 27,
//                         )),
//                     SizedBox(
//                       width: _widthScale * 15,
//                     ),
//                     Text(
//                       widget.name,
//                       style: GoogleFonts.poppins(
//                         color: const Color(0xFF775594),
//                         fontSize: _widthScale * 28,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(height: 630 * _heightScale,
//           child:  WillPopScope(
//               onWillPop: () { 
//                     if (show) {
//                   setState(() {
//                     show = false;
//                   });
//                 } else {
//                   Navigator.pop(context);
//                 }
//                 return Future.value(false);
//                },
//               child: Column(
//                 children: [
//                   Expanded(
//                     // height: MediaQuery.of(context).size.height - 150,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       controller: _scrollController,
//                       itemCount: messages.length + 1,
//                       itemBuilder: (context, index) {
//                         if (index == messages.length) {
//                           return Container(
//                             height: 70,
//                           );
//                         }
//                         if (messages[index].type == "source") {
//                           return OwnMessageCard(
//                             message: messages[index].message,
//                           //  time: messages[index].time,
//                           );
//                         } else {
//                           return ReplyCard(
//                             message: messages[index].message,
//                          //   time: messages[index].time,
//                           );
//                         }
//                       },
//                     ),
//           ),
//           Container(
//             height: 74 * _heightScale,
//             width: double.infinity,
//             child: Row(
//               children: [
//                 Container(
//                   width: 300 * _widthScale,
//                   child: TextField(
//                     controller: _controller,
//                     textAlign: TextAlign.left,
//                     autofocus: false,
//                     style: TextStyle(
//                         fontSize: _widthScale * 15.0, color: Colors.black),
//                     decoration: InputDecoration(
//                       // suffix: Padding(
//                       //   padding:  EdgeInsets.all(8.0),
//                       //   child: Image.asset(
//                       //     'assets/Vector (6).png',
//                       //     height: 27 * _heightScale,
//                       //     width: 27 * _widthScale,
//                       //     // color: Colors.purple,
//                       //   ),
//                       // ),
//                       filled: true,
//                       fillColor: Colors.white,
//                       hintText: 'Start Conversation',
//                       hintStyle: GoogleFonts.poppins(
//                           textStyle: TextStyle(
//                               fontSize: _widthScale * 14,
//                               color: Color(0xFFB6B6B6),
//                               fontWeight: FontWeight.w600)),
//                       contentPadding: EdgeInsets.only(
//                           bottom: _heightScale * 16.0,
//                           top: _heightScale * 16.0,
//                           left: 20.0 * _widthScale),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       // UnderlineInputBorder(
//                       //   borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
//                       //   borderRadius: BorderRadius.circular(6),
//                       // ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 70 * _widthScale,
//                   child: Image.asset(
//                     'assets/Vector (6).png',
//                     height: 27 * _heightScale,
//                     width: 27 * _widthScale,
//                     color:
//                         _controller.text.isEmpty ? Colors.grey : Colors.purple,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//           ),
//           )
//         ]
//       )
//     );
//   }
// }

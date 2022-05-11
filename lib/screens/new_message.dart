// import 'package:camera/camera.dart';
// import 'package:chatapp/CustomUI/CameraUI.dart';
// import 'package:chatapp/CustomUI/OwnMessgaeCrad.dart';
// import 'package:chatapp/CustomUI/ReplyCard.dart';
// import 'package:chatapp/Model/ChatModel.dart';
// import 'package:chatapp/Model/MessageModel.dart';
import 'package:emoji_choose/emoji_choose.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/screens/message_bio.dart';
import 'package:mybud/screens/messages.dart';
import 'package:mybud/widgets/custom_navigation_bar.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:mybud/widgets/message_model.dart';
import 'package:mybud/widgets/own_message_card.dart';
import 'package:mybud/widgets/reply_card.dart';
//import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:async';
//import 'package:emoji_picker/emoji_picker.dart';

// ignore: must_be_immutable
class IndividualPage extends StatefulWidget {
  var name;
  var userid;
  var buddyid;
  var buddyimage;
  var ind;
  IndividualPage(
      {Key? key,
      required this.name,
      required this.userid,
      required this.buddyid,
      required this.buddyimage,
      required this.ind})
      : super(key: key);

  // IndividualPage({Key key, this.chatModel, this.sourchat}) : super(key: key);
  // final ChatModel chatModel;
  // final ChatModel sourchat;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<MessageModel> messages = [];
  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();
  late IO.Socket socket;
  @override
  void initState() {
    //x = [];

    super.initState();
    //socket.dispose();

    connect();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
      type: type,
      message: message,
      //  time: DateTime.now().toString().substring(10, 16));
    );
    //  print(messages);
    // if (this.mounted) {
    //print('hjbhbhu');
    // setState(() {
    //  messages.add(messageModel);
    // messages = [...messages, messageModel];
    //  messages = messageModel;
    //});
    // }
    tute(messageModel);
    // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
    //   duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    //  if (this.mounted) {

    // } else {
    //   messages.add(messageModel);
    //   print('messageeeeeeeeee$messages');
    // }
  }

  tute(messageModel) {
    setState(() {
      messages.add(messageModel);
    });
    // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
    //   duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  late StreamController streamController;
  connect() async {
    print('userid : ${widget.userid}');
    print('userfriend : ${widget.buddyid}');
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket =
        IO.io("https://mybud.herokuapp.com", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
      socket.emit('updatesocketid', {"userid":widget.userid,"matcheduser": widget.buddyid});
  //  socket.
    // socket.emit('updatesocketid', {"userid":widget.userid,"matcheduser": widget.buddyid});
   // socket.on(event, (data) => null)
socket.connect();
    socket.onConnect((data) {
      //  socket.emit('updatesocketid', {"userid":widget.userid,"matcheduser": widget.buddyid});
      print(" Socket Connected Successfully");

      socket.on('privatemessage', (msg) {
        print('msggggggggggg$msg');
        setMessage("destination", msg);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });
      print('tute');
      // streamController = StreamController();
      socket.on('getmessage', (msg) {
        print('msgggggggggggtute$msg');
        //  setMessage('source', msg[0]['message']);
        //  List.generate(msg.length, (inde) {
        List.generate(msg.length, (index) {
          if (msg[index]['sender'] == widget.userid) {
            print('sourceeeee');

            setMessage("source", msg[index]['message']);
          }
          if (msg[index]['sender'] == widget.buddyid) {
            print('destination');

            setMessage(
                "destination", msg[index]['message']);
          }
          //  _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          // duration: Duration(milliseconds: 300), curve: Curves.easeOut);
        });
//}).reversed;
        Future.delayed(
            const Duration(seconds: 3),
            () => _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut));

        _scrollController.position.maxScrollExtent;
        // setState(() {

        // });
      });
    });

    // print(socket.connected);
  }

  void sendMessage(String message, var sourceId, var targetId) {
    setMessage("source", message);

    socket.emit('privatemessage',
        {"user1": sourceId, "user2": targetId, "message": message});
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Stack(
      children: [
        // Image.asset(
        //   "assets/whatsapp_Back.png",
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 84 * _heightScale,
            leadingWidth: 70,
            titleSpacing: 0,
            leading: Padding(
              padding: EdgeInsets.only(
                  top: 25.0 * _heightScale, bottom: 30 * _heightScale),
              child: InkWell(
                onTap: () async {
                  socket.dispose();
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 35 * _heightScale,
                      color: const Color(0xFF775594),
                    ),
                  ],
                ),
              ),
            ),
            title: Row(
              children: [
                InkWell(
                  onTap: () {
                    showCupertinoDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (contex) {
                          return Container(
                            alignment: Alignment.center,
                            child: Container(
                                height: 450 * _heightScale,
                                width: 350 * _widthScale,
                                child: Image.network(
                                  widget.buddyimage,
                                  fit: BoxFit.cover,
                                )),
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 20),
                    child: CircleAvatar(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFB9B9B9),
                      radius: 25 * _widthScale,

                      backgroundImage:
                          //  res == null ? NetworkImage(''):

                          NetworkImage(widget.buddyimage),

                      //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
                      //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MessageBioScreen(id: widget.buddyid)));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name,
                            style: GoogleFonts.poppins(
                              fontSize: 18 * _widthScale,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF5E3E79),
                            )),
                        // Text(
                        //   "last seen today at 12:05",
                        //   style: TextStyle(
                        //     fontSize: 13,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              // IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
              // IconButton(icon: Icon(Icons.call), onPressed: () {}),
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert_outlined,
                  color: Color(0xFF5E3E79),
                ),
                //  color: Color(0xFF5E3E79),
                padding: const EdgeInsets.all(0),
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (BuildContext contesxt) {
                  return [
                    const PopupMenuItem(
                      child: Text("View Buddy"),
                      value: "View Buddy",
                    ),
                  ];
                },
              ),
            ],
          ),
          body: Container(
            color: const Color(0xFFE5E5E5),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Container(
                            height: 70,
                          );
                        }
                        if (messages[index].type == "source") {
                          return OwnMessageCard(
                            message: messages[index].message,
                            //  time: messages[index].time,
                          );
                        } else {
                          return ReplyCard(
                            message: messages[index].message,
                            //  time: messages[index].time,
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.length > 0) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        borderSide: BorderSide.none
                                      ),
                                      hintText: "Type a message",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      isDense: true

                                      // prefixIcon: IconButton(
                                      //   icon: Icon(
                                      //     show
                                      //         ? Icons.keyboard
                                      //         : Icons.emoji_emotions_outlined,
                                      //   ),
                                      //   onPressed: () {
                                      //     if (!show) {
                                      //       focusNode.unfocus();
                                      //       focusNode.canRequestFocus = false;
                                      //     }
                                      //     setState(() {
                                      //       show = !show;
                                      //     });
                                      //   },
                                      // ),

                                      // suffixIcon: Row(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   children: [
                                      //     IconButton(
                                      //       icon: Icon(Icons.attach_file),
                                      //       onPressed: () {
                                      //         showModalBottomSheet(
                                      //             backgroundColor:
                                      //                 Colors.transparent,
                                      //             context: context,
                                      //             builder: (builder) =>
                                      //                 bottomSheet());
                                      //       },
                                      //     ),
                                      //     IconButton(
                                      //       icon: Icon(Icons.camera_alt),
                                      //       onPressed: () {
                                      //         // Navigator.push(
                                      //         //     context,
                                      //         //     MaterialPageRoute(
                                      //         //         builder: (builder) =>
                                      //         //             CameraApp()));
                                      //       },
                                      //     ),
                                      //   ],
                                      // ),

                                      // contentPadding: EdgeInsets.all(5),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: sendButton
                                      ? const Color(0xFFA585C1)
                                      : const Color(0xFF9E9E9E),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.send,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (sendButton) {
                                        _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration:
                                                const Duration(milliseconds: 300),
                                            curve: Curves.easeOut);
                                        sendMessage(
                                          _controller.text,
                                          widget.userid,
                                          widget.buddyid,
                                          //widget.sourchat.id,
                                          // widget.chatModel.id
                                        );
                                        _controller.clear();
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  const SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiChoose(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji, category) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text + emoji.emoji;
          });
        },
      recommendKeywords: ["people"],);
  }
}

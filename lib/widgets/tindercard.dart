import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybud/providers/card_provider.dart';
import 'package:mybud/widgets/user.dart';
//import 'package:mybud/providers/cardProvider.dart';
import 'package:provider/provider.dart';

class TinderCard extends StatefulWidget {
  // const TinderCard({ Key? key }) : super(key: key);
  final String urlImage;
  final bool isFront;
  final String nam;
  final String profession;
  final String location;
  final String details;
  final String reason;
  final List skills;

  TinderCard(
      {required this.urlImage,
      required this.isFront,
      required this.nam,
      required this.profession,
      required this.location,
      required this.details,
      required this.skills,
      required this.reason});
  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  //final user = User(name:urlImage);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('tytiy${widget.isFront}');
    return SizedBox.expand(
      child: widget.isFront == true
          ? buildFrontCard()
          // :
          // Container(
          // height: 350 ,
          // width: 330 ,
          // child:Center(child: CircularProgressIndicator(
          //   color: Color(0xFF3C096C),
          // ))
          // )
          : buildCard(),
    );
  }

  Widget buildFrontCard() =>
      GestureDetector(child: LayoutBuilder(builder: (context, constraints) {
        final provider = Provider.of<CardProvider>(context);
        final position = provider.position;
        final center = constraints.smallest.center(Offset.zero);
        final milliseconds = provider.isDragging ? 0 : 500;
        final angle = provider.angle * pi / 180;
        final ii = provider.ii;
        final opacity = provider.getStatusOpacity();
        final picc = provider.pic;
        final rotatedMatrix = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);

        return AnimatedContainer(
          // decoration: BoxDecoration(
          //   boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 0.8)],
          // ),
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: milliseconds),
          transform: rotatedMatrix..translate(position.dx, position.dy),
          child: ColorFiltered(
            colorFilter:
                ColorFilter.mode(picc.withOpacity(opacity), BlendMode.srcATop),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: const Offset(
                        2.0,
                        2.0,
                      ),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ]),
              child: Stack(

                  // alignment: Alignment.bottomLeft,
                  children: [
                    //        widget.urlImage.isEmpty ?
                    // Container(
                    // height: 350 ,
                    // width: 330 ,
                    // child:Center(child: CircularProgressIndicator(
                    //   color: Color(0xFF3C096C),
                    // ))
                    // ):

                    buildCard(),
                    buildStamps()
                  ]),
            ),
          ),
          // buildStamps()],
          //  ),
          //  )
          // provider.endPosition()
          ////    provider.like() ?
          //  provider.like() ?
          //   buildNewCards()
          //buildCard()
        );
      }), onPanStart: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);

        provider.startPosition(details);
      }, onPanUpdate: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);

        provider.updatePosition(details);
      }, onPanEnd: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);

        provider.endPosition();
      });

  Widget buildCard() {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    final provider = Provider.of<CardProvider>(context, listen: false);
    final ii = provider.ii;
    final opacity = provider.getStatusOpacity();
    // if(provider.endPosition )

    return Stack(
      children: [
        Column(
          children: [
            widget.isFront == false
                ? SizedBox(
                    height: 265 * _heightScale,
                    width: 330 * _widthScale,
                    child: Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 100 * _heightScale,
                        ),
                        CircularProgressIndicator(color: Colors.grey),
                        Text(
                          'Uploading Image',
                          style: GoogleFonts.poppins(
                              fontSize: 16 * _widthScale,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        )
                      ],
                    ))) :
                    // SizedBox(
                    // height: 265 * _heightScale,
                    // width: 330 * _widthScale,
                    // child: Center(
                    //     child: Column(
                    //   children: [
                    //     SizedBox(
                    //       height: 100 * _heightScale,
                    //     ),
                    //     CircularProgressIndicator(color: Colors.grey),
                    //     Text(
                    //       'Uploading Image',
                    //       style: GoogleFonts.poppins(
                    //           fontSize: 16 * _widthScale,
                    //           fontWeight: FontWeight.w500,
                    //           color: Colors.grey),
                    //     )
                    //   ],
                    // )))
                   // :
                 Container(
                    height: 265 * _heightScale,
                    width: 330 * _widthScale,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //   boxShadow: BoxShadow.lerp(a, b, t),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black87,
                          ],
                          stops: [0.4, 1],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // boxShadow: [
                      //   BoxShadow(color: Colors.black12, spreadRadius: 0.8)
                      // ],
                      image: DecorationImage(
                          image: widget.urlImage == ''
                              ? const NetworkImage(
                                  'https://image.shutterstock.com/image-vector/vector-progress-loading-bar-icon-260nw-1705895869.jpg')
                              : NetworkImage(
                                  widget.urlImage,
                                ),
                          fit: BoxFit.values[2],
                          alignment: Alignment.topCenter),
                    ),
                  ),
            SizedBox(
              height: 10 * _heightScale,
            ),
            // widget.isFront == false
            //     ? Container(
            //         height: 85 * _heightScale,
            //         width: 330 * _widthScale,
            //         child: Text(''))
            //     : Container(
            //         height: 85 * _heightScale,
            //         width: 330 * _widthScale,
            //         child: GridView.builder(
            //             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //                 maxCrossAxisExtent: 200 * _widthScale,
            //                 childAspectRatio: 5 / 2,
            //                 crossAxisSpacing: 20 * _widthScale,
            //                 mainAxisSpacing: 20 * _widthScale),
            //             itemCount: widget.skills.length,
            //             itemBuilder: (context, index) {
            //               return Container(
            //                   alignment: Alignment.center,
            //                   decoration: BoxDecoration(
            //                     borderRadius:
            //                         BorderRadius.circular(9 * _widthScale),
            //                     color: Color(0xFF76D4C3),
            //                   ),
            //                   height: 35 * _heightScale,
            //                   //   color: Color(0xFF76D4C3),
            //                   child: Padding(
            //                     padding: EdgeInsets.symmetric(
            //                         horizontal: 8 * _widthScale,
            //                         vertical: 6 * _heightScale),
            //                     child: Text(
            //                       widget.skills[index],
            //                       style: GoogleFonts.poppins(
            //                           color: Color(0xFFFFFFFF),
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 16 * _widthScale),
            //                     ),
            //                   ));

            //               //Container(child: Text(widget.skills[index]));
            //             })

            //         //  Row(

            //         ),
          ],
        ),
        //   Text(widget.urlName.toString()),
      ],
    );
  }

  Widget buildStamps() {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    final provider = Provider.of<CardProvider>(context, listen: false);
    final status = provider.getStatus();
    final opacity = provider.getStatusOpacity();
    final names = provider.urlNames;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: 224 * _heightScale, left: 22 * _widthScale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.nam,
                      style: GoogleFonts.poppins(
                          fontSize: 22 * _widthScale,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  SizedBox(
                    height: 16 * _heightScale,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/ls_bag.png'),
                      SizedBox(width: 8 * _widthScale),
                      Text(widget.profession,
                          style: GoogleFonts.poppins(
                              fontSize: 16 * _widthScale,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB9B9B9))),
                      if (widget.profession == 'Working Professional')
                        SizedBox(
                          width: 80 * _widthScale,
                        ),
                      // if (widget.profession == 'Homemaker')
                      //   SizedBox(
                      //     width: 0 * _widthScale,
                      //   ),
                      if (widget.profession != 'Working Professional')
                        SizedBox(
                          width: 130 * _widthScale,
                        ),
                      Text(widget.details,
                          style: GoogleFonts.poppins(
                              fontSize: 16 * _widthScale,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB9B9B9))),
                    ],
                  ),
                  SizedBox(
                    height: 10 * _heightScale,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/Group (9).png'),
                      SizedBox(width: _widthScale * 8),
                      Text(widget.reason,
                          style: GoogleFonts.poppins(
                              fontSize: 16 * _widthScale,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB9B9B9))),
                    ],
                  ),
                  SizedBox(
                    height: 10 * _heightScale,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/Vector (7).png'),
                      SizedBox(width: _widthScale * 8),
                      Text('No. of Challenges Completed : 0',
                          style: GoogleFonts.poppins(
                              fontSize: 16 * _widthScale,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB9B9B9))),
                    ],
                  ),
                  SizedBox(
                    height: 10 * _heightScale,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/Vector (8).png'),
                      SizedBox(width: _widthScale * 8),
                      SizedBox(width: 5 * _widthScale),
                      Text(widget.location,
                          style: GoogleFonts.poppins(
                              fontSize: 16 * _widthScale,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB9B9B9))),
                    ],
                  ),
                ],
              )),

          SizedBox(height: _heightScale * 19),
          Container(
            height: _heightScale * 1,
            width: _widthScale * 297,
            color: const Color(0xFFABABAB),
          ),
          SizedBox(height: 19 * _heightScale),
          widget.isFront == false
              ? SizedBox(
                  height: 85 * _heightScale,
                  width: 330 * _widthScale,
                  child: Text(''))
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30 * _widthScale),
                  child: SizedBox(
                      width: 300 * _widthScale,
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200 * _widthScale,
                              childAspectRatio: 5 / 2,
                              crossAxisSpacing: 20 * _widthScale,
                              mainAxisSpacing: 20 * _widthScale),
                          itemCount: widget.skills.length,
                          itemBuilder: (context, index) {
                            return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(9 * _widthScale),
                                  color: Color(0xFF76D4C3),
                                ),
                                //   color: Color(0xFF76D4C3),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8 * _widthScale,
                                  ),
                                  child: Text(
                                    widget.skills[index],
                                    style: GoogleFonts.poppins(
                                        color: Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16 * _widthScale),
                                  ),
                                ));

                            //Container(child: Text(widget.skills[index]));
                          })

                      //  Row(

                      ),
                ),
          //             Padding(
          // padding: EdgeInsets.only(top: 290, left: 22),
          // child: Text(widget.profession,
          //     style: GoogleFonts.poppins(
          //         fontSize: 22,
          //         fontWeight: FontWeight.w600,
          //         color: Colors.white))),
        ],
      ),
    );
    // return Text(
    //   names.map((e) => Text(e)).toString(),
    // );
    // var ii;
    // for (var i = 0; i < 6; i++) {
    //   return Text('$i');
    // }
    // return Text('pp');

    // switch (status) {
    //   case CardStatus.like:
    //     final child =
    //         // buildStamp(color: Colors.green, text: 'LIKE');
    //         ColorFiltered(
    //       colorFilter: ColorFilter.mode(
    //           Colors.green.withOpacity(opacity), BlendMode.color),
    //       //   ColorFiltered(
    //       // colorFilter: ColorFilter.matrix(<double>[
    //       //   1, 0, 0, 0, 0, //red
    //       //   0, 2, 0, 0, 0, //green
    //       //   0, 0, 1, 0, 0, //blue
    //       //   0, 0, 0, 1, 0, //alpha
    //       // ]),
    //       child: buildCard(),
    //     );
    //     //  buildStamp(color: Colors.green, text: 'LIKE');

    //     return child;
    //   //Positioned(top: 64, left: 50,child: child);
    //   default:
    //     return Container();
    // }
  }

  Widget buildStamp(
      {double angle = 0, required Color color, required String text}) {
    return Text(
      text,
      textAlign: TextAlign.center,
    );
  }

  Widget buildNewCards() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.matrix(<double>[
            1, 0, 0, 0, 0, //red
            0, 2, 0, 0, 0, //green
            0, 0, 1, 0, 0, //blue
            0, 0, 0, 1, 0, //alpha
          ]),
          //colorFilter:  ColorFilter.mode(Colors.green.withOpacity(0.9), BlendMode.dstATop),
          image: AssetImage(
            widget.urlImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

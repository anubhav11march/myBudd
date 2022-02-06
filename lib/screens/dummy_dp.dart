// // ignore: file_names
// import 'package:flutter/material.dart';
// import 'package:mybud/api_service/get_cards.dart';
// import 'package:mybud/providers/add_detailss.dart';
// import 'package:mybud/widgets/token_profile.dart';
// import 'package:provider/provider.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// class Dummy extends StatefulWidget {
//   const Dummy({Key? key}) : super(key: key);

//   @override
//   _DummyState createState() => _DummyState();
// }

// class _DummyState extends State<Dummy> {
//   final RefreshController refreshController =
//       RefreshController(initialRefresh: true);
//   var res;
//   List data = [];
//   List filter = [];
//   List responsejob = [];
//   int page = 1;
//   //List responsejob=[];

//   void _onRefresh() async {
//     print("vjbdvjhdbvjif");
//     page = 1;
//     getJobs(page);
//     await Future.delayed(Duration(milliseconds: 1000));
//     refreshController.refreshCompleted();
//   }

//   void _onLoading(context) async {
//     print("loadedede");
//     //getJobs(page, valueChoose);
//     page = page + 1;
//     getJobs(page);
//   }

//   @override
//   void initState() {
//     super.initState();
//     getJobs(page);
//   }

//   // var res;
//   getJobs(page) async {
//     print('gg${tokenProfile?.token}');
//     res = await getdummy(page, tokenProfile?.token, );
//     print('opop$res');
//     setState(() {
//       //   data = response;
//       if (page > 1) {
//         print("me chla");
//         data.addAll(res); //
//         filter = [
//           ...filter,
//           ...res,
//         ];
//         refreshController.loadComplete();
//       } else {
//         print("Done");
//         filter = res;
//       }
//       EasyLoading.dismiss();
//     });
//     // print('opop$res');
//   }
//   // Future<void> getJobs(page) async {
//   //   res = await getdummy(page);

//   // }
//   double kDesignWidth = 375;
//   double kDesignHeight = 812;
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AddInfo>(context);
//     final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     final double _heightScale =
//         MediaQuery.of(context).size.height / kDesignHeight;
//     print('lenn${res.length}');
//     return FutureBuilder(
//         future: getJobs(page),
//         builder: (context, snapShot) {
//           return Scaffold(
//             appBar: AppBar(
//               leading: InkWell(
//                 onTap: () => Scaffold.of(context).openDrawer(),
//                 child: Image.asset(
//                   "assets/Vector (1).png",
//                   height: _heightScale * 23,
//                   width: _widthScale * 22,
//                 ),
//               ),
//               //  title: ,
//               automaticallyImplyLeading: false,
//               elevation: 0,
//               backgroundColor: Colors.white,
//             ),
//             body: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       color: Colors.yellow,
//                       height: 500 * _heightScale,
//                       width: double.infinity,
//                       child: SmartRefresher(
//                         controller: refreshController,
//                         enablePullUp: true,
//                         enablePullDown: true,
//                         onRefresh: _onRefresh,
//                         onLoading: () => _onLoading(context),
//                         child: ListView.builder(
//                             itemCount: filter.isNotEmpty ? filter.length : 0,
//                             itemBuilder: (BuildContext context, index) {
//                            //   print('lol${filter[0]['username']}');
//                             //  provider.names((filter[index]['username']));
//                               return Text(res != null
//                                   ? filter[index]['username']
//                                   : 'dddd');
//                             }),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }

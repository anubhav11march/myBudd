// import 'package:flutter/cupertino.dart';
// import 'package:mybud/providers/api_provider.dart';
// import 'package:mybud/widgets/token_profile.dart';

// class GetUserProfile extends ChangeNotifier {
//   var data;

//     getUserProfile() async {
//     var response = await ApiProvider.get(
//         'https://sheltered-earth-76230.herokuapp.com/user/get/profile',

//    tokenProfile!.token, queryParam: {},
//     );
//     if (response['status'] == 200) {
//       print('inside adddetails success');
//       print('...${response.data}...');

//       // data = response['body']['message'];
//       notifyListeners();
//       return;
//     } else {
//       print('error');
//       // data = response['body']['message'];
//       notifyListeners();
//       // print(
//       //     'inside addLiveStreams error ${response['status']}: ${response['body']}');
//       return;
//     }
//   }
// }

import 'dart:convert';

//import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:mybud/widgets/token_profile.dart';

//var tokens = tokenProfile?.token;
Future getdummy(page, token) async {
  http.Response res = await http.get(
    Uri.parse(
        'https://sheltered-earth-76230.herokuapp.com/card/getcards?page=$page'),
    headers: {'Authorization': "Bearer " + token
   // 'eyJhbGciOiJIUzI1NiJ9.IjYxYjVmZTllMDY2ZjNhOWJmYjc0ODFiMiI.1BrDUIYNTertbV74L05Zc-6UC6p0WqLkIXBA1Outxac'
    // token
     },
  );
  var share1 = json.decode(res.body);
  var share2 = json.decode(res.body)['message'];
  if (res.statusCode == 200) {
    print("resdata.............");
    print('mmm$share2');
    print('mopopo$share1');
    print(res);
    return share1;
  } else if (res.statusCode == 400) {
    print('hjvhjvjh');
    print(res.body);
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

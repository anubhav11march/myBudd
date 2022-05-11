

import 'dart:convert';

//import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:mybud/widgets/token_profile.dart';

//var tokens = tokenProfile?.token;
Future getUserImage(token) async {
  http.Response res = await http.get(
    Uri.parse('https://mybud.herokuapp.com/user/get/image'),
    headers: {'Authorization': "Bearer " + token
     },
  );
 // http.MultipartFile.fromPath(, filePath)
  var share1 = json.decode(res.body)['data'];
  if (res.statusCode == 200) {
    print("resdata.............");
    print('mmm$share1');
    print('mopop$share1');
    print(res);
    return share1;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

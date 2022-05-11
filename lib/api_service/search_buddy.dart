
import 'dart:convert';

//import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:mybud/widgets/token_profile.dart';

//var tokens = tokenProfile?.token;
Future getSEarch(token, buddyid) async {
  http.Response res = await http.get(
    Uri.parse(buddyid.toString().contains(".com") ? 'https://mybud.herokuapp.com/user/searchbuddy?email=$buddyid' : 'https://mybud.herokuapp.com/user/searchbuddy?buddyid=$buddyid'),
    headers: {'Authorization': "Bearer " + token
     },
  );
 // http.MultipartFile.fromPath(, filePath)
  print("res " + res.body);
  var share1 = json.decode(res.body);
  if (res.statusCode == 200) {
    print("skills.............");

    print('mioio$share1');
    print(res.body);
    return share1;
  } else {
    return share1;
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

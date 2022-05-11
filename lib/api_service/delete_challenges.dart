
import 'dart:convert';

//import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:mybud/widgets/token_profile.dart';

//var tokens = tokenProfile?.token;
Future getDelete(token, name) async {
  http.Response res = await http.get(
    Uri.parse('https://mybud.herokuapp.com/challenge/deletechallenge?challengeid=$name'),
    headers: {'Authorization': "Bearer " + token
     },
  );
 // http.MultipartFile.fromPath(, filePath)
  var share1 = json.decode(res.body);
  if (res.statusCode == 200) {
   
   
    print('mioio$share1');
    print(res);
    return share1;
  } else {
    return share1;
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

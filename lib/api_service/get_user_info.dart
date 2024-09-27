
import 'dart:convert';

//import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;


//var tokens = tokenProfile?.token;
Future getUserInfo(token, id) async {
  http.Response res = await http.get(
    Uri.parse('https://mybud.herokuapp.com/card/getuser?userid=$id'),
    headers: {'Authorization': "Bearer " + token
     },
  );
 // http.MultipartFile.fromPath(, filePath)
  var share1 = json.decode(res.body);
  if (res.statusCode == 200) {
  
    print(res);
    return share1;
  } else {
    return share1;
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

import 'dart:convert';

//import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;
import 'package:mybud/widgets/token_profile.dart';

//var tokens = tokenProfile?.token;
Future gettasks(token) async {
  http.Response res = await http.get(
    Uri.parse('https://sheltered-earth-76230.herokuapp.com/task/gettasks'),
    headers: {'Authorization': "Bearer " + token},
  );
  var share1 = json.decode(res.body);

  if (res.statusCode == 200) {
    print("gettasks.............");

    print('mopopo$share1');
    print(res);
    return share1;
  } else if (res.statusCode == 400) {
    print('hjvhjvjh');
    print(res.body);
    return share1;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}

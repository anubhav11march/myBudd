import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:mybud/widgets/token_profile.dart';

class SignUp {
  static Future signUp(
      var username, var password, var email, var phoneno) async {
    print(username);
    print(password);
    print(email);
    //print(mobile);
    print('SignUp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'username': username,
      'password': password,
      'email': email,
      'phoneno': phoneno,
    });
    // var _url =
    //     Uri.parse('https://sheltered-earth-76230.herokuapp.com/user/signup');

    var response = await dio.post(
      'https://mybud.herokuapp.com/user/signup',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    print(username);
    print(password);
    print(email);
    //  print(mobile);
    print('${response.toString()}');
    
    if (response.statusCode == 200) {
      print('Response data : ${response.data}');
       tokenProfile =
          TokenProfile.fromJson(json.decode('"${response.data['data']}"'));
      // return json.decode(response.data);
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
      return response.data['error'];
      //  print('message of signup - ${json.decode(response.data)['error']}');
      // return json.decode(response.data);
    } else {
      return null;
    }
  }
}

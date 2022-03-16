import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:mybud/shared_preferences/login_preferences.dart';
import 'package:mybud/shared_preferences/token_preferences.dart';
import 'package:mybud/widgets/token_profile.dart';

class LogIn {
  static Future signIn(var username, var password , var fcmtoken) async {
    print('LogIn');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'username': username.toString(),
      'password': password.toString(),
      'fcmtoken' : fcmtoken.toString()
    });

    var response = await dio.post(
      'https://sheltered-earth-76230.herokuapp.com/user/login',
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

    print('${response.toString()}');

    if (response.statusCode == 200) {
      print('Response data : ${response.data}');
      print('.."${response.data['data']}"');
   
     
      //  tokenPreference.setTokenPreferenceData(response.data['data']);
      tokenProfile =
          TokenProfile.fromJson(json.decode('"${response.data['data']}"'));
      print('123');
      //  print('${json.decode(response.data['data'])}');
      //  print('${json.decode(response.data)['data']}');
      print('${(response.data)}');
      loginPreference!.setLoginStatus(true);
      return response.data;
      //return response.data['data'];
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
      return response.data;
      //  print('message of signup - ${json.decode(response.data)['error']}');
      // return json.decode(response.data);
    } else {
      return response.data['message'];
    }
  }
}

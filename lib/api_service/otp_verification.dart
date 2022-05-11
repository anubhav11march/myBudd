import 'dart:convert';
import 'package:flutter/foundation.dart';

//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:mybud/shared_preferences/login_preferences.dart';

class Otp {
  static Future verify(var code, var email) async {
    print('Otp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'code': code,
      'email': email,
      'type': 'verified'
    });

    var response = await dio.post(
      'https://mybud.herokuapp.com/user/verifyemail',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Response data : ${response.data}');
      loginPreference!.setLoginStatus(true);
      return response.data['success'];
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

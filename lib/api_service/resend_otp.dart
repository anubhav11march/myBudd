import 'dart:convert';
import 'package:flutter/foundation.dart';

//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ResendOtp {
  static Future verify( var email) async {
    print('Resend Otp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'email': email,
    });

    var response = await dio.post(
      'https://sheltered-earth-76230.herokuapp.com/user/resendotp',
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
      return response.data;
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

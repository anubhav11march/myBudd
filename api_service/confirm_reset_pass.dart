import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';

class AddResetPass {
  static Future verify(String email, password) async {
    print('password added');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'email': email,
      'password' : password
     
    });

    var response = await dio.post(
      'https://sheltered-earth-76230.herokuapp.com/user/resetpassword',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        //  headers: {'Authorization': "Bearer " + token
    
    // token
   // },
      ),
    );

    if (response.statusCode == 200) {
      print('Response data : ${response.data}');
      print('password added successfully');
      return response.data;
      // return json.decode(response.data);
    } else if (response.statusCode == 400) {
      print('Error code : ${response.data}');
      return response.data;
      //  print('message of signup - ${json.decode(response.data)['error']}');
      // return json.decode(response.data);
    } else {
      return null;
    }
  }
}

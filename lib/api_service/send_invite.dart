import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';

class SendInvite {
  static Future verify(buddyid, token) async {
    print('invite send');
    print(token);
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'buddyid':buddyid
    });

    var response = await dio.post(
      'https://mybud.herokuapp.com/user/sendinvite',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
          headers: {'Authorization': "Bearer " + token
    
    // token
     },
      ),
    );

    print("invite : ${response.statusCode}");

    if (response.statusCode == 200) {
      print('Response data : ${response.data}');
      print('invitation send successfully');
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

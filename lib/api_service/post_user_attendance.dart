import 'dart:convert';
import 'package:flutter/foundation.dart';

//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class PostAttendance {
  static Future verify(String challenge, token ) async {
    print('post challenge');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'challenge': challenge,
     
    });

    var response = await dio.post(
      'https://sheltered-earth-76230.herokuapp.com/challenge/attendence',
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

    if (response.statusCode == 200) {
      print('Response data : ${response.data}');
      print('attendance added successfully');
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

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mybud/providers/api_provider.dart';
import 'package:mybud/widgets/token_profile.dart';

class Updates {

  token({
    required String token,
    required var fcmtoken
  }) async {
    var dio = Dio();

    print("fcm token" + fcmtoken);

    var formData = FormData.fromMap({
      'fcmtoken': fcmtoken,
    });

    var response = await dio.post(
      'https://mybud.herokuapp.com/user/updateFcmtoken',
      data: formData,
      options: Options(
        headers: {
          'Authorization': "Bearer " + token
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );

    print(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('fcm token updated');
      return;
    } else {
      print('fcm error');
      // data = response['body']['message'];
      // print(
      //     'inside addLiveStreams error ${response['status']}: ${response['body']}');
      return;
    }
  }
}
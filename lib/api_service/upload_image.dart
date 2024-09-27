import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mybud/providers/api_provider.dart';
import 'dart:io';

import 'package:mybud/widgets/token_profile.dart';

class AddImage extends ChangeNotifier {
  var data;

  addImage({
   required File image
  }) async {
    var response = await ApiProvider.post(
      url: 'https://mybud.herokuapp.com/user/upload',
      body: {
      'image' : image == null? '' : await MultipartFile.fromFile(image.path),
    },
    token: tokenProfile!.token);
    if (response['status'] == 200) {
      print('inside adddetails success');

      // data = response['body']['message'];
      notifyListeners();
      return;
    } else {
      print('error');
      // data = response['body']['message'];
      notifyListeners();
      // print(
      //     'inside addLiveStreams error ${response['status']}: ${response['body']}');
      return;
    }
  }
}

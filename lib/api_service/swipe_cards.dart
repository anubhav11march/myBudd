

import 'package:flutter/cupertino.dart';
import 'package:mybud/providers/api_provider.dart';
import 'package:mybud/widgets/token_profile.dart';

class SwipeCards extends ChangeNotifier {
  // var data;

  addDetails({
    String? swipedby,
    String? swipedon,
    String? status,
  }) async {
    var response = await ApiProvider.post(
      url: 'https://sheltered-earth-76230.herokuapp.com/card/swipe',
      body: {'swipedby': swipedby, 'swipedon': swipedon, 'status': status},
      token: tokenProfile?.token,
    );
    if (response['status'] == 200) {
      print('inside adddetails success');
      print(response);
        print('response${response['body']['message']}');
      // data = response['body']['message'];
      notifyListeners();
      return response;
    } else {
      print('error');
      print(response);
      // data = response['body']['message'];
      notifyListeners();
      // print(
      //     'inside addLiveStreams error ${response['status']}: ${response['body']}');
      return;
    }
  }
}

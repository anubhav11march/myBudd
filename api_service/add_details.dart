import 'package:flutter/cupertino.dart';
import 'package:mybud/providers/api_provider.dart';
import 'package:mybud/widgets/token_profile.dart';

class AddDetails extends ChangeNotifier {
  var data;

  addDetails({
    String? profession,
    String? details,
    String? objective,
    String? target,
    String ?skills,
  }) async {
    var response = await ApiProvider.post(
      url: 'https://sheltered-earth-76230.herokuapp.com/user/add/details',
      body: {
        'profession': profession,
        'details': details,
        'objective': objective,
        'target': target,
        'skillsets': skills,
        'linkedinprofile':'qw'
      },
      token: tokenProfile?.token,
    );
    if (response['status'] == 200) {
      print('inside adddetails success');

      // data = response['body']['message'];
      notifyListeners();
      return;
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

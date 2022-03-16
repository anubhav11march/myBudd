//import 'dart:convert';

import 'dart:convert';

import 'package:mybud/shared_preferences/token_preferences.dart';

TokenProfile? tokenProfile;

class TokenProfile {
  var token;

  TokenProfile.values({
    this.token,
  });

  TokenProfile.fromJson(String value) {
    token = value;
    print('kk${token}');

    tokenPreference.setTokenPreferenceData(json.encode(value));
  }
}

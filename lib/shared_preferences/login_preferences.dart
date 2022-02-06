


import 'package:shared_preferences/shared_preferences.dart';

LoginPreference ?loginPreference;

class LoginPreference {
  static const _LOGIN_STATUS = 'LOGINSTATUS';
   static const _LOGIN_STATU = 'LOGINSTATU';
    static const _LOGIN_STAT = 'LOGINSTAT';
     static const _LOGIN_STA = 'LOGINSTA';

  setLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_LOGIN_STATUS, status);
    
  }
   setLoginStatu(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_LOGIN_STATU, status);
    
  }
     setLoginStat(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_LOGIN_STAT, status);
    
  }

  setLoginSta(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_LOGIN_STA, status);
    
  }
  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getBool(_LOGIN_STATUS) ?? false;
    } catch (e) {
      print('Error in login preference : $e');
      return false;
    }
  }
    Future<bool> getLoginStatu() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getBool(_LOGIN_STATU) ?? false;
    } catch (e) {
      print('Error in login preference : $e');
      return false;
    }
  }
      Future<bool> getLoginStat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getBool(_LOGIN_STAT) ?? false;
    } catch (e) {
      print('Error in login preference : $e');
      return false;
    }
  }
      Future<bool> getLoginSta() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getBool(_LOGIN_STA) ?? false;
    } catch (e) {
      print('Error in login preference : $e');
      return false;
    }
  }
}

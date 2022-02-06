import 'package:flutter/cupertino.dart';

class AddInfo extends ChangeNotifier {
  String? _profession;
  String _details = '.';
  String? _objective;
  String? _target;
  String skills = '';

  String? get pprofession => _profession;

  profess(var value) {
    _profession = value;
  }

  set profession(String? value) => _profession;

  String? get ddetails => _details;

  deta(var value) {
    _details = value;
  }

  set details(String? value) => _details;

  String? get dobjective => _objective;

  object(var value) {
    _objective = value;
  }

  set objective(String? value) => _objective;

  String? get ttarget => _target;

  targ(var value) {
    _target = value;
  }

  set target(String? value) => _target;

   String? get sskilss => skills;

  skii(var value) {
    skills = value;
  }

  set skill(String? value) => skills;
 
 
 
  List? _urlNames;

  List? get urlNames => _urlNames;
  names(var value) {
    _urlNames = value;
  }
}

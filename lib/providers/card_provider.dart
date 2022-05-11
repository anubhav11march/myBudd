import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mybud/api_service/get_cards.dart';
import 'package:mybud/widgets/token_profile.dart';
import 'package:provider/provider.dart';

enum CardStatus { like, dislike, superLike }

class CardProvider extends ChangeNotifier {
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;
  double _ii = 1;
  int _num = 0;
  bool truenum = false;
  int yu = 0;
  Color _pic = Colors.white;
  List<String> _urlImages = [];
  List<String> _urlNames = [];
  bool lik = false;
  bool unlik = false;
  bool superlik = false;
  int page = 1;
  bool loader = false;

  List<String> get urlImages => _urlImages;

  urlim(List<String> _ur) {
    _urlImages = _ur;
    print('iouy$_urlImages');

    // print('remove${_urlImages.removeLast()}');
  }

  List filter = [];

  pop(List uy) {
    filter = uy;
  }

  List<String> get urlNames => _urlNames;
  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;
  double get ii => _ii;
  int get num => _num;
  bool get truenu => truenum;
  int get yuyu => yu;
  int get lesnum => _num - 1;
  Color get pic => _pic;
  bool get likes => lik;
  bool get superlikes => superlik;
  bool get unlikes => unlik;
  int get pages => page;
  bool get load => loader;

  CardProvider() {
    resetUsers();
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;

    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;

    final y = _position.dy;
    _angle = 45 * x / _screenSize.width;
    if (x > 0) {
      _pic = Colors.green;
    }
    // else
    if (x < 0) {
      _pic = Colors.red;
    }
    //else
    if (y < -100) {
      _pic = Colors.yellow;
    }
    notifyListeners();
  }

  double getStatusOpacity() {
    final delta = 100;
    final pos = max(_position.dx.abs(), _position.dy.abs());
    final opacity = pos / delta;

    return min(opacity, 0.8);
  }

  endPosition() {
    _isDragging = false;
    notifyListeners();

    final status = getStatus(force: true);

    if (status != null) {
      //  Fluttertoast.cancel();
      // var snackBar = SnackBar(
      //   content:Text( status.toString().split('.').last.toUpperCase()),
      //   duration: Duration(milliseconds: 2000),
      // );
      //  Fluttertoast.showToast(
      //  msg: status.toString().split('.').last.toUpperCase(),
      //  fontSize: 36,
      // );
    }

    switch (status) {
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.superLike:
        superLike();
        break;
      default:
        resetPosition();
    }
  }

  void resetPosition() async {
    truenum = false;
    var re;
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    _ii = 1;
    _pic = Colors.white;
    // loader = false;

    notifyListeners();
  }

  CardStatus? getStatus({bool force = false}) {
    final x = _position.dx;
    final y = _position.dy;
    final forceSuperLike = x.abs() < 20;

    if (force) {
      final delta = 100;

      if (x >= delta) {
        //  _pic = Colors.green;
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      } else if (y <= -delta / 2 && forceSuperLike) {
        return CardStatus.superLike;
      }
    } else {
      final delta = 20;

      if (x >= delta) {
        //   _pic = Colors.green;
        return CardStatus.like;
      } else if (x <= -delta) {
        return CardStatus.dislike;
      } else if (y <= -delta * 2 && forceSuperLike) {
        return CardStatus.superLike;
      }
    }
  }

  dislike() {
    //  truenum = false;
    _angle = -20;
    _position -= Offset(2 * _screenSize.width, 0);
    _pic = Colors.red;
    unlik = true;
    // ii = red;
    //  status = true;
    nextCard();

    notifyListeners();
  }

  //int i;
  like() {
    //  truenum = false;
    //   _pic =  Colors.green;
    _angle = 20;
    _position += Offset(_screenSize.width * 2, 0);
    _ii = 1;
    _pic = Colors.green;

    lik = true;
    // i = 2;
    // status = true;
    nextCard();

    notifyListeners();
    //  return true;
  }

  superLike() {
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _pic = Colors.yellow; //status also needs to be changed line124 ,149
    // status = true;
    superlik = true;
    nextCard();

    notifyListeners();
  }

  Future nextCard() async {
    // lik = false;
    //print('objt$_urlImages');
    // if (_urlImages.isEmpty || _urlNames.isEmpty) return ;

    await Future.delayed(Duration(milliseconds: 400));
    lik = false;
    unlik = false;
    superlik = false;

    // loader = true;

    _urlImages.removeLast();
    print('objtt$_urlImages $_num');

    // _urlNames.removeAt(0);
    if (_num < 9) {
      print('[][]]]]');
      _num = _num + 1;
      truenum = false;
    } else if (_num == 9) {
      print('00000ppppppp');
      truenum = true;
      //   page = page + 1;

      _num = 0;
      page = 1;
      await getdummy(page, tokenProfile?.token);
      resetUsers();
    }
    resetPosition();
    //    await Future.delayed(Duration(milliseconds: 1000),()=> CircularProgressIndicator());
  }

  void resetUsers() async {
    var res;
    //  res = await getdummy(page, tokenProfile?.token);

    res = await getdummy(page, tokenProfile?.token);
    yu = 0;

    print('opop$res');
    print('deepanshu');

    print('urlimag$urlImages');
    _urlImages = List<String>.generate(
        res['data'].length,
        (index) => res['message'] == 'Already have a buddy!'
            ? res['data']['image']['location']
            : res['data'][index]['image'] != null
                ? res['data'][index]['image']['location']
                : 'vvv'
        // : 'https://mybud.s3.us-east-2.amazonaws.com/uploads/af10d412-71ef-42a0-9601-ffce79a87f18.jpg',
        ).reversed.toList();

    _urlNames = <String>[
      'asse',
      'asset',
      'assets',
      'assetss',
      'assetsss',
      'assetssss',
      'assetsssss',
      'assetssssssp'
    ].toList();

    notifyListeners();
  }
}

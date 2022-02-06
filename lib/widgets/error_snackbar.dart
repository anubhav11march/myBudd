import 'package:flutter/material.dart';


class ErrorSnackBar {
  static bool _isSnackbarActive = false;

  static snackBar(BuildContext context, String msg, {double height = 0}) {
    // Connection.snackBar(context).ScaffoldMessengerState.hideCurrentSnackBar();
    if (!_isSnackbarActive) {
      _isSnackbarActive = true;
      return ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              content: Text(
                msg,
               // style: CustomTextStyle.openSans11010W600(context),
              ),
              backgroundColor: Color.fromRGBO(245, 246, 248, 1),
              behavior: SnackBarBehavior.floating,
              elevation: 5,
              margin: EdgeInsets.only(
                  left: 10, right: 10, top: 15, bottom: height + 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              duration: const Duration(seconds: 2),
            ),
          )
          .closed
          .then((SnackBarClosedReason reason) {
        _isSnackbarActive = false;
      });
    }
  }
}

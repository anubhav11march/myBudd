import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message , Color color) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              message,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            backgroundColor: color,
          ),
        );
}

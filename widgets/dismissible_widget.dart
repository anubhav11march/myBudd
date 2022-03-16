import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DismissibleWidget<T> extends StatelessWidget {
  final T item;
  final Widget child;
  final DismissDirectionCallback onDismissed;

  const DismissibleWidget({
    required this.item,
    required this.child,
    required this.onDismissed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Dismissible(
        key: ObjectKey(item),
        background: buildSwipeActionLeft(),
        secondaryBackground: buildSwipeActionRight(),
        child: child,
        onDismissed: onDismissed,
      );

  Widget buildSwipeActionLeft() => Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xFFA585C1),
        child: Text('I did this!',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      );

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color(0xFFEF4C48),
        child: Text('Delete',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      );
}

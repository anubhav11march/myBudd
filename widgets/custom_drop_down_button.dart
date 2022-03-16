import 'package:flutter/material.dart';

// import '../services/circular_loading.dart';

class CustomDropDownButton extends StatelessWidget {
  final double widthScale;
  final List items;
  // final Map itemsMap;

  final String value;
  final Function onChange;
  final String hintText;
  final Color fillColor;

  CustomDropDownButton({
    required this.widthScale,
    required this.hintText,
    required this.items,
    required this.onChange,
    required this.value,
    // required this.itemsMap,
    this.fillColor = const Color.fromRGBO(242, 242, 242, 1),
  });

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return DropdownButtonHideUnderline(
      child: Container(
          height: 56 * _heightScale,
          width: 328 * _widthScale,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16 * _widthScale),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Color.fromRGBO(0, 0, 0, .12),
            ),
            color: fillColor,
          ),
          child:
              //itemsMap == null
              //  ?
              DropdownButtonFormField(
            decoration: InputDecoration.collapsed(hintText: hintText),
            // style: CustomTextStyle.roboto9911W400(context)
            items: [
              ...items.map(
                (e) => DropdownMenuItem(
                  child: Text(
                    e,
                    //   style: CustomTextStyle.roboto9912W400(context),
                    // textScaleFactor: widthScale,
                  ),
                  value: e,
                ),
              ),
            ],
            value: value,
            hint: Text(
              hintText,
            ),
            onChanged: (val) => onChange(val),
          )
          // : DropdownButtonFormField(
          //     decoration: InputDecoration.collapsed(hintText: ''),
          //     style: CustomTextStyle.roboto9911W400(context),
          //     items: [
          //       ...itemsMap.entries.map(
          //         (e) => DropdownMenuItem(
          //           child: Text(
          //             e.value,
          //             style: CustomTextStyle.roboto9912W400(context),
          //             textScaleFactor: widthScale,
          //           ),
          //           value: e.key,
          //         ),
          //       ),
          //     ],
          //     value: value,
          //     hint: Text(
          //       hintText,
          //     ),
          //     onChanged: (val) => onChange(val),
          //   ),
          ),
    );
  }
}

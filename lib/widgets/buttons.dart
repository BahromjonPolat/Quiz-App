import 'package:examtwo/consts/colors.dart';
import 'package:examtwo/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ElevatedButton setElevatedButton(VoidCallback onPressed, String label,
        {Color? color,
        double? radius,
        }) =>
    ElevatedButton(
      onPressed: onPressed,
      child: setSimpleText(
        label,
        color: colorWhite,

      ),
      style: ElevatedButton.styleFrom(
        primary: color ?? colorGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 12.0)
        )
      ),
    );

TextButton setTextButton(
  VoidCallback onPressed,
  String label, {
  Color? color,
  double? size,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontFamily: "GothamBook",
          fontSize: size ?? 14,
          color: color ?? colorWhite,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

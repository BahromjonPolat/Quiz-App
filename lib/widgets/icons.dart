import 'package:examtwo/consts/colors.dart';
import 'package:flutter/material.dart';

setIcon(
  IconData iconData, {
  Color? color,
  double? size,
}) =>
    Icon(
      iconData,
      color: color ?? colorGrey,
      size: size ?? 24.0,
    );

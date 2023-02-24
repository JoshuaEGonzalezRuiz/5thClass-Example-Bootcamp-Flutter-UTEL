import 'package:flutter/material.dart';

TextStyle titleStyle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

TextStyle descStyle(double fontSize, bool isTitle) {
  return TextStyle(
      fontSize: fontSize,
      fontStyle: isTitle ? FontStyle.normal : FontStyle.italic,
      fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      color: Colors.black);
}

double fontSize(double width, double heigth, bool isList) {
  if (isList) {
    return width <= 1250 && width >= 900
        ? 16
        : width <= 900 && width >= 650
            ? 14
            : width <= 650 && width > 550
                ? 12
                : width <= 550
                    ? 10
                    : 18;
  } else {
    return (width > 1500 && width < 1650) || (width > 1050 && width < 1250)
        ? 12
        : width > 900 && width < 1050
            ? 16
            : 14;
  }
}

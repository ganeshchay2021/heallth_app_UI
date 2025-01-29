import 'package:flutter/material.dart';

class UiHelper {
  static Text customText({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    
  }) {
    return Text(
      text,
      overflow: TextOverflow.fade,
      style: TextStyle(
          fontSize: fontSize,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }

  static Container customIcon(
      {required IconData icon, double? iconSize, Color? color}) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black12),
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: color,
      ),
    );
  }

  static Image assetsImage({required String image, BoxFit? boxFit}) {
    return Image.asset(
      image,
      fit: boxFit,
    );
  }

  static Image networkImage({required String image, BoxFit? boxFit}) {
    return Image.network(
      image,
      fit: boxFit,
    );
  }
}

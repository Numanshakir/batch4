import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomText(
      {super.key,
      required this.title,
      this.color = Colors.black,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      
      style: TextStyle(
        
          color: color,
          fontFamily: "Poppins",
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}

import 'package:flutter/material.dart';

class CuButton extends StatelessWidget {
  CuButton(
      {super.key,
      required this.text,
      this.height,
      this.width,
      this.textColor = Colors.white,
      this.containerColor});
  String? text;
  double? height;
  double? width;
  Color? textColor;
  Color? containerColor;
  bool? border = false;
  var size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // height = size.height;
    // width = size.width;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(10)),
        width: width,
        height: height,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

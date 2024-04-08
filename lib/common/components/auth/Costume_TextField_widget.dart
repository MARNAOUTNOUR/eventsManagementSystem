import 'package:events_app/common/core/constants/theme.dart';
import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    Key? key,
    required this.hintText,
    required this.inputType,
    required this.title,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final String hintText;
  final String title;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //1
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            title,
            style: const TextStyle(
              color: ThemesStyles.textColor,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
        ),
        //2
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          obscureText: title == "Password" ? true : false,
          cursorColor: ThemesStyles.primary, // Change cursor color
          style: TextStyle(
            color: ThemesStyles.textColor, // Change text color
            fontSize: ThemesStyles.littelFontSize, // Change text font size
          ),
          decoration: InputDecoration(
            fillColor: ThemesStyles.background,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xff696969), fontSize: 16),

            // Customize the border color and radius
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff696969), width: 2.0),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ThemesStyles.primary, width: 2.0),
              borderRadius: BorderRadius.circular(5),
            ),
            // Adjust the height of the TextField using contentPadding
            contentPadding: const EdgeInsets.all(15.0),
          ),
          validator: validator,
        ),
      ],
    );
  }
}

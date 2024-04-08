
import 'package:events_app/common/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomeNumberFildOTP extends StatelessWidget {
  const CustomeNumberFildOTP({super.key, required this.onSaved});
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 68,
            width: 64,
            child: Container(
              color: ThemesStyles.thirdColor, // Background color
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "0",
                  border: InputBorder.none, // Remove default border
                ),
                onSaved: onSaved,
                onChanged:(value) {
                    if (value.length == 1) {
                      //to go to another textfild directly
                      FocusScope.of(context).nextFocus();
                    }
                  } ,
                style: Theme.of(context).textTheme.headlineSmall,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

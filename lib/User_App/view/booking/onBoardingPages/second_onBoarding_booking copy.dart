import 'package:events_app/common/components/auth/Costume_TextField_widget.dart';
import 'package:events_app/User_App/components/booking/onBoarding_Questions_Component.dart';
import 'package:events_app/common/core/constants/theme.dart';
import 'package:flutter/material.dart';

class SecondOnBoardingBooking extends StatelessWidget {
  SecondOnBoardingBooking({super.key});
  final TextEditingController reagionController = TextEditingController();
  final List<String> radioData = ['Public', 'Private'];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //1
        const OnBoardingQuestionsComponent(
          boandingPageNumber: 2,
          title: "Manage your event",
          supTitle:
              "What are the reagion which you search about Lounges, organizers or Public Events in?",
          image: "assets/images/first_boanding.png",
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: ThemesStyles.paddingprimary * 2),
          child: CustomeTextFormField(
              hintText: "Ex: Mohjeren",
              inputType: TextInputType.text,
              title: "",
              controller: reagionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the reagion';
                }
                return null;
              }),
        )
      ],
    );
  }
}

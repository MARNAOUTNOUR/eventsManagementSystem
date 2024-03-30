import 'package:events_app/components/booking/onBoarding_Questions_Component.dart';
import 'package:events_app/controllers/booking/first_onboarding_radio_controller.dart';
import 'package:events_app/core/constants/theme.dart';
import 'package:events_app/view/booking/onBoardingPages/second_onBoarding_booking%20copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstOnBoardingBooking extends StatelessWidget {
  FirstOnBoardingBooking({super.key});
  final RadioController _controller =
      Get.put(RadioController()); // Initialize the controller
  final List<String> radioData = ['Public', 'Private'];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //1
        const OnBoardingQuestionsComponent(
          boandingPageNumber: 1,
          title: "Manage your event",
          supTitle: "Is the event you want public or private?",
          image: "assets/images/first_boanding.png",
        ),
        //2 radio button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildRadioButtons(radioData),
        ),
      ],
    );
  }

  List<Widget> _buildRadioButtons(List<String> radioData) {
    List<String> _radioValues = radioData;

    return List<Widget>.generate(
      _radioValues.length,
      (index) {
        return SizedBox(
          width: 150,
          child: Obx(() => RadioListTile<int>(
                title: Text(_radioValues[index]),
                value: index,
                groupValue: _controller.selectedValue.value,
                onChanged: (int? value) {
                  _controller.setSelectedValue(value!);
                },
              )),
        );
      },
    );
  }
}

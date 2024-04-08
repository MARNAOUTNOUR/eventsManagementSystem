import 'package:events_app/common/components/auth/otp/number_fild_otp.dart';
import 'package:events_app/common/components/general/defult_button.dart';
import 'package:events_app/common/controllers/auth/otp_timer_controller.dart';
import 'package:events_app/common/core/constants/theme.dart';
import 'package:events_app/User_App/view/home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpPage extends StatelessWidget {
  final TimerController timerController = Get.put(TimerController());

  OtpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(ThemesStyles.paddingprimary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //1
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                "Verification code",
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? ThemesStyles.seconndTextColor
                      : ThemesStyles.textColor,
                  fontWeight: ThemesStyles.fontWeightBold,
                  fontSize: ThemesStyles.mainFontSize,
                ),
              ),
            ),
            //2
            const Text(
              "We have sent the code verification to",
              style: TextStyle(
                color: Color(0xff45444B),
              ),
            ),
            //3
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Text(
                    "+99*******1233",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? ThemesStyles.seconndTextColor
                          : ThemesStyles.textColor,
                      fontWeight: ThemesStyles.fontWeightBold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Change phone number?",
                        style: TextStyle(
                          color: ThemesStyles.primary,
                          fontWeight: ThemesStyles.fontWeightBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //4
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //NOTE: here i will Save the PINs Data
                CustomeNumberFildOTP(onSaved: (pin1) {}),
                CustomeNumberFildOTP(onSaved: (pin2) {}),
                CustomeNumberFildOTP(onSaved: (pin3) {}),
                CustomeNumberFildOTP(onSaved: (pin4) {}),
              ],
            ),
            //5
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Resend code after ",
                      style: TextStyle(
                        color: Color(0xff45444B),
                      ),
                    ),
                    Obx(
                      () => Center(
                        child: Text(
                          timerController.start.value, // Display timer value
                          style: const TextStyle(
                            color: ThemesStyles.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //6
            const Spacer(),
            Row(
              children: <Widget>[
                Expanded(
                  child: DefultButton(
                    textColor: Theme.of(context).brightness == Brightness.dark
                        ? ThemesStyles.seconndTextColor
                        : ThemesStyles.textColor,
                    buttonColor: Theme.of(context).brightness == Brightness.dark
                        ? ThemesStyles.backgroundDark
                        : ThemesStyles.seconndTextColor,
                    borderColor: ThemesStyles.primary,
                    title: "Resend",
                    onPressed: () {
                      //Here we will Resend the OTP code again
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                  horizontal: ThemesStyles.paddingprimary / 2,
                )),
                Expanded(
                  child: DefultButton(
                    textColor: ThemesStyles.seconndTextColor,
                    buttonColor: ThemesStyles.primary,
                    borderColor: ThemesStyles.primary,
                    title: "Confirm",
                    onPressed: () {
                      //Here we will Confirm the OTP code
                      // Navigator.push(
                      //   context,
                      //   SlidToPage(
                      //     page: const DrawerPage(),
                      //     onComplete: () {
                      //       Navigator.pushReplacement(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => const DrawerPage()));
                      //     },
                      //   ),
                      // );
                      Get.offAll(const DrawerPage());
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

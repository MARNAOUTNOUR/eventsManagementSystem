import 'package:events_app/components/booking/onBoarding_Questions_Component.dart';
import 'package:events_app/components/first_open/boading_widget.dart';
import 'package:events_app/core/constants/theme.dart';
import 'package:events_app/view/booking/onBoardingPages/first_onBoarding_booking.dart';
import 'package:events_app/view/booking/onBoardingPages/second_onBoarding_booking%20copy.dart';
import 'package:events_app/view/home/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainBookingPage extends StatelessWidget {
  MainBookingPage({super.key});
  final PageController _controller = PageController();
  void nextPage() {
    if (_controller.page == 5) {
      // If on the sixth slide, navigate to Showing Lounges AND ORGANIZERS page
      //Get.to(DrawerPage());
    } else {
      // Otherwise, navigate to the next slide
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ThemesStyles.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                //=====================First slide================
                FirstOnBoardingBooking(),

                //=====================Second slide================
                SecondOnBoardingBooking(),
                //=====================third slide================
                SecondOnBoardingBooking(),
                //=====================Fourth slide================
                SecondOnBoardingBooking(),
                //=====================Fiveth slide================
                SecondOnBoardingBooking(),
                //=====================sixth slide================
                SecondOnBoardingBooking(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the previous page
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                  child: const Text(
                    "BACK",
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 6,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: ThemesStyles
                        .primary, // Change the color of the active dot
                    dotColor: Color(
                        0xff45444B), // Change the color of the inactive dots
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the next page
                    nextPage();
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: ThemesStyles.primary,
                      fontSize: ThemesStyles.mainFontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

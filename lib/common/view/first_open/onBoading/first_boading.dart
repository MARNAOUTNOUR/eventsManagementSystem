import 'package:events_app/common/Util/slide_to_page_route.dart';
import 'package:events_app/common/components/first_open/boading_widget.dart';
import 'package:events_app/common/core/constants/theme.dart';
import 'package:events_app/common/view/first_open/welcom_page.dart';
import 'package:flutter/material.dart';

class FirstBoading extends StatelessWidget {
  const FirstBoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemesStyles.background,
        appBar: AppBar(
          title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  SlidToPage(
                    page: const WelcomPage(),
                    onComplete: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomPage()));
                    },
                  ),
                );
              },
              child: const Text("SKIP")),
          titleTextStyle:
              const TextStyle(color: Color(0xff464646), fontSize: 16),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0.0,
        ),
        // u can find BoadingWidget() in lib\widgets\first_open
        body: const BoadingWidget(
          boandingPageNumber: 1,
          title: "Manage your event",
          supTitle: "You can easily manage all of your events in mode for free",
          image: "assets/images/first_boanding.png",
        ));
  }
}

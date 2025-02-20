import 'package:events_app/common/Util/slide_to_page_route.dart';
import 'package:events_app/common/core/constants/theme.dart';
import 'package:events_app/common/view/first_open/onBoading/first_boading.dart';
import 'package:events_app/common/view/first_open/onBoading/second_boading.dart';
import 'package:events_app/common/view/first_open/onBoading/third_boading.dart';
import 'package:events_app/common/view/first_open/welcom_page.dart';
import 'package:events_app/common/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class BoadingWidget extends StatelessWidget {
  const BoadingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.supTitle,
    required this.boandingPageNumber,
  });
  final String image;
  final String title;
  final String supTitle;
  final int boandingPageNumber;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //1
      Container(
        padding: const EdgeInsets.only(bottom: 20),
        width: 300,
        height: 350,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
      //2
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 4,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: boandingPageNumber == 1
                      ? ThemesStyles.textColor
                      : Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: boandingPageNumber == 2
                        ? ThemesStyles.textColor
                        : Colors.grey),
              ),
            ),
            Container(
              width: 30,
              height: 4,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: boandingPageNumber == 3
                      ? ThemesStyles.textColor
                      : Colors.grey),
            ),
          ],
        ),
      ),
      //3
      Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 34,
            color: ThemesStyles.textColor,
          ),
        ),
      ),
      //4
      Container(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        width: 350,
        child: Text(
          supTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: ThemesStyles.textColor.withOpacity(.8),
          ),
        ),
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                //Navigator.pop(context)
                if (boandingPageNumber == 1) {
                  Navigator.push(
                    context,
                    SlidToPage(
                      page: const SplashPage(),
                      onComplete: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SplashPage()));
                      },
                    ),
                  );
                } else if (boandingPageNumber == 2) {
                  Navigator.push(
                    context,
                    SlidToPage(
                      page: const FirstBoading(),
                      onComplete: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FirstBoading()));
                      },
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    SlidToPage(
                      page: const SecondBoading(),
                      onComplete: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SecondBoading(),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
              child: Text(
                "BACK",
                style: TextStyle(color: ThemesStyles.textColor.withOpacity(.6)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (boandingPageNumber == 1) {
                  Navigator.push(
                    context,
                    SlidToPage(
                      page: const SecondBoading(),
                      onComplete: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondBoading()));
                      },
                    ),
                  );
                } else if (boandingPageNumber == 2) {
                  Navigator.push(
                    context,
                    SlidToPage(
                      page: const ThirdBoading(),
                      onComplete: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ThirdBoading()));
                      },
                    ),
                  );
                } else {
                  //here we will go to Welcome Page
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomPage()));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemesStyles.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                fixedSize: boandingPageNumber != 3
                    ? const Size(95.0, 50.0)
                    : const Size(190, 50.0), // Width and height of the button
              ),
              child: Text(
                boandingPageNumber != 3 ? "NEXT" : "GET STARTED",
                style: const TextStyle(
                    color: ThemesStyles.seconndTextColor, fontSize: 16),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

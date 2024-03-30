import 'package:events_app/components/home/book_now_card.dart';
import 'package:events_app/components/home/new_on_app_card.dart';
import 'package:events_app/components/home/offers_card.dart';
import 'package:events_app/components/home/person_kind_card.dart';
import 'package:events_app/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _mediaquereWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //===============================1 first card===============================
                PersonKindCard(
                  image: 'assets/images/markupFirstScreen.png',
                  content: "organizers".tr,
                  width: _mediaquereWidth * 0.45,
                ),
                //===============================2 second card===============================
                PersonKindCard(
                  image: 'assets/images/second_boanding.png',
                  content: "Lounges".tr,
                  width: _mediaquereWidth * 0.45,
                ),
              ],
            ),
            //===============================3 third card===============================
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: PersonKindCard(
                image: 'assets/images/publicEvents.png',
                content: "PublicEvents".tr,
                width: _mediaquereWidth,
              ),
            ),
            //===============================3 Book Now Card===============================
            OrderNowCardWidget(),
            //===============================4 List of New Loungers and Organizers===============================
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ThemesStyles.paddingprimary),
                  child: Text(
                    "New to the app:".tr,
                    style: TextStyle(
                      fontSize: ThemesStyles.mainFontSize,
                      fontWeight: ThemesStyles.fontWeightBold,
                    ),
                  ),
                ),
                const NewOnAppCard(),
              ],
            ),
            //===============================5 OFFERS Card===============================
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ThemesStyles.paddingprimary * 2),
              child: const OffersCard(),
            ),
          ],
        ),
      ),
    );
  }
}

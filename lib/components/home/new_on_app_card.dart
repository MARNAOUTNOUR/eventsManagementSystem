import 'package:events_app/components/home/person_kind_card.dart';
import 'package:events_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class NewOnAppCard extends StatelessWidget {
  const NewOnAppCard({super.key});

  @override
  Widget build(BuildContext context) {
    double _mediaquereWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: 160,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(ThemesStyles.borderradiusprimary),
                ),
                color: index % 2 == 0
                    ? ThemesStyles.blueColor
                    : ThemesStyles.greenColor,
              ),
              child: Column(
                children: [
                  //THE Images
                  PersonKindCard(
                    image: 'assets/images/second_boanding.png',
                    content: "",
                    width: _mediaquereWidth * 0.4,
                  ),
                  //THE content
                  Container(
                      width: _mediaquereWidth * 0.38,
                      child: Text(
                        "Zakaria Al-nabuilsi",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: ThemesStyles.fontWeightBold,
                            fontSize: ThemesStyles.littelFontSize,
                            color: ThemesStyles.textColor),
                      )),
                  Container(
                      width: _mediaquereWidth * 0.38,
                      child: Text(
                        "Damascus-Mohajeren",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: ThemesStyles.textColor),
                      )),
                ],
              ),
            ),
            // MobileSalesItem(branch: data[index], index: index),
          );
        },
      ),
    );
  }
}

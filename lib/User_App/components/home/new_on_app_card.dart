import 'package:events_app/common/Util/lang_controller.dart';
import 'package:events_app/User_App/components/home/person_kind_card.dart';
import 'package:events_app/common/core/constants/theme.dart';
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
                 const  PersonKindCard(
                  isNewOnApp: true,
                    image: 'assets/images/second_boanding.png',
                    content: "",
                    width: 180,
                  ),
                  //THE content
                  Container(
                      padding: LanguageRadioController().selectedValue
                          ? EdgeInsets.only(left: 10)
                          : EdgeInsets.only(right: 10),
                      child: Text(
                        "Zakaria Al-nabuilsi",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: ThemesStyles.fontWeightBold,
                            fontSize: ThemesStyles.mainFontSize,
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

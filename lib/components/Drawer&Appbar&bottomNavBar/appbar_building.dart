import 'package:events_app/Util/lang_controller.dart';
import 'package:events_app/core/constants/theme.dart';
import 'package:events_app/main.dart';
import 'package:flutter/material.dart';

// AppBarBuilding function
AppBar? appBarBuilding(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return MediaQuery.of(context).size.width <= 900
      ? AppBar(
          backgroundColor: ThemesStyles.primary,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.notifications,
                color: ThemesStyles.secondary,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ValueListenableBuilder<ThemeMode>(
                  valueListenable: notifier,
                  builder: (_, mode, ___) {
                    return GestureDetector(
                      onTap: () => notifier.value = mode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light,
                      child: Icon(
                        Icons.dark_mode,
                        color: ThemesStyles.secondary,
                      ),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.language,
                color: ThemesStyles.secondary,
              ),
            ),
            Padding(
              padding: LanguageRadioController().selectedValue
                  ? EdgeInsets.only(left: 30.0, right: 8.0)
                  : EdgeInsets.only(left: 8.0, right: 30.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                    "assets/images/Profile.png"), // Change image path
              ),
            ),
          ],
        )
      : null;
}

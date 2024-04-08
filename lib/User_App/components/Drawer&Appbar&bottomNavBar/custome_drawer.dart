import 'package:events_app/common/Util/lang_controller.dart';
import 'package:events_app/User_App/components/Drawer&Appbar&bottomNavBar/custome_drawer_item.dart';
import 'package:events_app/common/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final Color selectedColor;

  const DrawerWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Theme.of(context).brightness == Brightness.dark
          ? ThemesStyles.backgroundDark
          : ThemesStyles.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.back();
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 10, bottom: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    100), // Half of container width/height for perfect circle
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/images/Logo.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          DrawerItem(
            title: 'Home',
            icon: Icons.home_work_outlined,
            index: 0,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
            selectedColor: selectedColor,
          ),

          DrawerItem(
            title: 'Settings',
            icon: Icons.person_2_outlined,
            index: 1,
            selectedIndex: selectedIndex,
            onItemTapped: onItemTapped,
            selectedColor: selectedColor,
          ),
          // DrawerItem(
          //   title: "reports",
          //   icon: Icons.picture_as_pdf_outlined,
          //   index: 2,
          //   selectedIndex: selectedIndex,
          //   onItemTapped: onItemTapped,
          //   selectedColor: selectedColor,
          // ),
          DrawerItem(
            title: "Logout",
            icon: Icons.logout,
            index: 4,
            selectedIndex: selectedIndex,
            onItemTapped: (value) {
              // Show loading indicator dialog
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
              //===============START function to logout==========================
              // DioHelper()
              //     .getData(path: 'users/logout', token: token)
              //     .then((value) {
              //   //===============================================
              //   //to remove this value after loggedout cause i need it just
              //   GetStorage().remove('isUserAdmin');
              //   // Hide loading indicator dialog
              //   Get.back();
              //   window.localStorage.remove('token');
              //   //===============================================
              //   showToast(
              //       text: "Successfully logged out",
              //       state: ToastStates.SUCCESS);
              //   token = '';
              //   Get.offAndToNamed('/Login');
              // });
              //===============END function to logout==========================
            },
            selectedColor: selectedColor,
          ),
          const Spacer(
            flex: 3,
          ),
          //===============================lang==========================
          GetBuilder<LanguageRadioController>(
              init: LanguageRadioController(),
              builder: (LanguageRadioController controller) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Arabic".tr,
                          style: const TextStyle(
                            color: ThemesStyles.primary,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.toggleLanguage();
                            },
                            icon: const Icon(
                              Icons.swap_horiz_rounded,
                              color: ThemesStyles.primary,
                              size: 18,
                            )),
                        Text(
                          "English".tr,
                          style: const TextStyle(
                            color: ThemesStyles.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

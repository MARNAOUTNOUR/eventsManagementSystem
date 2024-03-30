import 'package:events_app/Util/LocaleController.dart';
import 'package:get/get.dart';

class LanguageRadioController extends GetxController {
  LocalController controllerLang = Get.find();
  bool get selectedValue => Get.locale?.languageCode == 'ar';

  void toggleLanguage() {
    if (Get.locale?.languageCode == 'ar') {
      controllerLang.changeLang("en");
    } else {
      controllerLang.changeLang("ar");
    }
  }
}

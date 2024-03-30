import 'package:get/get.dart';

class LangLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "organizers": "المنظمين",
          "Lounges": "الصالات",
          "PublicEvents": "فعاليات عامة",
          "New to the app:": "جديد على التطبيق: ",
          "Arabic": "اللغة العربية",
          "English": "اللغة الأنكليزية",
        },
        "en": {
          "organizers": "Organizers",
          "Lounges": "Lounges",
          "PublicEvents": "Public Events",
          "New to the app:": "New to the app: ",
          "Arabic": "Arabic",
          "English": "English",
          //========================================Booking=================================
          "What are the reagion which you search about Lounges, organizers or Public Events in?":"What are the reagion which you search about Lounges, organizers or Public Events in?",
          "Is the event you want public or private?":"Is the event you want public or private?",
        }
      };
}

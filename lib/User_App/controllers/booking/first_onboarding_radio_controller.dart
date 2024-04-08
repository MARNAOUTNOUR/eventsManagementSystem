
import 'package:get/get.dart';

class RadioController extends GetxController {
  RxInt selectedValue = 0.obs; // Observe changes to the selected value

  void setSelectedValue(int value) {
    selectedValue.value = value;
  }
}
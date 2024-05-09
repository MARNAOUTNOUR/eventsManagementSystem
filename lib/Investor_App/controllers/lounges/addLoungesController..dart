import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class addLoungesController extends GetxController {
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;
  var selectedImagePaths = <String>[].obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);

    if (PickedFile != null) {
      selectedImagePath.value = pickedFile!.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";
      selectedImagePaths.add(pickedFile.path);
    } else {
      Get.snackbar("Error", 'message', snackPosition: SnackPosition.BOTTOM);
    }
  }

  void removeImage(String imagePath) {
    selectedImagePaths.remove(imagePath);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}

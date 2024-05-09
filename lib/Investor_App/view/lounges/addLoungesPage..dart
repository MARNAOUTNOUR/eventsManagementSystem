import 'dart:io';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:events_app/common/components/auth/Costume_TextField_widget.dart';
import 'package:events_app/common/components/auth/defaultFormField.dart';
import 'package:events_app/common/components/general/defaultButton.dart';
import 'package:events_app/common/components/general/defult_button.dart';
import 'package:events_app/common/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/lounges/addLoungesController..dart';

class AddLoungesPage extends GetView<addLoungesController> {
  AddLoungesPage({super.key});
  var size, height, width;
  TextEditingController d = TextEditingController();
  String? dropdownValue; // Variable to hold the selected value
  List<String> dropdownItems = ['Item 1', 'Item 2', 'Item 3'];
  @override
  Widget build(BuildContext context) {
    Get.put(addLoungesController());
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemesStyles.secondary,
          title: const Text('Investor'),
          centerTitle: true,
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          child: Wrap(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: height * 0.15,
                      width: width,
                      child: Obx(
                        () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.selectedImagePaths.length +
                                1, // Increase itemCount by 1
                            itemBuilder: (context, index) {
                              // Check if the current index is 0
                              if (index == 0) {
                                // Return the Container for adding a new picture
                                return Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: width * 0.3,
                                  height: height * 0.15,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.getImage(ImageSource.gallery);
                                    },
                                    child: const Center(
                                      child: Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ).marginOnly(left: width * 0.03);
                              } else {
                                // Adjust the index to account for the first item
                                final imagePath =
                                    controller.selectedImagePaths[index - 1];
                                return Stack(
                                  children: [
                                    Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                    spreadRadius: 0.5,
                                                    blurRadius: 2,
                                                    color:
                                                        ThemesStyles.secondary,
                                                    offset: Offset(5, -6))
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            width: width * 0.3,
                                            height: height,
                                            child: Image.file(File(imagePath),
                                                fit: BoxFit.fill))
                                        .marginOnly(left: width * 0.03),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: ThemesStyles.secondary,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: IconButton(
                                          icon: const Icon(Icons.delete,
                                              color: Colors.red),
                                          onPressed: () =>
                                              controller.removeImage(imagePath),
                                        ),
                                      ),
                                    )
                                  ],
                                ).marginOnly(left: width * 0.05);
                              }
                            }),
                      ).marginSymmetric(horizontal: width * 0.01),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Hall Name",
                    style: TextStyle(
                        color: ThemesStyles.textColor,
                        fontWeight: ThemesStyles.fontWeightBold,
                        fontSize: ThemesStyles.mainFontSize),
                  ).marginSymmetric(
                      horizontal: width * 0.03, vertical: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: width / 2.3,
                        child: DefaultFormFeild(
                          autoFoucs: false,
                          hintText: "الاسم باللغة العربية",
                          validator: (String? value) {
                            if (value == '') {
                              return "this field is required";
                            }
                            return null;
                          },
                          textEditingController: d,
                          obscureText: false,
                        ),
                      ),
                      Container(
                        width: width / 2.3,
                        child: DefaultFormFeild(
                          autoFoucs: false,
                          hintText: "Name in English",
                          validator: (String? value) {
                            if (value == '') {
                              return "this field is required";
                            }
                            return null;
                          },
                          textEditingController: d,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Capcity",
                    style: TextStyle(
                        color: ThemesStyles.textColor,
                        fontWeight: ThemesStyles.fontWeightBold,
                        fontSize: ThemesStyles.mainFontSize),
                  ).marginSymmetric(
                      horizontal: width * 0.03, vertical: height * 0.01),
                  Container(
                    width: width / 2.3,
                    child: DefaultFormFeild(
                      autoFoucs: false,
                      hintText: "السعة",
                      validator: (String? value) {
                        if (value == '') {
                          return "this field is required";
                        }
                        return null;
                      },
                      textEditingController: d,
                      obscureText: false,
                    ),
                  ).marginSymmetric(horizontal: width * 0.03),
                  Text(
                    "Services",
                    style: TextStyle(
                        color: ThemesStyles.textColor,
                        fontWeight: ThemesStyles.fontWeightBold,
                        fontSize: ThemesStyles.mainFontSize),
                  ).marginSymmetric(
                      horizontal: width * 0.03, vertical: height * 0.01),
                  Container(
                    width: width,
                    height: height / 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ThemesStyles.secondary)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                              border: Border.all(color: ThemesStyles.secondary),
                              borderRadius: BorderRadius.circular(20)),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style:
                                const TextStyle(color: ThemesStyles.secondary),
                            onChanged: (value) {},
                            items: dropdownItems
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ).marginSymmetric(
                            horizontal: width * 0.02, vertical: height * 0.01),
                        // Your existing widgets...
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: width / 2.5,
                              child: DefaultFormFeild(
                                autoFoucs: false,
                                hintText: "Price",
                                validator: (String? value) {
                                  if (value == '') {
                                    return "this field is required";
                                  }
                                  return null;
                                },
                                textEditingController: d,
                                obscureText: false,
                              ),
                            ),
                            Container(
                              width: width / 2.5,
                              child: DefaultFormFeild(
                                autoFoucs: false,
                                hintText: "Proportion",
                                validator: (String? value) {
                                  if (value == '') {
                                    return "this field is required";
                                  }
                                  return null;
                                },
                                textEditingController: d,
                                obscureText: false,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: width / 2.5,
                              child: Center(
                                child: InkWell(
                                  child: Text(
                                    "Request a services",
                                    style: TextStyle(
                                        color: ThemesStyles.primary,
                                        fontSize: ThemesStyles.littelFontSize,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: ThemesStyles.primary),
                                  ),
                                ),
                              ),
                            ),
                            CuButton(
                              text: "ADD",
                              containerColor: ThemesStyles.secondary,
                              height: 50,
                              width: width / 2.5,
                              textColor: Colors.white,
                            ),
                          ],
                        ).marginOnly(top: height * 0.01)
                      ],
                    ).marginOnly(top: height * 0.01),
                  ).marginSymmetric(horizontal: width * 0.02),
                  Container(
                          width: width / 2.4,
                          height: height / 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ThemesStyles.secondary),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("AnyThing",
                                      style: TextStyle(
                                          color: ThemesStyles.textColor,
                                          fontSize: ThemesStyles.littelFontSize,
                                          fontWeight: FontWeight.normal)),
                                  Text(
                                    " : Services",
                                    style: TextStyle(
                                        color: ThemesStyles.textColor,
                                        fontSize: ThemesStyles.mainFontSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("AnyThing",
                                      style: TextStyle(
                                          color: ThemesStyles.textColor,
                                          fontSize: ThemesStyles.littelFontSize,
                                          fontWeight: FontWeight.normal)),
                                  Text(
                                    " : Propotion",
                                    style: TextStyle(
                                        color: ThemesStyles.textColor,
                                        fontSize: ThemesStyles.mainFontSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("AnyThing",
                                      style: TextStyle(
                                          color: ThemesStyles.textColor,
                                          fontSize: ThemesStyles.littelFontSize,
                                          fontWeight: FontWeight.normal)),
                                  Text(
                                    " : Price",
                                    style: TextStyle(
                                        color: ThemesStyles.textColor,
                                        fontSize: ThemesStyles.mainFontSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ).marginOnly(top: height * 0.03))
                      .marginSymmetric(
                          horizontal: width * 0.02, vertical: height * 0.01),
                ],
              ).marginOnly(top: height * 0.01)
            ],
          ).marginSymmetric(horizontal: width * 0.03, vertical: height * 0.04),
        ));
  }
}

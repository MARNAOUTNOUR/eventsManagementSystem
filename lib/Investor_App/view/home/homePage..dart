import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:events_app/Investor_App/view/lounges/addLoungesPage..dart';
import 'package:events_app/common/core/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    List<String> halls = [];
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemesStyles.secondary,
        title: const Text('Investor'),
        centerTitle: true,
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.white,
      //   color: ThemesStyles.secondary,
      //   items: const [
      //     CurvedNavigationBarItem(
      //       child: Icon(
      //         Icons.search,
      //         size: 25,
      //         color: ThemesStyles.primary,
      //       ),
      //     ),
      //     CurvedNavigationBarItem(
      //       child: Icon(
      //         Icons.perm_identity,
      //         size: 25,
      //         color: ThemesStyles.primary,
      //       ),
      //     ),
      //     CurvedNavigationBarItem(
      //       child: Icon(
      //         Icons.punch_clock,
      //         size: 25,
      //         color: ThemesStyles.primary,
      //       ),
      //     ),
      //     CurvedNavigationBarItem(
      //       child: Icon(
      //         Icons.home_outlined,
      //         size: 25,
      //         color: ThemesStyles.primary,
      //       ),
      //     ),
      //   ],
      // ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddLoungesPage());
        },
        child: const Icon(
          Icons.add,
          size: 25,
          color: ThemesStyles.primary,
        ),
      ).marginOnly(bottom: height * 0.02),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: halls.isEmpty
          ? Center(
              child: Opacity(
                opacity: 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(
                          'assets/images/logo2_400x400-removebg-preview.png'),
                      width: width * 0.5,
                      height: height * 0.4,
                    ),
                    Text(
                      'Theres no lounges to show',
                      style: TextStyle(
                          fontSize: ThemesStyles.mainFontSize,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: halls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(halls[index]),
                );
              },
            ),
    );
  }
}

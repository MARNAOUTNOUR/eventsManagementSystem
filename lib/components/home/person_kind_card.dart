// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_app/core/constants/theme.dart';
import 'package:flutter/material.dart';

class PersonKindCard extends StatelessWidget {
  const PersonKindCard({
    Key? key,
    required this.image,
    required this.width,
    required this.content,
  }) : super(key: key);
  final String image;
  final double width;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(ThemesStyles.borderradiusprimary)),
          image: DecorationImage(
            image: AssetImage(
                image), // Replace 'background_image.jpg' with your image path
            fit: BoxFit
                .cover, // You can change the BoxFit according to your requirement

            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                  0.5), // Adjust opacity here (0.5 means 50% opacity)
              BlendMode.darken, // Adjust blend mode if necessary
            ),
          ),
        ),
        child: Center(
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

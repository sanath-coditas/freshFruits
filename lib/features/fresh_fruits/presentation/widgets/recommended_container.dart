import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/color_constants.dart';

class RecommendedContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  const RecommendedContainer(
      {super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(imagePath),
        Positioned(
          top: 80,
          bottom: 0,
          left: 20,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 22,
                  color: ColorConstants.whiteColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

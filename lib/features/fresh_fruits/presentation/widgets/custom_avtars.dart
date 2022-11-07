import 'package:flutter/material.dart';

class CustomAvatars extends StatelessWidget {
  const CustomAvatars({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      color: Colors.white,
      child: Stack(
        children: const [
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                    'assets/images/oranges.png'), // Provide your custom image
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 20,

                backgroundImage: AssetImage(
                    'assets/images/popper.png'), // Provide your custom image
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                    'assets/images/fruits.png'), // Provide your custom image
              ),
            ),
          ),
        ],
      ),
    );
  }
}

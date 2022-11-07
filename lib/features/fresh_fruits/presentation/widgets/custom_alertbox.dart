import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/button_styles.dart';

import '../../../../constants/text_constants.dart';
import '../../../../constants/text_styles.dart';
import '../screens/authentication_screens/signin_screen.dart';

class CustomAlertBox extends StatelessWidget {
  final String name;
  const CustomAlertBox({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        content: Stack(
          children: [
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/popper.png')),
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              top: 40,
              bottom: 10,
              child: Text(
                TextConstants.congratulationsText,
                textAlign: TextAlign.center,
                style: TextStyles.congoTextStyle,
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              top: 100,
              bottom: 10,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyles.nameTextStyle,
              ),
            ),
            Positioned(
              left: 24,
              right: 24,
              top: 400,
              bottom: 20,
              child: ElevatedButton(
                  style: ButtonStyles.appButtonStyle,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ));
                  },
                  child: Text(
                    TextConstants.signInText,
                    style: TextStyles.createAnAccountStyle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

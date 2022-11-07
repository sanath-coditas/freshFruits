import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/authentication_screens/signin_screen.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/authentication_screens/signup_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.appBackgroundcolor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
            onPressed: () {
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: ColorConstants.orangeColor,
              size: 30,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset('assets/images/screenImage3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30, right: 30),
            child: Text(
              TextConstants.fastAndResponsibleText,
              style: TextStyles.mainHeadingStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0, right: 60, top: 25),
            child: Text(
              TextConstants.randomText,
              style: TextStyles.randomTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(
                  dotWidth: 28,
                  dotHeight: 7,
                  activeDotColor: ColorConstants.activeDotColor,
                  dotColor: ColorConstants.inactiveDotColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorConstants.blackColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 24),
                    child: Text(TextConstants.createAccount,
                        style: TextStyles.createAccountTextStyle),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 30, right: 30),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 60)),
                      side: MaterialStateProperty.all<BorderSide>(
                          const BorderSide(width: 2.0)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          ColorConstants.appBackgroundcolor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      )),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ));
                    },
                    child: Text(TextConstants.loginText,
                        style: TextStyles.loginTextStyle),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/button_styles.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.appBackgroundcolor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Icon(
            Icons.arrow_back_outlined,
            color: ColorConstants.orangeColor,
            size: 30,
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
            padding: const EdgeInsets.only(top: 160.0),
            child: SvgPicture.asset('assets/images/screenImage1.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Text(
              TextConstants.welcomeText,
              style: TextStyles.mainHeadingStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              TextConstants.groceryApplication,
              style: TextStyles.subHeadingStyle,
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
            child: ElevatedButton(
              style: ButtonStyles.appButtonStyle,
              onPressed: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                child: Text(
                  TextConstants.nextText,
                  style: TextStyles.subHeadingStyle,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

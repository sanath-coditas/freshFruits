import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/button_styles.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: ColorConstants.appBackgroundcolor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            onPressed: () => pageController.animateToPage(0,
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn),
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
          Image.asset(
            'assets/images/screenImage2.png',
            height: MediaQuery.of(context).size.height / 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              TextConstants.weProvideQualityFoodText,
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
            padding: const EdgeInsets.only(top: 60.0),
            child: ElevatedButton(
              style: ButtonStyles.appButtonStyle,
              onPressed: () {
                pageController.animateToPage(2,
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

import 'package:flutter/material.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/onboarding_screens/onboardingscreen1.dart';
import 'onboarding_screens/onboardingscreen2.dart';
import 'onboarding_screens/onboardingscreen3.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      OnboardingScreen1(
        pageController: controller,
      ),
      OnboardingScreen2(
        pageController: controller,
      ),
      OnboardingScreen3(
        pageController: controller,
      ),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (_, index) {
                  return screens[index % screens.length];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

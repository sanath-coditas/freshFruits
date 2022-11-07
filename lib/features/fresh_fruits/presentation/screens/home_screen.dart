import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/constants/button_styles.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/categories_screen.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/deals_screen.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/bottom_navbar.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/recommended_container.dart';
import '../../../../constants/asset_images.dart';

class HomeScreen extends StatelessWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 8,
        actions: const [
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Icon(
              Icons.notifications_sharp,
              size: 35,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: ColorConstants.whiteColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TextConstants.goodMorningText),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                userName,
                style: TextStyles.mainHeadingStyle,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: RecommendedContainer(
                      imagePath: 'assets/images/recommended1.png',
                      text: 'Recommended Recipe Today',
                    ),
                  ),
                  RecommendedContainer(
                    imagePath: 'assets/images/recommended2.png',
                    text: 'Fresh Fruits Delivery',
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TextConstants.categoriesText,
                    style: TextStyles.mainHeadingStyle,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CategoriesScreen(),
                        ));
                      },
                      icon: const Icon(
                        Icons.arrow_forward_outlined,
                        size: 35,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 8),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width / 4.2,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    color: Colors.black38,
                                    offset: Offset(1, 0))
                              ],
                              color: ColorConstants.whiteColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: SvgPicture.asset(
                            AssetImages.categoryImages[index],
                            fit: BoxFit.contain,
                          )),
                    );
                  },
                  itemCount: AssetImages.categoryImages.length,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TextConstants.trendingDealsText,
                    style: TextStyles.mainHeadingStyle,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_outlined,
                        size: 35,
                      ))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      SizedBox(
                        width: 170,
                        child: AssetImages.trendingImages[0],
                      ),
                      SizedBox(
                        width: 170,
                        child: AssetImages.trendingImages[1],
                      ),
                      SizedBox(
                        width: 170,
                        child: AssetImages.trendingImages[2],
                      ),
                      SizedBox(
                        width: 170,
                        child: AssetImages.trendingImages[3],
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30),
              child: ElevatedButton(
                style: ButtonStyles.appButtonStyleWithColorBlack,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DealsScreen(),
                  ));
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 24),
                  child: Text(TextConstants.moreText,
                      style: TextStyles.createAccountTextStyle),
                ),
              ),
            ),
            const BottomNavBar()
          ],
        ),
      ),
    );
  }
}

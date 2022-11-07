import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/constants/asset_images.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/bottom_navbar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextConstants.categoriesText,
          style: TextStyles.mainHeadingStyle,
        ),
        backgroundColor: ColorConstants.appBackgroundcolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Container(
                  padding: const EdgeInsets.all(30),
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
    );
  }
}

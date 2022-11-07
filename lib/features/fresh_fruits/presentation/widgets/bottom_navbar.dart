import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/color_constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        backgroundColor: ColorConstants.whiteColor,
        selectedItemColor: ColorConstants.orangeColor,
        unselectedItemColor: ColorConstants.bottomNavbarItemColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.compare_arrows_outlined,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 40,
              ),
              label: '')
        ]);
  }
}

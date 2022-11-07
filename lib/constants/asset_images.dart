import 'package:flutter/material.dart';

abstract class AssetImages {
  static List<String> categoryImages = const [
    'assets/images/categories_images/Vector1.svg',
    'assets/images/categories_images/Vector3.svg',
    'assets/images/categories_images/Vector2.svg',
    'assets/images/categories_images/Vector4.svg',
    'assets/images/categories_images/Vector5.svg',
    'assets/images/categories_images/Vector6.svg',
    'assets/images/categories_images/Vector7.svg',
    'assets/images/categories_images/Vector7.svg',
  ];

  static List<Widget> trendingImages = [
    GestureDetector(
      child: Image.asset(
        'assets/images/trending_images/placeholder1.png',
        fit: BoxFit.fill,
      ),
    ),
    Image.asset('assets/images/trending_images/placeholder2.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder3.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder4.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder1.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder2.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder3.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder4.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder1.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder2.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder3.png',
        fit: BoxFit.fill),
    Image.asset('assets/images/trending_images/placeholder4.png',
        fit: BoxFit.fill),
  ];
}

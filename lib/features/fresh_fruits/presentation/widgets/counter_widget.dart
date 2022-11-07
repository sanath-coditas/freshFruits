import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/color_constants.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: ColorConstants.counterButtonColor,
          borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16, right: 10),
            child: Icon(
              Icons.minimize,
              size: 30,
              color: ColorConstants.lightYellowColor,
            ),
          ),
          const Text(
            '3',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.add,
              size: 30,
              color: ColorConstants.lightYellowColor,
            ),
          ),
        ],
      ),
    );
  }
}

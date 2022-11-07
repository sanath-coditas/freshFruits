import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Image.asset(
            'assets/images/fruits.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.5,
            left: 0,
            right: 0,
            child: SignUpForm(
                formKey: _formKey,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                emailController: emailController,
                passwordController: passwordController),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: ColorConstants.whiteColor,
                  size: 40,
                )),
          )
        ],
      ),
    );
  }
}

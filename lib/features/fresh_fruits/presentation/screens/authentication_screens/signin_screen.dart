import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants/button_styles.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/sign_in_usecase.dart';

import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/home_screen.dart';

import '../../blocs/sign_in_bloc/sign_in_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: Container(
            height: MediaQuery.of(context).size.height,
          )),
          Positioned(
              child: Image.asset(
            'assets/images/signInImage.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          )),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.1,
            left: 0,
            right: 0,
            child: Form(
              key: formKey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: ColorConstants.whiteColor,
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(30), right: Radius.circular(30))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40.0, horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            TextConstants.signinText,
                            style: TextStyles.poppinsW600S20,
                          ),
                          GestureDetector(
                            onTap: () {
                              formKey.currentState!.reset();
                              BlocProvider.of<SignInBloc>(context)
                                  .add(ResetSignInEvent());
                            },
                            child: CircleAvatar(
                                radius: 15,
                                backgroundColor: ColorConstants.blackColor,
                                child: Icon(
                                  Icons.close_rounded,
                                  color: ColorConstants.whiteColor,
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !EmailValidator.validate(value)) {
                            return 'Invalid Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (pwd) {
                          if (pwd == null || pwd.isEmpty) {
                            return 'Password should not be empty';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            suffixIcon:
                                const Icon(Icons.remove_red_eye_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 48.0, right: 48, bottom: 20),
                      child: Text(
                        TextConstants.forgotPasswordText,
                        textAlign: TextAlign.center,
                        style: TextStyles.forgotPasswordTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<SignInBloc, SignInState>(
                              builder: (context, state) {
                                if (state is LoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state is SignInErrorState) {
                                  return AlertDialog(
                                    scrollable: true,
                                    content: Text(state.message),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          BlocProvider.of<SignInBloc>(context)
                                              .add(ResetSignInEvent());
                                        },
                                      )
                                    ],
                                  );
                                }
                                if (state is SignInSuccessState) {
                                  return ElevatedButton(
                                      style: ButtonStyles.appButtonStyle,
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => HomeScreen(
                                              userName: state.userCredential
                                                  .user!.displayName!),
                                        ));
                                      },
                                      child: const Text('Continue'));
                                }
                                if (state is SignInInitial) {
                                  return ElevatedButton(
                                    style: ButtonStyles.appButtonStyle,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        BlocProvider.of<SignInBloc>(context)
                                            .add(SignnInUserEvent(
                                                signInParams: SignInParams(
                                                    email: emailController.text,
                                                    password: passwordController
                                                        .text)));
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Text(
                                        TextConstants.signInText,
                                        style: TextStyles.createAnAccountStyle,
                                      ),
                                    ),
                                  );
                                }
                                return Container();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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

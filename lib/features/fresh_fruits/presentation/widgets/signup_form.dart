import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants/button_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/person_model.dart';

import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/custom_alertbox.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/text_constants.dart';
import '../../../../constants/text_styles.dart';
import '../blocs/authentication_bloc/authentication_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      decoration: BoxDecoration(
          color: ColorConstants.whiteColor,
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(30), right: Radius.circular(30))),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TextConstants.createYourAccountText,
                      style: TextStyles.poppinsW600S20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _formKey.currentState!.reset();
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
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter first name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter last name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  )),
                ],
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                child: TextFormField(
                  controller: passwordController,
                  validator: (pwd) {
                    if (pwd == null || pwd.isEmpty || pwd.length < 8) {
                      return 'Password should be atleast 8 characters long';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 48.0, right: 48, bottom: 20),
                child: Text(
                  TextConstants.termsANdConditionsText,
                  textAlign: TextAlign.center,
                  style: TextStyles.poppinsW500S14,
                ),
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {

                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AuthErrorState) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AlertDialog(
                        scrollable: true,
                        content: Text(state.message),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context)
                                  .add(AuthenticationResetEvent());
                            },
                          )
                        ],
                      ),
                    );
                  } else if (state is AuthenticatioinSuccessfulState) {
                    Future.delayed(Duration.zero, () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CustomAlertBox(
                            name:
                                '${firstNameController.text} ${lastNameController.text}',
                          );
                        },
                      );
                    });
                  } else {
                    return ElevatedButton(
                        style: ButtonStyles.appButtonStyle,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(AuthenticateUser(
                                    person: PersonModel(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            )));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 72.0, right: 72.0, top: 24, bottom: 24),
                          child: Text(
                            TextConstants.createAnAccountText,
                            style: TextStyles.createAnAccountStyle,
                          ),
                        ));
                  }
                  return Container();
                },
              ),
              const SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

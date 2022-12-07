// ignore_for_file: avoid_print

import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning/src/core/utils/color_manager.dart';
import 'package:learning/src/core/utils/navigation_manager.dart';
import 'package:learning/src/core/utils/values_manager.dart';
import 'package:learning/src/modules/authentication/presentation_layer/components/components.dart';
import 'package:learning/src/modules/courses/presentation_layer/screens/main_screen.dart';
import 'package:sign_button/sign_button.dart';

import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final double height = QueryValues.height(context);
    final double width = QueryValues.width(context);
    return SafeArea(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessfulAuthState) {
            NavigationManager.pushAndRemove(state.context, MainScreen());
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .051),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: QueryValues.height(context) * .09),
                  SizedBox(height: QueryValues.height(context) * .037),
                  Text(
                    'Let\'s get started',
                    style: TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(
                    height: QueryValues.height(context) * .006,
                  ),
                  Text(
                    'Create new account to get all features',
                    style: TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: QueryValues.height(context) * .037),
                  defaultFormField(
                    prefix: Icons.person,
                    label: 'Name',
                    controller: nameController,
                    validatorText: "Please enter your name",
                  ),
                  SizedBox(
                    height: QueryValues.height(context) * .037,
                  ),
                  defaultFormField(
                    prefix: Icons.email,
                    label: 'Email',
                    controller: emailController,
                    validatorText: "Please enter your email",
                  ),
                  SizedBox(
                    height: QueryValues.height(context) * .037,
                  ),
                  defaultFormField(
                      prefix: Icons.lock,
                      label: 'Password',
                      suffix: AuthBloc.get(context).currentSuffix,
                      validatorText: "Please enter password",
                      type: AuthBloc.get(context).type,
                      obscureText: AuthBloc.get(context).currentVisibility,
                      controller: passController,
                      suffixFunction: () {
                        AuthBloc.get(context).add(ChangeVisibilityEvent(
                            AuthBloc.get(context).currentVisibility));
                      }),
                  SizedBox(height: QueryValues.height(context) * .037),
                  defaultFormField(
                      prefix: Icons.lock,
                      label: 'Confirm Password',
                      suffix: AuthBloc.get(context).currentSuffix,
                      validatorText: "Please confirm password",
                      controller: confirmPassController,
                      type: AuthBloc.get(context).type,
                      obscureText: AuthBloc.get(context).currentVisibility,
                      suffixFunction: () {
                        AuthBloc.get(context).add(ChangeVisibilityEvent(
                            AuthBloc.get(context).currentVisibility));
                      }),
                  SizedBox(
                    height: height * .055,
                  ),
                  state is RegisterLoadingAuthState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(20)),
                          child: MaterialButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate() == true) {
                                if (passController.text ==
                                    confirmPassController.text) {
                                  if (passController.text.length >= 6) {
                                    AuthBloc.get(context).add(RegisterEvent(
                                        email: emailController.text,
                                        password: passController.text,
                                        name: nameController.text,
                                        context: context));
                                  } else {
                                    defaultToast(
                                        msg:
                                            'Password should be at least 6 characters');
                                  }
                                } else {
                                  defaultToast(msg: 'Passwords don\'t match');
                                }
                              }
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: ColorManager.white),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: QueryValues.height(context) * .050,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton.mini(
                          buttonType: ButtonType.google,
                          buttonSize: ButtonSize.small,
                          onPressed: () {
                            print('click');
                          }),
                      SignInButton.mini(
                          buttonType: ButtonType.facebook,
                          buttonSize: ButtonSize.small,
                          onPressed: () {
                            print(width);
                            print('click');
                          }),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

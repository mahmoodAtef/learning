import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/core/utils/color_manager.dart';
import 'package:learning/src/core/utils/navigation_manager.dart';
import 'package:learning/src/modules/authentication/presentation_layer/components/components.dart';
import 'package:sign_button/sign_button.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../courses/presentation_layer/screens/main_screen.dart';
import '../bloc/auth_bloc.dart';
import 'forget_password.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = QueryValues.height(context);
    final double width = QueryValues.width(context);
    return BlocProvider(
      create: (context) => AuthBloc(AuthInitial()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessfulAuthState) {
            NavigationManager.pushAndRemove(state.context, MainScreen());
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .051), // width * .051),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * .09),
                    SizedBox(height: height * .037),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: ColorManager.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      height: height * .006,
                    ),
                    Text(
                      'Good to see you again',
                      style: TextStyle(
                        color: ColorManager.black,
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: height * .05),
                    defaultFormField(
                      prefix: Icons.email,
                      label: 'Email',
                      controller: emailController,
                      validatorText: "Please enter your email",
                    ),
                    SizedBox(height: height * .037),
                    defaultFormField(
                        prefix: Icons.lock,
                        label: 'Password',
                        suffix: AuthBloc.get(context).currentSuffix,
                        validatorText: "please enter password",
                        controller: passController,
                        type: AuthBloc.get(context).type,
                        obscureText: AuthBloc.get(context).currentVisibility,
                        suffixFunction: () {
                          AuthBloc.get(context).add(ChangeVisibilityEvent(
                              AuthBloc.get(context).currentVisibility));
                        }),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              NavigationManager.push(context, ForgetPassword());
                            },
                            child: Text(
                              'forgot password ?',
                              style: TextStyle(
                                color: ColorManager.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ))),
                    SizedBox(
                      height: height * .05,
                    ),
                    Column(
                      children: [
                        state is LoginLoadingAuthState
                            ? CircularProgressIndicator(
                                color: ColorManager.primary,
                              )
                            : Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius: BorderRadius.circular(20)),
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      AuthBloc.get(context).add(LoginEvent(
                                          email: emailController.text,
                                          password: passController.text,
                                          context: context));
                                    }
                                  },
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: ColorManager.white),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: height * .024,
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
                                  print('click');
                                }),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget login = Column();
Widget register = Column();

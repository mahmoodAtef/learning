import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/core/utils/navigation_manager.dart';
import 'package:learning/src/modules/courses/presentation_layer/components/courses_components.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/values_manager.dart';
import '../bloc/auth_bloc.dart';
import '../components/components.dart';

class ForgetPassword extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(AuthInitial()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final double height = QueryValues.height(context);
            final double width = QueryValues.width(context);
            //     print (width);
            return SafeArea(
              child: Scaffold(
                body: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * .05), // width * .051),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: height * .125,
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: IconButton(
                                    onPressed: () {
                                      NavigationManager.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back_ios),
                                  ),
                                )),
                            //SizedBox(height: height * .037),
                            Text(
                              'Forgot Password ?',
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
                              'Fill in your email address and check your email',
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
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print("forgetPassword from screen");
                                    AuthBloc.get(context).add(
                                        ForgetPasswordAuthEvent(
                                            email: emailController.text));
                                  }
                                },
                                child: Text(
                                  'Send Email',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: ColorManager.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

/*
    body: SafeArea(
                child:
              ),
 */

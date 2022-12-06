import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/core/utils/color_manager.dart';
import 'package:learning/src/modules/authentication/presentation_layer/bloc/auth_bloc.dart';
import '../../../../core/utils/values_manager.dart';

class MainAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthInitial()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final double height = QueryValues.height(context);
          final double width = QueryValues.width(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: ColorManager.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * .05,
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * .025),
                      child: AnimatedButtonBar(
                        radius: 20,
                        backgroundColor: ColorManager.grey2,
                        foregroundColor: ColorManager.primary,
                        elevation: 25,
                        borderColor: Colors.white,
                        borderWidth: 2.3,
                        innerVerticalPadding: 15,
                        children: [
                          ButtonBarEntry(
                            onTap: () {
                              AuthBloc.get(context).add(
                                  ChangeButtonAuthenticationEvent(index: 0));
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          ButtonBarEntry(
                            onTap: () {
                              AuthBloc.get(context).add(
                                  ChangeButtonAuthenticationEvent(index: 1));
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AuthBloc.get(context).currentPages,
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

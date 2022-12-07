//import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// //import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:learning/src/modules/authentication/domain_layer/repsitories/base_auth_repository.dart';
// import 'package:learning/src/modules/authentication/domain_layer/use_cases/login_with_email&pass_usecase.dart';
// import 'package:learning/src/modules/authentication/domain_layer/use_cases/register_with_email&pass_usecase.dart';
// import 'package:learning/src/modules/authentication/presentation_layer/screens/login.dart';
// import 'package:learning/src/modules/authentication/presentation_layer/screens/register.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning/src/core/utils/color_manager.dart';
import 'package:learning/src/modules/authentication/domain_layer/use_cases/login_with_email&pass_usecase.dart';
import 'package:learning/src/modules/authentication/domain_layer/use_cases/register_with_email&pass_usecase.dart';
import 'package:learning/src/modules/authentication/presentation_layer/components/components.dart';
import 'package:learning/src/modules/authentication/presentation_layer/screens/login.dart';
import 'package:learning/src/modules/authentication/presentation_layer/screens/register.dart';

import '../../../../core/services/dep_injection.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static AuthBloc get(BuildContext context) =>
      BlocProvider.of<AuthBloc>(context);
  List<Widget> pages = [
    LoginScreen(),
    RegisterScreen(),
  ];
  int currentIndex = 0;
  Widget currentPages = LoginScreen();

  /// change visibility
  bool currentVisibility = true;
  IconData currentSuffix = Icons.visibility;
  TextInputType type = TextInputType.visiblePassword;
  void changeVisibility() {
    currentVisibility = !currentVisibility;
    currentSuffix = currentVisibility ? Icons.visibility : Icons.visibility_off;
    type =
        currentVisibility ? TextInputType.text : TextInputType.visiblePassword;
  }

  AuthBloc(AuthInitial authInitial) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is ChangeButtonAuthenticationEvent) {
        currentPages = pages[event.index];
        currentIndex = event.index;
        emit(ChangeButtonAuthState(index: event.index));
      } else if (event is ShowToastEvent) {
        print(event.msg);
        emit(ShowToastState());
        Fluttertoast.showToast(
          msg: event.msg,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: ColorManager.primary,
          textColor: ColorManager.white,
        );
        emit(ShowToastState());
      } else if (event is ChangeVisibilityEvent) {
        changeVisibility();
        emit(ChangeVisibilityAuthState(isVisible: currentVisibility));
      } else if (event is LoginEvent) {
        emit(LoginLoadingAuthState());
        final     result = await LoginWithEmailAndPassUseCase(sl())
            .excute(
            email: event.email, password: event.password, );
        result.fold((l) {
         // print ("llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
          errorToast(msg: l.message!);
          emit (LoginErrorAuthState());
        }, (r)
        {
          defaultToast(msg: "Login Successfully");
          emit (LoginSuccessfulAuthState());
        });

      } else if (event is RegisterEvent)  {
        emit(RegisterLoadingAuthState());
        final     result = await RegisterWithEmailAndPassUseCase(sl())
            .excute(
            email: event.email, password: event.password, name: event.name);
        result.fold((l) {
          print ("llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");
          errorToast(msg: l.message!);
          emit (RegisterErrorAuthState());
        }, (r)
        {
          defaultToast(msg: "Login Successfully");
          emit (RegisterSuccessfulAuthState());
        });

      }
    });
  }
}
/*
 .then((value) {
            value.fold((l)
            {

            }, (r)
            {

            });
        });
 */
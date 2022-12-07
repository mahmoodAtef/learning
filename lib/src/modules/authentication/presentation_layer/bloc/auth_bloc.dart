import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/modules/authentication/domain_layer/use_cases/forget_password_usecase.dart';
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
      } else if (event is ChangeVisibilityEvent) {
        changeVisibility();
        emit(ChangeVisibilityAuthState(isVisible: currentVisibility));
      } else if (event is LoginEvent) {
        emit(LoginLoadingAuthState());
        final result = await LoginWithEmailAndPassUseCase(sl()).excute(
          email: event.email,
          password: event.password,
        );
        result.fold((l) {
          errorToast(msg: l.message!);
          emit(LoginErrorAuthState());
        }, (r) async {
          defaultToast(msg: "Login Successfully");
          // await    CacheHelper.saveData(key: 'uid', value: r!.user!.uid);
          emit(LoginSuccessfulAuthState(context: event.context));
        });
      } else if (event is RegisterEvent) {
        emit(RegisterLoadingAuthState());
        final result = await RegisterWithEmailAndPassUseCase(sl()).excute(
            email: event.email, password: event.password, name: event.name);
        result.fold((l) {
          errorToast(msg: l.message!);
          emit(RegisterErrorAuthState());
        }, (r) {
          defaultToast(msg: "Account Created Successfully");

          emit(RegisterSuccessfulAuthState(context: event.context));
        });
      } else if (event is ForgetPasswordAuthEvent) {
        final result = await ForgetPasswordUseCase(sl())
            .excute(email: event.email)
            .catchError((e) {
          print("forgetPassword from bloc error " + e.toString());
        });
        result.fold((l) {
          errorToast(msg: l.message!);
        }, (r) {
          defaultToast(msg: "Please Check Your Mail");
        });
      }
    });
  }
}

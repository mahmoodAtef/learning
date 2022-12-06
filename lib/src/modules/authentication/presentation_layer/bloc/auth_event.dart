part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class ChangeButtonAuthenticationEvent extends AuthEvent {
  final int index;

  ChangeButtonAuthenticationEvent({required this.index});
  @override
  List<Object?> get props => [index];
}

class ShowToastEvent extends AuthEvent {
  String msg;
  ShowToastEvent(this.msg);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginEvent extends AuthEvent {
  String email;
  String password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  String email;
  String password;
  String name;
  RegisterEvent(
      {required this.email, required this.password, required this.name});
  @override
  List<Object?> get props => [email, password];
}

class ChangeVisibilityEvent extends AuthEvent {
  bool isVisible;
  ChangeVisibilityEvent(this.isVisible);
  @override
  // TODO: implement props
  List<Object?> get props => [isVisible];
}

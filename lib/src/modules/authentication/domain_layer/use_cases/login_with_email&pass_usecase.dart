//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../repsitories/base_auth_repository.dart';

class LoginWithEmailAndPassUseCase {
  final BaseAuthRepository baseAuthRepository;

  LoginWithEmailAndPassUseCase(this.baseAuthRepository);
  excute({required String email, required String password}) async {
    return await baseAuthRepository.loginWithEmailAndPass(
        email: email, password: password);
  }
}

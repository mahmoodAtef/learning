//import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning/src/modules/authentication/domain_layer/repsitories/base_auth_repository.dart';

class RegisterWithEmailAndPassUseCase {
  final BaseAuthRepository baseAuthRepository;

  RegisterWithEmailAndPassUseCase(this.baseAuthRepository);
  Future excute(
      {required String email,
      required String password,
      required String name}) async {
    await baseAuthRepository.registerWithEmailAndPass(
        email: email, password: password, name: name);
  }
}

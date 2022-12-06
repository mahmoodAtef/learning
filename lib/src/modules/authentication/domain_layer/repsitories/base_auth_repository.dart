abstract class BaseAuthRepository {
  Future loginWithEmailAndPass(
      {required String email, required String password});
  Future registerWithEmailAndPass(
      {required String email, required String password, required String name});
  Future loginWithFaceBook();
  Future registerWithFaceBook();
  Future loginWithGmail();
  Future registerWithGmail();
}

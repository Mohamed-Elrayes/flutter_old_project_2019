import 'package:firebase_auth/firebase_auth.dart';
import '../data_providers/firebase/firebase_web_service.dart';

class AuthRepository {
  final FirebaseWebService _firebaseWebService;
  AuthRepository() : _firebaseWebService = FirebaseWebService();

  Future<void> loginWithCredentials(
          {required String email, required String password}) =>
      _firebaseWebService.loginWithCredentials(
          email: email, password: password);

  Future<void> signUp(
          {required String email, required String password}) async =>
      await _firebaseWebService.signUp(email: email, password: password);

  Future<void> signInWithGoogle() => _firebaseWebService.signInWithGoogle();

  Future<void> logOut() => _firebaseWebService.logOut();
  bool isSignedIn() => _firebaseWebService.isSignedIn();
  User? getUser() => _firebaseWebService.getUser();
}

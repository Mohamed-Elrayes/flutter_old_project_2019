
import 'auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;
  Future<void> initializeFirebase();
  Future<AuthUser> login({required String email, required String password});
  Future<AuthUser> createUser(
      {required String email, required String password});
  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> googleAuth();
}

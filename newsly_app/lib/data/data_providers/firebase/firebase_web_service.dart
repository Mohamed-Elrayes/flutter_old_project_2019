import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/constants/strings.dart';
import '../../error/exception_firebase_message.dart';


class FirebaseWebService with _FireAuth, _GoogleAuth {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseWebService([FirebaseAuth? firebaseAuth, GoogleSignIn? googleSignIn])
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }

  @override
  FirebaseAuth get firebaseAuth => _firebaseAuth;

  @override
  GoogleSignIn get googleSignIn => _googleSignIn;
}

mixin _FireAuth {
  FirebaseAuth get firebaseAuth;

  Future<void> loginWithCredentials(
      {required String email, required String password}) async {
    try {
      logger.i("data");
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseAuth.userChanges().listen((event) {
        logger.i(event);
      });
      // return data;
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (e) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  bool isSignedIn() {
    var currentUser = firebaseAuth.currentUser;
    return currentUser != null;
  }

  User? getUser() {
    var currentUser = firebaseAuth.currentUser;
    return currentUser;
  }

  Future<void> sendVerification(User? user) async {
    try {
      await user?.sendEmailVerification();
      firebaseAuth.userChanges().listen((event) {
        logger.i(event);
      });
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseAuth.userChanges().listen((event) {
        logger.i(event);
      });
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }
}

mixin _GoogleAuth {
  FirebaseAuth get firebaseAuth;
  GoogleSignIn get googleSignIn;

  Future<void> signInWithGoogle() async {
    try {
      await _callToSignWithGoogle();
      firebaseAuth.userChanges().listen((event) {
        logger.i(event);
      });
    } on FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  Future<void> _callToSignWithGoogle() async {
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await firebaseAuth.signInWithCredential(credential);
    firebaseAuth.userChanges().listen((event) {
      logger.i(event);
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  GoogleAuthService() {
    // _initialize();
  }

  // bool _initialized = false;

  // Future<void> _initialize() async {
  //   if (_initialized) return;

  //   await GoogleSignIn.instance.initialize(
  //     serverClientId: GoogleAuthConfig.serverClientId,
  //   );

  //   _initialized = true;
  // }

  Future<User?> signIn() async {
    try {
      // await _initialize();
      final GoogleSignInAccount account = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication auth = await account.authentication;

      final credential = GoogleAuthProvider.credential(idToken: auth.idToken);

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      final firebaseIdToken = await userCredential.user?.getIdToken();
      final user = userCredential.user;

      debugPrint("✅ Firebase ID Token: $firebaseIdToken");
      debugPrint("✅ User: $user");
      return user;
    } on GoogleSignInException catch (e) {
      debugPrint("Google Sign-In Error: ${e.code} - ${e.description}");
      rethrow;
    } catch (e) {
      debugPrint("Error signing in with Google: $e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      // إزالة الحساب من Google
      await GoogleSignIn.instance.signOut();

      debugPrint("✅ Signed out successfully");
    } catch (e) {
      debugPrint("Error signing out: $e");
    }
  }

  User? get currentUser => FirebaseAuth.instance.currentUser;

  bool get isSignedIn => FirebaseAuth.instance.currentUser != null;
}

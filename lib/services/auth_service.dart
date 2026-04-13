import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Admin email (hardcoded for MVP)
  static const String adminEmail = 'admin@atsify.com';

  /// Sign in with email and password
  static Future<User?> signIn(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  /// Sign out
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  /// Check if the current user is admin
  static bool isAdmin(User? user) {
    return user != null && user.email == adminEmail;
  }

  /// Get current user
  static User? get currentUser => _auth.currentUser;
}

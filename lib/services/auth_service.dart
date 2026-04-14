class MockUser {
  final String email;
  MockUser({required this.email});
}

class AuthService {
  static MockUser? _currentUser;

  /// Admin email (hardcoded for MVP)
  static const String adminEmail = 'admin@atsify.com';

  /// Sign in with email and password (mock)
  static Future<MockUser?> signIn(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Simple mock authentication
    if (email == adminEmail && password == 'admin123') {
      _currentUser = MockUser(email: email);
      return _currentUser;
    }
    throw Exception('Invalid credentials');
  }

  /// Sign out
  static Future<void> signOut() async {
    _currentUser = null;
  }

  /// Check if the current user is admin
  static bool isAdmin(MockUser? user) {
    return user != null && user.email == adminEmail;
  }

  /// Get current user
  static MockUser? get currentUser => _currentUser;
}


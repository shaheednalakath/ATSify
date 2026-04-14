import 'dart:async';
import '../models/resume_model.dart';

class FirestoreService {
  // Mock data storage
  static final List<Map<String, dynamic>> _mockUsers = [
    {
      'name': 'John Doe',
      'email': 'john@example.com',
      'phone': '1234567890',
      'summary': 'Experience software developer',
      'skills': ['Flutter', 'Dart', 'Firebase'],
      'updatedAt': DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      'name': 'Jane Smith',
      'email': 'jane@work.com',
      'phone': '9876543210',
      'summary': 'Creative UI/UX designer',
      'skills': ['Figma', 'Adobe XD', 'Sketch'],
      'updatedAt': DateTime.now().subtract(const Duration(hours: 5)),
    },
  ];

  static final List<Map<String, dynamic>> _mockTemplates = [
    {
      'id': 'temp_1',
      'name': 'Modern Clean',
      'category': 'Experienced',
      'sections': ['Summary', 'Experience', 'Education', 'Skills'],
      'createdAt': DateTime.now().subtract(const Duration(days: 10)),
    },
    {
      'id': 'temp_2',
      'name': 'Junior Classic',
      'category': 'Fresher',
      'sections': ['Summary', 'Education', 'Projects', 'Skills'],
      'createdAt': DateTime.now().subtract(const Duration(days: 2)),
    },
  ];

  static final StreamController<List<Map<String, dynamic>>> _usersController =
      StreamController<List<Map<String, dynamic>>>.broadcast();
  static final StreamController<List<Map<String, dynamic>>> _templatesController =
      StreamController<List<Map<String, dynamic>>>.broadcast();

  // =====================
  // USER RESUME DATA
  // =====================

  /// Save or update a user's resume data
  static Future<void> saveUserResume(ResumeModel data) async {
    final index = _mockUsers.indexWhere((u) => u['email'] == data.email);
    final userData = {
      'name': data.name,
      'email': data.email,
      'phone': data.phone,
      'summary': data.summary,
      'skills': data.skills,
      'updatedAt': DateTime.now(),
    };

    if (index != -1) {
      _mockUsers[index] = userData;
    } else {
      _mockUsers.add(userData);
    }
    _usersController.add(List.from(_mockUsers));
  }

  /// Get all users (mock stream)
  static Stream<List<Map<String, dynamic>>> getAllUsers() {
    // Return a stream that emits current data immediately
    Timer.run(() => _usersController.add(List.from(_mockUsers)));
    return _usersController.stream;
  }

  /// Get total user count
  static Future<int> getUserCount() async {
    return _mockUsers.length;
  }

  // =====================
  // TEMPLATE MANAGEMENT
  // =====================

  /// Add a new template
  static Future<void> addTemplate({
    required String name,
    required String category,
    required List<String> sections,
  }) async {
    _mockTemplates.add({
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'name': name,
      'category': category,
      'sections': sections,
      'createdAt': DateTime.now(),
    });
    _templatesController.add(List.from(_mockTemplates));
  }

  /// Delete a template
  static Future<void> deleteTemplate(String id) async {
    _mockTemplates.removeWhere((t) => t['id'] == id);
    _templatesController.add(List.from(_mockTemplates));
  }

  /// Get all templates (mock stream)
  static Stream<List<Map<String, dynamic>>> getTemplates() {
    Timer.run(() => _templatesController.add(List.from(_mockTemplates)));
    return _templatesController.stream;
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/resume_model.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  // =====================
  // USER RESUME DATA
  // =====================

  /// Save or update a user's resume data
  static Future<void> saveUserResume(ResumeModel data) async {
    await _db.collection('users').doc(data.email).set({
      'name': data.name,
      'email': data.email,
      'phone': data.phone,
      'summary': data.summary,
      'skills': data.skills,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Get all users (for admin dashboard)
  static Stream<QuerySnapshot> getAllUsers() {
    return _db.collection('users').orderBy('updatedAt', descending: true).snapshots();
  }

  /// Get total user count
  static Future<int> getUserCount() async {
    final snapshot = await _db.collection('users').count().get();
    return snapshot.count ?? 0;
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
    await _db.collection('templates').add({
      'name': name,
      'category': category,
      'sections': sections,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Delete a template
  static Future<void> deleteTemplate(String docId) async {
    await _db.collection('templates').doc(docId).delete();
  }

  /// Get all templates (stream for real-time updates)
  static Stream<QuerySnapshot> getTemplates() {
    return _db.collection('templates').orderBy('createdAt', descending: true).snapshots();
  }
}

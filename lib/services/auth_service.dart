import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> isSetupCompleted(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        final data = doc.data();
        return data != null && data['setupCompleted'] == true;
      }
      return false;
    } catch (e) {
      print('Firestore check error: $e');
      return false;
    }
  }
}

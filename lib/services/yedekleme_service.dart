import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YedeklemeService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> yedekleVerileri(Map<String, dynamic> veriler) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    try {
      await _firestore.collection('yedeklemeler').doc(uid).set({
        'data': veriler,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('✅ Veriler yedeklendi.');
    } catch (e) {
      print('❌ Yedekleme hatası: $e');
    }
  }

  Future<Map<String, dynamic>?> geriYukleVeriler() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    try {
      final snapshot =
          await _firestore.collection('yedeklemeler').doc(uid).get();
      if (snapshot.exists) {
        return snapshot.data()?['data'] as Map<String, dynamic>?;
      }
    } catch (e) {
      print('❌ Geri yükleme hatası: $e');
    }

    return null;
  }
}

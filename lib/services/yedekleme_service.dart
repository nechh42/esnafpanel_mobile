// lib/services/yedekleme/yedekleme_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YedeklemeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verileriYedekle(
    Map<String, dynamic> veri,
    String koleksiyonAdi,
  ) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final backupRef = _firestore
        .collection('yedekler')
        .doc(user.uid)
        .collection(koleksiyonAdi)
        .doc(DateTime.now().toIso8601String());

    await backupRef.set(veri);
  }

  Future<List<Map<String, dynamic>>> yedekleriListele(
    String koleksiyonAdi,
  ) async {
    final user = _auth.currentUser;
    if (user == null) return [];

    final snapshot =
        await _firestore
            .collection('yedekler')
            .doc(user.uid)
            .collection(koleksiyonAdi)
            .orderBy('timestamp', descending: true)
            .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> yedektenGeriYukle(String koleksiyonAdi, String docId) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final yedekDoc =
        await _firestore
            .collection('yedekler')
            .doc(user.uid)
            .collection(koleksiyonAdi)
            .doc(docId)
            .get();

    if (yedekDoc.exists) {
      final veri = yedekDoc.data();
      if (veri != null) {
        await _firestore.collection(koleksiyonAdi).add(veri);
      }
    }
  }
}

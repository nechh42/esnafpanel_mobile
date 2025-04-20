import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YedeklemeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Verileri Firestore'a yedekler
  Future<void> yedekleVeri(
    String koleksiyonAdi,
    Map<String, dynamic> veri,
  ) async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) throw Exception("Kullanıcı bulunamadı");

      await _firestore
          .collection('yedekler')
          .doc(uid)
          .collection(koleksiyonAdi)
          .add(veri);

      print("Veri yedeklendi: $veri");
    } catch (e) {
      print("Yedekleme hatası: $e");
    }
  }

  /// Firestore'dan yedekleri geri yükler
  Future<List<Map<String, dynamic>>> geriYukleVeri(String koleksiyonAdi) async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) throw Exception("Kullanıcı bulunamadı");

      final snapshot =
          await _firestore
              .collection('yedekler')
              .doc(uid)
              .collection(koleksiyonAdi)
              .get();

      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Geri yükleme hatası: $e");
      return [];
    }
  }

  /// Tüm yedekleri siler (opsiyonel)
  Future<void> yedekleriSil(String koleksiyonAdi) async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) throw Exception("Kullanıcı bulunamadı");

      final snapshot =
          await _firestore
              .collection('yedekler')
              .doc(uid)
              .collection(koleksiyonAdi)
              .get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      print("Yedekler silindi.");
    } catch (e) {
      print("Silme hatası: $e");
    }
  }
}

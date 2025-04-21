import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YedeklemeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> yedekAl() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return false;

      final userData =
          await _firestore
              .collection('businesses')
              .where('ownerId', isEqualTo: uid)
              .get();

      // Örnek olarak veriyi başka bir koleksiyona yedekliyoruz (yedek_businesses)
      for (var doc in userData.docs) {
        await _firestore
            .collection('yedek_businesses')
            .doc(doc.id)
            .set(doc.data());
      }

      return true;
    } catch (e) {
      print('Yedek alma hatası: $e');
      return false;
    }
  }

  Future<bool> yedekYukle() async {
    try {
      final uid = _auth.currentUser?.uid;
      if (uid == null) return false;

      final backupData =
          await _firestore
              .collection('yedek_businesses')
              .where('ownerId', isEqualTo: uid)
              .get();

      for (var doc in backupData.docs) {
        await _firestore.collection('businesses').doc(doc.id).set(doc.data());
      }

      return true;
    } catch (e) {
      print('Yedek geri yükleme hatası: $e');
      return false;
    }
  }
}

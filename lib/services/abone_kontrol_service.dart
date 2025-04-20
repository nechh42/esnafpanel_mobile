import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AboneKontrolService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Demo süresi gün cinsinden
  final int demoSuresi = 10;

  Future<bool> isAbonelikGecerli() async {
    final user = _auth.currentUser;
    if (user == null) return false;

    final docRef = _firestore.collection('users').doc(user.uid);
    final doc = await docRef.get();

    if (!doc.exists) return false;

    final data = doc.data();
    if (data == null) return false;

    final abonelik = data['abonelik'] ?? 'demo';
    final kayitTarihi = data['kayitTarihi']?.toDate() ?? DateTime.now();

    // Eğer abonelik "demo" ise ve demo süresi dolduysa false döner
    if (abonelik == 'demo') {
      final bugun = DateTime.now();
      final fark = bugun.difference(kayitTarihi).inDays;

      if (fark > demoSuresi) return false;
    }

    return true;
  }
}

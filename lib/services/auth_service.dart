import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/business_model.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createBusiness(String userId, BusinessModel business) async {
    try {
      final docRef = await _firestore
          .collection('businesses')
          .add(business.toMap());

      // Kullanıcının belgesine seçili işletme ID’sini kaydet:
      await _firestore.collection('users').doc(userId).update({
        'selectedBusinessId': docRef.id,
      });
    } catch (e) {
      throw Exception("İşletme oluşturulamadı: $e");
    }
  }
}

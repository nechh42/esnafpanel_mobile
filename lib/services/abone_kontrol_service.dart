// lib/services/abone_kontrol_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AboneKontrolService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> isDemoExpired() async {
    final user = _auth.currentUser;
    if (user == null) return false;

    final snapshot = await _firestore.collection('users').doc(user.uid).get();
    if (!snapshot.exists) return false;

    final data = snapshot.data();
    final Timestamp createdAt = data?['createdAt'];
    // No need to check for null as 'createdAt' is non-nullable

    final demoEndDate = createdAt.toDate().add(Duration(days: 10));
    return DateTime.now().isAfter(demoEndDate);
  }

  Future<String> getSubscriptionPlan() async {
    final user = _auth.currentUser;
    if (user == null) return 'demo';

    final snapshot = await _firestore.collection('users').doc(user.uid).get();
    if (!snapshot.exists) return 'demo';

    final data = snapshot.data();
    return data?['subscription'] ?? 'demo'; // 'starter', 'pro', or 'demo'
  }

  Future<void> redirectIfDemoExpired(Function onDemoExpired) async {
    bool expired = await isDemoExpired();
    String plan = await getSubscriptionPlan();

    if (expired && plan == 'demo') {
      onDemoExpired();
    }
  }
}

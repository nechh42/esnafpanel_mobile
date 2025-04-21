import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/business_model.dart';

class SubscriptionProvider with ChangeNotifier {
  bool _isSubscribed = false;
  String? _planType;

  bool get isSubscribed => _isSubscribed;
  String? get planType => _planType;

  Future<void> checkSubscriptionStatus(String userId) async {
    try {
      final doc =
          await FirebaseFirestore.instance
              .collection('subscriptions')
              .doc(userId)
              .get();

      if (doc.exists) {
        _isSubscribed = doc['isSubscribed'] ?? false;
        _planType = doc['planType'];
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Subscription check failed: $e");
    }
  }

  Future<void> updateSubscriptionStatus(
    String userId,
    bool status,
    String plan,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('subscriptions')
          .doc(userId)
          .set({
            'isSubscribed': status,
            'planType': plan,
            'timestamp': FieldValue.serverTimestamp(),
          });
      _isSubscribed = status;
      _planType = plan;
      notifyListeners();
    } catch (e) {
      debugPrint("Subscription update failed: $e");
    }
  }

  void clear() {
    _isSubscribed = false;
    _planType = null;
    notifyListeners();
  }
}

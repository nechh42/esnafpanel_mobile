import 'package:flutter/material.dart';

class SubscriptionProvider extends ChangeNotifier {
  String _currentPlan = 'demo'; // Varsayılan değer

  String get currentPlan => _currentPlan;

  void setPlan(String newPlan) {
    _currentPlan = newPlan;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class SubscriptionProvider extends ChangeNotifier {
  String _currentPlan = 'demo'; // varsayılan plan

  String get currentPlan => _currentPlan;

  void setPlan(String plan) {
    _currentPlan = plan;
    notifyListeners();
  }

  bool get isPro => _currentPlan == 'pro';
  bool get isStarter => _currentPlan == 'starter';
  bool get isDemo => _currentPlan == 'demo';
}

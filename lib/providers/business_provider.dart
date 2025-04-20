import 'package:flutter/material.dart';

class BusinessProvider with ChangeNotifier {
  String _businessName = '';
  String _businessType = '';
  String _address = '';
  String _email = '';
  String _phone = '';

  String get businessName => _businessName;
  String get businessType => _businessType;
  String get address => _address;
  String get email => _email;
  String get phone => _phone;

  void setBusinessInfo({
    required String name,
    required String type,
    required String address,
    required String email,
    required String phone,
  }) {
    _businessName = name;
    _businessType = type;
    _address = address;
    _email = email;
    _phone = phone;
    notifyListeners();
  }

  void clearBusinessInfo() {
    _businessName = '';
    _businessType = '';
    _address = '';
    _email = '';
    _phone = '';
    notifyListeners();
  }

  bool get isComplete =>
      _businessName.isNotEmpty &&
      _businessType.isNotEmpty &&
      _address.isNotEmpty &&
      _email.isNotEmpty &&
      _phone.isNotEmpty;
}

import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/models/business_model.dart';

class BusinessProvider with ChangeNotifier {
  List<BusinessModel> _businessList = [];
  BusinessModel? _selectedBusiness;
  String? _userName;

  List<BusinessModel> get businessList => _businessList;
  BusinessModel? get selectedBusiness => _selectedBusiness;
  String? get userName => _userName;

  void setBusinessList(List<BusinessModel> list) {
    _businessList = list;
    notifyListeners();
  }

  void selectBusiness(BusinessModel business) {
    _selectedBusiness = business;
    notifyListeners();
  }

  void selectBusinessByName(String name) {
    final business = _businessList.firstWhere(
      (b) => b.name == name,
      orElse: () => _businessList.first,
    );
    _selectedBusiness = business;
    notifyListeners();
  }

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void clearBusiness() {
    _selectedBusiness = null;
    notifyListeners();
  }
}

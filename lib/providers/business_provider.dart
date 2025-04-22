import 'package:flutter/material.dart';
import 'package:esnafpanel_mobile/models/business_model.dart';

class BusinessProvider extends ChangeNotifier {
  BusinessModel? _selectedBusiness;

  List<BusinessModel> _businessList = [
    BusinessModel(id: '1', name: 'Test İşletme 1', ownerName: 'Test Sahibi 1'),
    BusinessModel(id: '2', name: 'Test İşletme 2', ownerName: 'Test Sahibi 2'),
  ];

  List<BusinessModel> get businessList => _businessList;

  BusinessModel? get selectedBusiness => _selectedBusiness;

  void setBusiness(BusinessModel business) {
    _selectedBusiness = business;
    notifyListeners();
  }

  void updateBusiness(BusinessModel business) {
    final index = _businessList.indexWhere((b) => b.id == business.id);
    if (index != -1) {
      _businessList[index] = business;
      notifyListeners();
    }
  }
}

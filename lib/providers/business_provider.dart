import 'package:flutter/material.dart';
import '../models/business_model.dart';

class BusinessProvider with ChangeNotifier {
  BusinessModel? _selectedBusiness;

  BusinessModel? get selectedBusiness => _selectedBusiness;

  void setBusiness(BusinessModel business) {
    _selectedBusiness = business;
    notifyListeners();
  }

  void updateBusiness(BusinessModel updatedBusiness) {
    _selectedBusiness = updatedBusiness;
    notifyListeners();
  }
}

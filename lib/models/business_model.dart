// lib/models/business_model.dart

class BusinessModel {
  final String id;
  final String name;
  final String? address;
  final String? phone;
  final DateTime? createdAt;

  BusinessModel({
    required this.id,
    required this.name,
    this.address,
    this.phone,
    this.createdAt,
  });

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      address: map['address'],
      phone: map['phone'],
      createdAt: map['createdAt']?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'createdAt': createdAt,
    };
  }
}

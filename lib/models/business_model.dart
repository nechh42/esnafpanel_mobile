// lib/models/business_model.dart
class BusinessModel {
  final String id;
  final String name;
  final String ownerName;
  final bool isPopular;

  BusinessModel({
    required this.id,
    required this.name,
    required this.ownerName,
    this.isPopular = false,
  });

  factory BusinessModel.fromMap(Map<String, dynamic> data, String documentId) {
    return BusinessModel(
      id: documentId,
      name: data['name'] ?? '',
      ownerName: data['ownerName'] ?? '',
      isPopular: data['isPopular'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'ownerName': ownerName, 'isPopular': isPopular};
  }
}

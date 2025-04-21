class BusinessModel {
  final String id;
  final String name;
  final bool isPopular;
  final String? ownerName;

  BusinessModel({
    required this.id,
    required this.name,
    this.isPopular = false,
    this.ownerName,
  });

  factory BusinessModel.fromMap(Map<String, dynamic> data) {
    return BusinessModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      isPopular: data['isPopular'] ?? false,
      ownerName: data['ownerName'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isPopular': isPopular,
      'ownerName': ownerName,
    };
  }
}

import '../../domain/entities/property.dart';

class PropertyModel extends Property {
  PropertyModel({
    required super.id,
    required super.title,
    required super.description,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.price,
    required super.imageUrl,
  });

  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
      id: map['id'] as String? ?? '',
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
      address: map['address'] as String? ?? '',
      latitude: (map['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (map['longitude'] as num?)?.toDouble() ?? 0.0,
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: map['imageUrl'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}

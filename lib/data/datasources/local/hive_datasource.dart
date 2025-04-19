import 'package:hive_flutter/hive_flutter.dart';
import '../../models/property_model.dart';

abstract class HiveDataSource {
  Future<void> cacheProperties(List<PropertyModel> properties);
  List<PropertyModel> getCachedProperties();
}

class HiveDataSourceImpl implements HiveDataSource {
  final Box box;

  HiveDataSourceImpl({required this.box});

  @override
  Future<void> cacheProperties(List<PropertyModel> properties) async {
    await box.put('properties', properties.map((p) => p.toMap()).toList());
  }

  @override
  List<PropertyModel> getCachedProperties() {
    final cached = box.get('properties', defaultValue: []);
    return (cached as List).map((map) => PropertyModel.fromMap(map)).toList();
  }
}

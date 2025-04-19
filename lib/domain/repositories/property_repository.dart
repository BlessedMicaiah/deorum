import 'dart:async';
import '../entities/property.dart';

abstract class PropertyRepository {
  Future<void> createProperty(Property property);
  Stream<List<Property>> getProperties();
  Future<List<Property>> getCachedProperties();
}

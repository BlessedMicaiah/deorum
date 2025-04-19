import '../../domain/entities/property.dart';
import '../../domain/repositories/property_repository.dart';
import '../datasources/remote/firestore_datasource.dart';
import '../datasources/local/hive_datasource.dart';
import '../models/property_model.dart';

class PropertyRepositoryImpl implements PropertyRepository {
  final FirestoreDataSource remote;
  final HiveDataSource local;

  PropertyRepositoryImpl({required this.remote, required this.local});

  @override
  Future<void> createProperty(Property property) async {
    final model = PropertyModel(
      id: property.id,
      title: property.title,
      description: property.description,
      address: property.address,
      latitude: property.latitude,
      longitude: property.longitude,
      price: property.price,
      imageUrl: property.imageUrl,
    );
    await remote.createProperty(model);
    final cachedList = local.getCachedProperties();
    await local.cacheProperties([...cachedList, model]);
  }

  @override
  Stream<List<Property>> getProperties() {
    return remote.getProperties();
  }

  @override
  Future<List<Property>> getCachedProperties() async {
    return local.getCachedProperties();
  }
}

import '../entities/property.dart';
import '../repositories/property_repository.dart';

class CreatePropertyListing {
  final PropertyRepository repository;

  CreatePropertyListing(this.repository);

  Future<void> call(Property property) async {
    await repository.createProperty(property);
  }
}

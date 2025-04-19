import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/property_model.dart';

abstract class FirestoreDataSource {
  Future<void> createProperty(PropertyModel property);
  Stream<List<PropertyModel>> getProperties();
}

class FirestoreDataSourceImpl implements FirestoreDataSource {
  final FirebaseFirestore firestore;

  FirestoreDataSourceImpl({required this.firestore});

  @override
  Future<void> createProperty(PropertyModel property) async {
    await firestore.collection('properties').add(property.toMap());
  }

  @override
  Stream<List<PropertyModel>> getProperties() {
    return firestore.collection('properties').snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => PropertyModel.fromMap(doc.data()))
          .toList(),
    );
  }
}

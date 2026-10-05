import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commrece_app/core/services/network/fire_store_service.dart';

class FireStoreServiceImpl implements FireStoreService {
  final FirebaseFirestore _fireStore;

  FireStoreServiceImpl(this._fireStore);

  @override
  Future<void> setData({
    required String path,
    String? documentId,
    required Map<String, dynamic> data,
  }) async {
    if (documentId != null) {
      await _fireStore.collection(path).doc(documentId).set(data);
    } else {
      await _fireStore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    final result = await _fireStore.collection(path).doc(documentId).get();
    return result.data() as Map<String, dynamic>;
  }

  @override
  Future<List<Map<String, dynamic>>> getCollection({
    required String path,
  }) async {
    final result = await _fireStore.collection(path).get();
    return result.docs.map((docs) => docs.data()).toList();
  }

  @override
  Future<bool> checkIfData({
    required String path,
    required String documentId,
  }) async {
    final data = await _fireStore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<List<Map<String, dynamic>>> getDataWhere({
    required String path,
    required String field,
    required dynamic value,
  }) async {
    final result = await _fireStore
        .collection(path)
        .where(field, isEqualTo: value)
        .get();

    return result.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getProductQuery({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    Query<Map<String, dynamic>> data = await _fireStore.collection(path);
    if (query != null) {
      if (query['orderBy'] != null) {
        var orderByField = query['orderBy'];
        var descending = query['descending'];
        data = data.orderBy(orderByField, descending: descending);
      }
      if (query['limit'] != null) {
        var limit = query['limit'];
        data = data.limit(limit);
      }
    }
    final result = await data.get();
    return result.docs.map((docs) => docs.data()).toList();
  }
}

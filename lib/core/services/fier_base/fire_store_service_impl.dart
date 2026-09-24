import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commrece_app/core/services/fier_base/fire_store_service.dart';

class FireStoreServiceImpl implements FireStoreService {
  final FirebaseFirestore _fireStore;

  FireStoreServiceImpl(this._fireStore);

  @override
  Future<void> setData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _fireStore.collection(path).doc(documentId).set(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    final userData = await _fireStore.collection(path).doc(documentId).get();
    return userData.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkIfData({
    required String path,
    required String documentId,
  }) async {
    final data = await _fireStore.collection(path).doc(documentId).get();
    return data.exists;
  }
}

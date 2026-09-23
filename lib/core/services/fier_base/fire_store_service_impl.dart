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
}

abstract class FireStoreService {
  Future<void> setData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>?> getData({
    required String path,
    required String documentId,
  });

  Future<List<Map<String, dynamic>>> getCollection({required String path});

  Future<List<Map<String, dynamic>>> getProductQuery({
    required String path,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfData({required String path, required String documentId});

  Future<List<Map<String, dynamic>>> getDataWhere({
    required String path,
    required String field,
    required dynamic value,
  });
}

abstract class UserDataSource {
  Future<void> setData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });
}

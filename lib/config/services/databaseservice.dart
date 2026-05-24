import 'package:cloud_firestore/cloud_firestore.dart';

class Databasabaseservice {
  final FirebaseFirestore firestoreService;

  Databasabaseservice({required this.firestoreService});
  Future<Map<String, dynamic>?> getData({
    required String collectionPath,
    required String docId,
  }) async {
    final doc = await firestoreService
        .collection(collectionPath)
        .doc(docId)
        .get();
    return doc.data();
  }

  Future<void> setData({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await firestoreService.collection(collectionPath).doc(docId).set(data);
  }

  Future<void> updateData({
    required String collectionPath,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await firestoreService.collection(collectionPath).doc(docId).update(data);
  }

  Future<void> deleteData({
    required String collectionPath,
    required String docId,
  }) async {
    await firestoreService.collection(collectionPath).doc(docId).delete();
  }
}

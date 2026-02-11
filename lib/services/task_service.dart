import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';

class TaskService {
  static final _collection = FirebaseFirestore.instance.collection('tasks');

  static Future<List<Task>> getAll() async {
    final snapshot = await _collection.orderBy('id').get();
    return snapshot.docs.map((doc) => Task.fromMap(doc.data(), id: doc.id)).toList();
  }

  static Future<Task?> getById(String id) async {
    final doc = await _collection.doc(id).get();
    if (!doc.exists) return null;
    return Task.fromMap(doc.data()!, id: doc.id);
  }

  static Future<String> create(Task item) async {
    final doc = await _collection.add(item.toMap());
    return doc.id;
  }

  static Future<void> update(String id, Task item) async {
    await _collection.doc(id).update(item.toMap());
  }

  static Future<void> delete(String id) async {
    await _collection.doc(id).delete();
  }
}

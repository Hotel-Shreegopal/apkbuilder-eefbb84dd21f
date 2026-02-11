import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

class UserService {
  static final _collection = FirebaseFirestore.instance.collection('users');

  static Future<List<User>> getAll() async {
    final snapshot = await _collection.orderBy('id').get();
    return snapshot.docs.map((doc) => User.fromMap(doc.data(), id: doc.id)).toList();
  }

  static Future<User?> getById(String id) async {
    final doc = await _collection.doc(id).get();
    if (!doc.exists) return null;
    return User.fromMap(doc.data()!, id: doc.id);
  }

  static Future<String> create(User item) async {
    final doc = await _collection.add(item.toMap());
    return doc.id;
  }

  static Future<void> update(String id, User item) async {
    await _collection.doc(id).update(item.toMap());
  }

  static Future<void> delete(String id) async {
    await _collection.doc(id).delete();
  }
}

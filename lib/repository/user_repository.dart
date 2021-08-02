import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastarrow_app/domain/user.dart';
import 'package:logger/logger.dart';

class UserRepository {
  final _db = FirebaseFirestore.instance;
  final _collectionPath = 'users';

  Future<User> fetchUser(String userId) async {
    try {
      final snaps = await _db.collection(_collectionPath).doc(userId).get();

      return User.fromFirestore(snaps);
    } catch (e) {
      Logger().e(e.toString());
      rethrow;
    }
  }
}

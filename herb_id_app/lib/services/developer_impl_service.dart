import 'package:HerdID/model/developer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../common/firebase_constants.dart';
import 'developer._service.dart';

class DeveloperImplService implements DeveloperService {
  final db = FirebaseFirestore.instance;
  @override
  Future<List<Developer>> developersList() async {
    var q = db.collection(FirebaseConstants.plantsCollection);

    final result = await q.get().then((snap) =>
        snap.docs.map((doc) => Developer.fromJson(doc.data())).toList());

    return result;
  }
}

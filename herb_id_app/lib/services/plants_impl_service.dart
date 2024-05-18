import 'package:dartz/dartz.dart';
import 'package:HerdID/app/exception/app_exception.dart';
import 'package:HerdID/model/plants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:HerdID/services/plants_service.dart';

import '../common/firebase_constants.dart';

class PlantsImplService implements PlantsService {
  final db = FirebaseFirestore.instance;
  @override
  Future<List<Plants>> plantsList(String query) async {
    Query<Map<String, dynamic>> q =
        db.collection(FirebaseConstants.plantsCollection);

    final result = await q.get().then(
        (snap) => snap.docs.map((doc) => Plants.fromJson(doc.data())).toList());
    if (query.isNotEmpty) {
      return result
          .where((plants) =>
              plants.scientificName
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              plants.cure.any((cure) =>
                  cure.toLowerCase().contains(query.toLowerCase()) ||
                  plants.commonName
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  plants.familyName
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  plants.localName.toLowerCase().contains(query.toLowerCase())))
          .toList();
    }
    print(result);
    return result;
  }

  @override
  Future<Either<AppException, Plants>> getHerbalPlantsData(
      String plants) async {
    try {
      final querySnapshot = await db
          .collection(FirebaseConstants.plantsCollection)
          .where('predictionName', isEqualTo: plants)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> data = querySnapshot.docs.first.data();

        Plants plants = Plants.fromJson(data);
        return Right(plants);
      } else {
        return Left(AppException("Document not found"));
      }
    } catch (e) {
      return Left(AppException("Error fetching data from Firebase: $e"));
    }
  }

  @override
  Future<Either<AppException, None>> saveHerbalPlantsData(
      String predictionName,
      String localName,
      String scientificName,
      String description,
      String benefits,
      String procedure,
      String commonName,
      String familyName,
      List<String> illnessCure,
      List<String> credits) async {
    try {
      // Query for the document with the specified scientificName
      final querySnapshot = await db
          .collection(FirebaseConstants.plantsCollection)
          .where("predictionName", isEqualTo: predictionName)
          .get();

      // Check if the document exists
      if (querySnapshot.docs.isNotEmpty) {
        // Update the fields of the first document in the query result
        final documentId = querySnapshot.docs.first.id;
        await db
            .collection(FirebaseConstants.plantsCollection)
            .doc(documentId)
            .update({
          'scientificName': scientificName,
          'description': description,
          'procedure': procedure,
          'benefit': benefits,
          'cure': illnessCure,
          'commonName': commonName,
          'familyName': familyName,
          'localName': localName,
          'credits': credits,
        });

        return const Right(None());
      } else {
        // Document with the specified scientificName not found
        return Left(
            AppException("Document not found for scientificName: $commonName"));
      }
    } catch (e) {
      return Left(AppException("Error updating data in Firebase: $e"));
    }
  }

  @override
  Future<List<Plants>> predictionList(List otherPrediction) async {
    List<Plants> plants = [];

    List<String> otherPredictionStringList = otherPrediction
        .map((element) => element.toString())
        .toList();

    for (String prediction in otherPredictionStringList) {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
          .collection(FirebaseConstants.plantsCollection)
          .where("predictionName", isEqualTo: prediction)
          .get();

      querySnapshot.docs.forEach((doc) {
        plants.add(Plants.fromJson(doc.data()));
      });
    }
   
    return plants;
  }
}

import 'package:dartz/dartz.dart';
import '../app/exception/app_exception.dart';
import '../model/plants.dart';

abstract interface class PlantsService {
  Future<List<Plants>> plantsList(String query);
  Future<List<Plants>> predictionList(List otherPrediction);
  Future<Either<AppException, Plants>> getHerbalPlantsData(String plants);
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
      List<String> credits,);
}

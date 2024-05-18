import 'dart:convert';
import 'dart:io';
import 'package:HerdID/common/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:HerdID/exception/app_exception.dart';
import 'package:HerdID/services/image_service.dart';
import '../model/prediction.dart';

class ImageImplService implements ImageService {

 Future<Either<AppException, Prediction>> uploadPlant(File image) async {
  try {
    final url = Uri.parse(AppUrl.hostUrl);
    final request = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(file);

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> responseJson = jsonDecode(responseBody);

      final String prediction = responseJson['prediction'];
      final double accuracy = responseJson['confidence'];
      final List<dynamic> lowAccuracyPredictions = responseJson['all_predictions'];

      final List<String> otherPredictionList = [];
      final List<String> otherAccuracyList = [];

      for (var item in lowAccuracyPredictions) {
        final String predictionClass = item['class'];
        final double confidence = item['confidence'];

        if (confidence != 0.00) {
          otherPredictionList.add(predictionClass);
          otherAccuracyList.add(confidence.toString());
        }
        //  otherPredictionList.add(predictionClass);
        // otherAccuracyList.add(confidence.toString());
      }

      print(otherPredictionList.length);
      print(otherPredictionList);
      print(otherAccuracyList.length);

      return Right(Prediction(
        prediction: prediction,
        accuracy: accuracy.toString(),
        otherPrediction: otherPredictionList,
        otherAccuracy: otherAccuracyList,
      ));
    } else {
      throw Exception('Failed to upload image');
    }
  } catch (e) {
    rethrow;
  }
}

}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'prediction.freezed.dart';
part 'prediction.g.dart';

@Freezed()
class Prediction with _$Prediction {
  const factory Prediction({
    required String prediction,
    required String accuracy,
    required List otherPrediction,
    required List otherAccuracy,
  }) = _Prediction;

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionImpl _$$PredictionImplFromJson(Map<String, dynamic> json) =>
    _$PredictionImpl(
      prediction: json['prediction'] as String,
      accuracy: json['accuracy'] as String,
      otherPrediction: json['otherPrediction'] as List<dynamic>,
      otherAccuracy: json['otherAccuracy'] as List<dynamic>,
    );

Map<String, dynamic> _$$PredictionImplToJson(_$PredictionImpl instance) =>
    <String, dynamic>{
      'prediction': instance.prediction,
      'accuracy': instance.accuracy,
      'otherPrediction': instance.otherPrediction,
      'otherAccuracy': instance.otherAccuracy,
    };

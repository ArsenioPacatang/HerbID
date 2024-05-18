// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantsImpl _$$PlantsImplFromJson(Map<String, dynamic> json) => _$PlantsImpl(
      image: json['image'] as String,
      imageResult: json['imageResult'] as String,
      scientificName: json['scientificName'] as String,
      cure: (json['cure'] as List<dynamic>).map((e) => e as String).toList(),
      description: json['description'] as String,
      benefit: json['benefit'] as String,
      procedure: json['procedure'] as String,
      commonName: json['commonName'] as String,
      familyName: json['familyName'] as String,
      localName: json['localName'] as String,
      predictionName: json['predictionName'] as String,
      credits:
          (json['credits'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PlantsImplToJson(_$PlantsImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'imageResult': instance.imageResult,
      'scientificName': instance.scientificName,
      'cure': instance.cure,
      'description': instance.description,
      'benefit': instance.benefit,
      'procedure': instance.procedure,
      'commonName': instance.commonName,
      'familyName': instance.familyName,
      'localName': instance.localName,
      'predictionName': instance.predictionName,
      'credits': instance.credits,
    };

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plants.freezed.dart';
part 'plants.g.dart';

@Freezed()
class Plants with _$Plants {
  const factory Plants({
    required String image,
    required String imageResult,
    required String scientificName,
    required List<String> cure,
    required String description,
    required String benefit,
    required String procedure,
    required String commonName,
    required String familyName,
    required String localName,
    required String predictionName,
    required List<String> credits,
  }) = _Plants;

  factory Plants.fromJson(Map<String, dynamic> json) => _$PlantsFromJson(json);
}

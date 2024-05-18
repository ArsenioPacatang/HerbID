import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer.freezed.dart';
part 'developer.g.dart';

@Freezed()
class Developer with _$Developer {
  const factory Developer({
    required String name,
    required String address,
    required String rule,
  }) = _Developer;

  factory Developer.fromJson(Map<String, dynamic> json) =>
      _$DeveloperFromJson(json);
}

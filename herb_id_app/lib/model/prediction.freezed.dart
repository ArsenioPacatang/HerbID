// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Prediction _$PredictionFromJson(Map<String, dynamic> json) {
  return _Prediction.fromJson(json);
}

/// @nodoc
mixin _$Prediction {
  String get prediction => throw _privateConstructorUsedError;
  String get accuracy => throw _privateConstructorUsedError;
  List<dynamic> get otherPrediction => throw _privateConstructorUsedError;
  List<dynamic> get otherAccuracy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictionCopyWith<Prediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionCopyWith<$Res> {
  factory $PredictionCopyWith(
          Prediction value, $Res Function(Prediction) then) =
      _$PredictionCopyWithImpl<$Res, Prediction>;
  @useResult
  $Res call(
      {String prediction,
      String accuracy,
      List<dynamic> otherPrediction,
      List<dynamic> otherAccuracy});
}

/// @nodoc
class _$PredictionCopyWithImpl<$Res, $Val extends Prediction>
    implements $PredictionCopyWith<$Res> {
  _$PredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = null,
    Object? accuracy = null,
    Object? otherPrediction = null,
    Object? otherAccuracy = null,
  }) {
    return _then(_value.copyWith(
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as String,
      otherPrediction: null == otherPrediction
          ? _value.otherPrediction
          : otherPrediction // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      otherAccuracy: null == otherAccuracy
          ? _value.otherAccuracy
          : otherAccuracy // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictionImplCopyWith<$Res>
    implements $PredictionCopyWith<$Res> {
  factory _$$PredictionImplCopyWith(
          _$PredictionImpl value, $Res Function(_$PredictionImpl) then) =
      __$$PredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String prediction,
      String accuracy,
      List<dynamic> otherPrediction,
      List<dynamic> otherAccuracy});
}

/// @nodoc
class __$$PredictionImplCopyWithImpl<$Res>
    extends _$PredictionCopyWithImpl<$Res, _$PredictionImpl>
    implements _$$PredictionImplCopyWith<$Res> {
  __$$PredictionImplCopyWithImpl(
      _$PredictionImpl _value, $Res Function(_$PredictionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prediction = null,
    Object? accuracy = null,
    Object? otherPrediction = null,
    Object? otherAccuracy = null,
  }) {
    return _then(_$PredictionImpl(
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as String,
      otherPrediction: null == otherPrediction
          ? _value._otherPrediction
          : otherPrediction // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      otherAccuracy: null == otherAccuracy
          ? _value._otherAccuracy
          : otherAccuracy // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionImpl implements _Prediction {
  const _$PredictionImpl(
      {required this.prediction,
      required this.accuracy,
      required final List<dynamic> otherPrediction,
      required final List<dynamic> otherAccuracy})
      : _otherPrediction = otherPrediction,
        _otherAccuracy = otherAccuracy;

  factory _$PredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionImplFromJson(json);

  @override
  final String prediction;
  @override
  final String accuracy;
  final List<dynamic> _otherPrediction;
  @override
  List<dynamic> get otherPrediction {
    if (_otherPrediction is EqualUnmodifiableListView) return _otherPrediction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherPrediction);
  }

  final List<dynamic> _otherAccuracy;
  @override
  List<dynamic> get otherAccuracy {
    if (_otherAccuracy is EqualUnmodifiableListView) return _otherAccuracy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherAccuracy);
  }

  @override
  String toString() {
    return 'Prediction(prediction: $prediction, accuracy: $accuracy, otherPrediction: $otherPrediction, otherAccuracy: $otherAccuracy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionImpl &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            const DeepCollectionEquality()
                .equals(other._otherPrediction, _otherPrediction) &&
            const DeepCollectionEquality()
                .equals(other._otherAccuracy, _otherAccuracy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      prediction,
      accuracy,
      const DeepCollectionEquality().hash(_otherPrediction),
      const DeepCollectionEquality().hash(_otherAccuracy));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionImplCopyWith<_$PredictionImpl> get copyWith =>
      __$$PredictionImplCopyWithImpl<_$PredictionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionImplToJson(
      this,
    );
  }
}

abstract class _Prediction implements Prediction {
  const factory _Prediction(
      {required final String prediction,
      required final String accuracy,
      required final List<dynamic> otherPrediction,
      required final List<dynamic> otherAccuracy}) = _$PredictionImpl;

  factory _Prediction.fromJson(Map<String, dynamic> json) =
      _$PredictionImpl.fromJson;

  @override
  String get prediction;
  @override
  String get accuracy;
  @override
  List<dynamic> get otherPrediction;
  @override
  List<dynamic> get otherAccuracy;
  @override
  @JsonKey(ignore: true)
  _$$PredictionImplCopyWith<_$PredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

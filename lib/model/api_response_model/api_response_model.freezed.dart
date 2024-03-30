// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiSuccessResponseModel _$ApiSuccessResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ApiSuccessResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ApiSuccessResponseModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "res_data")
  Map<String, dynamic>? get resData => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiSuccessResponseModelCopyWith<ApiSuccessResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiSuccessResponseModelCopyWith<$Res> {
  factory $ApiSuccessResponseModelCopyWith(ApiSuccessResponseModel value,
          $Res Function(ApiSuccessResponseModel) then) =
      _$ApiSuccessResponseModelCopyWithImpl<$Res, ApiSuccessResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "res_data") Map<String, dynamic>? resData,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class _$ApiSuccessResponseModelCopyWithImpl<$Res,
        $Val extends ApiSuccessResponseModel>
    implements $ApiSuccessResponseModelCopyWith<$Res> {
  _$ApiSuccessResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? resData = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      resData: freezed == resData
          ? _value.resData
          : resData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiSuccessResponseModelImplCopyWith<$Res>
    implements $ApiSuccessResponseModelCopyWith<$Res> {
  factory _$$ApiSuccessResponseModelImplCopyWith(
          _$ApiSuccessResponseModelImpl value,
          $Res Function(_$ApiSuccessResponseModelImpl) then) =
      __$$ApiSuccessResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "res_data") Map<String, dynamic>? resData,
      @JsonKey(name: "message") String? message});
}

/// @nodoc
class __$$ApiSuccessResponseModelImplCopyWithImpl<$Res>
    extends _$ApiSuccessResponseModelCopyWithImpl<$Res,
        _$ApiSuccessResponseModelImpl>
    implements _$$ApiSuccessResponseModelImplCopyWith<$Res> {
  __$$ApiSuccessResponseModelImplCopyWithImpl(
      _$ApiSuccessResponseModelImpl _value,
      $Res Function(_$ApiSuccessResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? resData = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ApiSuccessResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      resData: freezed == resData
          ? _value._resData
          : resData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiSuccessResponseModelImpl implements _ApiSuccessResponseModel {
  _$ApiSuccessResponseModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "res_data") final Map<String, dynamic>? resData,
      @JsonKey(name: "message") this.message})
      : _resData = resData;

  factory _$ApiSuccessResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiSuccessResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool? status;
  final Map<String, dynamic>? _resData;
  @override
  @JsonKey(name: "res_data")
  Map<String, dynamic>? get resData {
    final value = _resData;
    if (value == null) return null;
    if (_resData is EqualUnmodifiableMapView) return _resData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: "message")
  final String? message;

  @override
  String toString() {
    return 'ApiSuccessResponseModel(status: $status, resData: $resData, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiSuccessResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._resData, _resData) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_resData), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiSuccessResponseModelImplCopyWith<_$ApiSuccessResponseModelImpl>
      get copyWith => __$$ApiSuccessResponseModelImplCopyWithImpl<
          _$ApiSuccessResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiSuccessResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ApiSuccessResponseModel implements ApiSuccessResponseModel {
  factory _ApiSuccessResponseModel(
          {@JsonKey(name: "status") final bool? status,
          @JsonKey(name: "res_data") final Map<String, dynamic>? resData,
          @JsonKey(name: "message") final String? message}) =
      _$ApiSuccessResponseModelImpl;

  factory _ApiSuccessResponseModel.fromJson(Map<String, dynamic> json) =
      _$ApiSuccessResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "res_data")
  Map<String, dynamic>? get resData;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ApiSuccessResponseModelImplCopyWith<_$ApiSuccessResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ApiValidationErrorResponseModel _$ApiValidationErrorResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ApiValidationErrorResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ApiValidationErrorResponseModel {
  @JsonKey(name: "status")
  bool? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  Map<dynamic, dynamic>? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiValidationErrorResponseModelCopyWith<ApiValidationErrorResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiValidationErrorResponseModelCopyWith<$Res> {
  factory $ApiValidationErrorResponseModelCopyWith(
          ApiValidationErrorResponseModel value,
          $Res Function(ApiValidationErrorResponseModel) then) =
      _$ApiValidationErrorResponseModelCopyWithImpl<$Res,
          ApiValidationErrorResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") Map<dynamic, dynamic>? message});
}

/// @nodoc
class _$ApiValidationErrorResponseModelCopyWithImpl<$Res,
        $Val extends ApiValidationErrorResponseModel>
    implements $ApiValidationErrorResponseModelCopyWith<$Res> {
  _$ApiValidationErrorResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiValidationErrorResponseModelImplCopyWith<$Res>
    implements $ApiValidationErrorResponseModelCopyWith<$Res> {
  factory _$$ApiValidationErrorResponseModelImplCopyWith(
          _$ApiValidationErrorResponseModelImpl value,
          $Res Function(_$ApiValidationErrorResponseModelImpl) then) =
      __$$ApiValidationErrorResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") bool? status,
      @JsonKey(name: "message") Map<dynamic, dynamic>? message});
}

/// @nodoc
class __$$ApiValidationErrorResponseModelImplCopyWithImpl<$Res>
    extends _$ApiValidationErrorResponseModelCopyWithImpl<$Res,
        _$ApiValidationErrorResponseModelImpl>
    implements _$$ApiValidationErrorResponseModelImplCopyWith<$Res> {
  __$$ApiValidationErrorResponseModelImplCopyWithImpl(
      _$ApiValidationErrorResponseModelImpl _value,
      $Res Function(_$ApiValidationErrorResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ApiValidationErrorResponseModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value._message
          : message // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiValidationErrorResponseModelImpl
    implements _ApiValidationErrorResponseModel {
  _$ApiValidationErrorResponseModelImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "message") final Map<dynamic, dynamic>? message})
      : _message = message;

  factory _$ApiValidationErrorResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ApiValidationErrorResponseModelImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final bool? status;
  final Map<dynamic, dynamic>? _message;
  @override
  @JsonKey(name: "message")
  Map<dynamic, dynamic>? get message {
    final value = _message;
    if (value == null) return null;
    if (_message is EqualUnmodifiableMapView) return _message;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ApiValidationErrorResponseModel(status: $status, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiValidationErrorResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._message, _message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiValidationErrorResponseModelImplCopyWith<
          _$ApiValidationErrorResponseModelImpl>
      get copyWith => __$$ApiValidationErrorResponseModelImplCopyWithImpl<
          _$ApiValidationErrorResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiValidationErrorResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ApiValidationErrorResponseModel
    implements ApiValidationErrorResponseModel {
  factory _ApiValidationErrorResponseModel(
          {@JsonKey(name: "status") final bool? status,
          @JsonKey(name: "message") final Map<dynamic, dynamic>? message}) =
      _$ApiValidationErrorResponseModelImpl;

  factory _ApiValidationErrorResponseModel.fromJson(Map<String, dynamic> json) =
      _$ApiValidationErrorResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "status")
  bool? get status;
  @override
  @JsonKey(name: "message")
  Map<dynamic, dynamic>? get message;
  @override
  @JsonKey(ignore: true)
  _$$ApiValidationErrorResponseModelImplCopyWith<
          _$ApiValidationErrorResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_device_option_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AudioDeviceOption _$AudioDeviceOptionFromJson(Map<String, dynamic> json) {
  return _AudioDeviceOption.fromJson(json);
}

/// @nodoc
mixin _$AudioDeviceOption {
  dynamic get deviceInfo => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isOutput => throw _privateConstructorUsedError;
  bool get isInput => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioDeviceOptionCopyWith<AudioDeviceOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioDeviceOptionCopyWith<$Res> {
  factory $AudioDeviceOptionCopyWith(
          AudioDeviceOption value, $Res Function(AudioDeviceOption) then) =
      _$AudioDeviceOptionCopyWithImpl<$Res, AudioDeviceOption>;
  @useResult
  $Res call({dynamic deviceInfo, String name, bool isOutput, bool isInput});
}

/// @nodoc
class _$AudioDeviceOptionCopyWithImpl<$Res, $Val extends AudioDeviceOption>
    implements $AudioDeviceOptionCopyWith<$Res> {
  _$AudioDeviceOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceInfo = freezed,
    Object? name = null,
    Object? isOutput = null,
    Object? isInput = null,
  }) {
    return _then(_value.copyWith(
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOutput: null == isOutput
          ? _value.isOutput
          : isOutput // ignore: cast_nullable_to_non_nullable
              as bool,
      isInput: null == isInput
          ? _value.isInput
          : isInput // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioDeviceOptionImplCopyWith<$Res>
    implements $AudioDeviceOptionCopyWith<$Res> {
  factory _$$AudioDeviceOptionImplCopyWith(_$AudioDeviceOptionImpl value,
          $Res Function(_$AudioDeviceOptionImpl) then) =
      __$$AudioDeviceOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic deviceInfo, String name, bool isOutput, bool isInput});
}

/// @nodoc
class __$$AudioDeviceOptionImplCopyWithImpl<$Res>
    extends _$AudioDeviceOptionCopyWithImpl<$Res, _$AudioDeviceOptionImpl>
    implements _$$AudioDeviceOptionImplCopyWith<$Res> {
  __$$AudioDeviceOptionImplCopyWithImpl(_$AudioDeviceOptionImpl _value,
      $Res Function(_$AudioDeviceOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceInfo = freezed,
    Object? name = null,
    Object? isOutput = null,
    Object? isInput = null,
  }) {
    return _then(_$AudioDeviceOptionImpl(
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isOutput: null == isOutput
          ? _value.isOutput
          : isOutput // ignore: cast_nullable_to_non_nullable
              as bool,
      isInput: null == isInput
          ? _value.isInput
          : isInput // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioDeviceOptionImpl
    with DiagnosticableTreeMixin
    implements _AudioDeviceOption {
  const _$AudioDeviceOptionImpl(
      {required this.deviceInfo,
      required this.name,
      required this.isOutput,
      required this.isInput});

  factory _$AudioDeviceOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioDeviceOptionImplFromJson(json);

  @override
  final dynamic deviceInfo;
  @override
  final String name;
  @override
  final bool isOutput;
  @override
  final bool isInput;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AudioDeviceOption(deviceInfo: $deviceInfo, name: $name, isOutput: $isOutput, isInput: $isInput)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AudioDeviceOption'))
      ..add(DiagnosticsProperty('deviceInfo', deviceInfo))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('isOutput', isOutput))
      ..add(DiagnosticsProperty('isInput', isInput));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioDeviceOptionImpl &&
            const DeepCollectionEquality()
                .equals(other.deviceInfo, deviceInfo) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isOutput, isOutput) ||
                other.isOutput == isOutput) &&
            (identical(other.isInput, isInput) || other.isInput == isInput));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(deviceInfo), name, isOutput, isInput);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioDeviceOptionImplCopyWith<_$AudioDeviceOptionImpl> get copyWith =>
      __$$AudioDeviceOptionImplCopyWithImpl<_$AudioDeviceOptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioDeviceOptionImplToJson(
      this,
    );
  }
}

abstract class _AudioDeviceOption implements AudioDeviceOption {
  const factory _AudioDeviceOption(
      {required final dynamic deviceInfo,
      required final String name,
      required final bool isOutput,
      required final bool isInput}) = _$AudioDeviceOptionImpl;

  factory _AudioDeviceOption.fromJson(Map<String, dynamic> json) =
      _$AudioDeviceOptionImpl.fromJson;

  @override
  dynamic get deviceInfo;
  @override
  String get name;
  @override
  bool get isOutput;
  @override
  bool get isInput;
  @override
  @JsonKey(ignore: true)
  _$$AudioDeviceOptionImplCopyWith<_$AudioDeviceOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

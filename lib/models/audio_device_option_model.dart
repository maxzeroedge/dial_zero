import 'package:freezed_annotation/freezed_annotation.dart';
// Make it devTools friendly
import 'package:flutter/foundation.dart';
part 'audio_device_option_model.freezed.dart';
part 'audio_device_option_model.g.dart';

@freezed
class AudioDeviceOption with _$AudioDeviceOption {

  const factory AudioDeviceOption({
    required dynamic deviceInfo,
    required String name,
    required bool isOutput,
    required bool isInput
  }) = _AudioDeviceOption;

  factory AudioDeviceOption.fromJson(Map<String, dynamic> json)
    => _$AudioDeviceOptionFromJson(json);
}
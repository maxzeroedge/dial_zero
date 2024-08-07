import 'package:dial_zero/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


enum DialerActions {
  RECORD(label: "Record", icon: Icons.record_voice_over),
  HOLD(label: "Hold", icon: Icons.pause),
  ADD_CALL(label: "Add Call", icon: Icons.add_call),
  MUTE(label: "Mute", icon: Icons.mic_off),
  SWITCH_TO_VIDEO(label: "Video", icon: Icons.video_call),
  AUDIO_SOURCE(label: "Speaker", icon: Icons.speaker),
  END_CALL(label: "End Call", icon: Icons.call_end);

  const DialerActions({
    required this.label,
    required this.icon
  });

  final String label;
  final IconData icon;
}

enum AudioDeviceType {
  INPUT, OUTPUT
}

void onPressedAction(DialerActions action, {dynamic param}) {
  switch (action) {
    case DialerActions.END_CALL:
      router.go("/");
      break;
    case DialerActions.AUDIO_SOURCE:
      getAvailableAudioDevices(AudioDeviceType.OUTPUT);
      break;
    default:
      print("No Action Registered");
  }
}

const caller_platform = MethodChannel('com.palashmax.dial_zero/caller_actions');
const battery_platform = MethodChannel('com.palashmax.dial_zero/battery_actions');

Future<int?> getBatteryLevel() async {
  try {
    final result = await battery_platform.invokeMethod<int>('getBatteryLevel');
    return result;
  } on PlatformException catch (e) {
    print("Failed to get battery level: '${e.message}'.");
    return 0;
  }
}

Future<bool> initiateCall(String phoneNumber) async {
  return await caller_platform.invokeMethod("initiateCall", {"phoneNumber": phoneNumber});
}

Future<List<Map<String, dynamic>>> getAvailableAudioDevices(AudioDeviceType audioDeviceType) async {
    final List<dynamic> devices = await caller_platform.invokeMethod('getAvailableAudioDevices',
    {
      'audioDeviceType': audioDeviceType.name
    });
    // TODO: type '_Map<Object?, Object?>' is not a subtype of type 'Map<String, dynamic>' in type cast
    return devices.cast<Map<String, dynamic>>();
  }

Future<bool> changeAudioDevice(int index, AudioDeviceType audioDeviceType) async {
  return await caller_platform.invokeMethod('changeAudioDevice', {
    'index': index,
    'audioDeviceType': audioDeviceType
  });
}

Future<void> toggleCallRecording() async {
  await caller_platform.invokeMethod('toggleCallRecording');
}

Future<void> endCall() async {
  await caller_platform.invokeMethod('endCall');
}
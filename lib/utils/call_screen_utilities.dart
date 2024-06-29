
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

void onPressedAction(DialerActions action) {
  switch (action) {
    case DialerActions.END_CALL:
      router.go("/");
      break;
    case DialerActions.AUDIO_SOURCE:
      getAudioList();
      break;
    default:
      print("No Action Registered");
  }
}

const dialer_platform = MethodChannel('com.palashmax.dial_zero/dialer_actions');
const battery_platform = MethodChannel('com.palashmax.dial_zero/battery_actions');

Future<List<Object?>?> getAudioList() async {
  try {
    final result = await dialer_platform.invokeMethod('getAudioSources');
    return result;
  } on PlatformException catch (e) {
    print("Failed to get battery level: '${e.message}'.");
    return [];
  }
}

Future<int?> getBatteryLevel() async {
  try {
    final result = await battery_platform.invokeMethod<int>('getBatteryLevel');
    return result;
  } on PlatformException catch (e) {
    print("Failed to get battery level: '${e.message}'.");
    return 0;
  }
}
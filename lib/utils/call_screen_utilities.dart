
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
      break;
    default:
      print("No Action Registered");
  }
}

const platform = MethodChannel('com.palashmax.dial_zero/dialer_actions');

void getAudioList() {
  //
}
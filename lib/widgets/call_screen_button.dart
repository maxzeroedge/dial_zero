import 'package:dial_zero/utils/call_screen_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'audio_source_selector.dart';

class CallScreenButton extends ConsumerWidget {

  CallScreenButton({
    required this.type
  }): super(key: UniqueKey());

  final DialerActions type;

  Widget build(BuildContext context, WidgetRef ref) {
    switch(type) {
      case DialerActions.END_CALL:
        return TextButton.icon(
            onPressed: () {
              onPressedAction(type);
            },
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
                iconColor: WidgetStatePropertyAll(Colors.white),
                foregroundColor: WidgetStatePropertyAll(Colors.white)
            ),
            icon: Icon(type.icon),
            label: Text(type.label)
        );
      case DialerActions.AUDIO_SOURCE:
        return AudioSourceSelectorWidget();
      default:
        return TextButton.icon(
            onPressed: () {
              onPressedAction(type);
            },
            icon: Icon(type.icon),
            label: Text(type.label)
        );
    }
  }
}


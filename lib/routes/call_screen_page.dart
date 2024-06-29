import 'package:dial_zero/models/dialled_model.dart';
import 'package:dial_zero/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class CallScreenPageWidget extends ConsumerWidget {

  Widget build(BuildContext context, WidgetRef ref) {
    String dialledNumber = ref.read(dialledProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: DialTargetWidget(dialledNumber: dialledNumber),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: DialerActions.values
                    .where((e)=>e != DialerActions.END_CALL)
                    .map(
                        (e) => CallScreenButton(type: e)
                ).toList(),
              ),
            ),
            Container(
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CallScreenButton(type: DialerActions.END_CALL),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

class DialTargetWidget extends StatelessWidget {
  const DialTargetWidget({
    super.key,
    required this.dialledNumber,
  });

  final String dialledNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        dialledNumber,
        style: TextStyle(
            fontSize: 40.0
        ),
      ),
    );
  }
}

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

  void onPressedAction(DialerActions action) {
    switch (action) {
      case DialerActions.END_CALL:
        router.go("/");
        break;
      default:
        print("No Action Registered");
    }
  }
}
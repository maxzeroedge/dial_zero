import 'package:dial_zero/models/dialled_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CallScreenPageWidget extends ConsumerWidget {

  final List<String> buttons = [
    "RECORD",
    "HOLD",
    "ADD_CALL",
    "MUTE",
    "SWITCH_TO_VIDEO",
    "AUDIO_SOURCE"
  ];

  Widget build(BuildContext context, WidgetRef ref) {
    String dialledNumber = ref.read(dialledProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
          dialledNumber,
              style: TextStyle(
                fontSize: 40.0
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              children: buttons.map(
                  (e) => CallScreenButton(type: e)
              ).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CallScreenButton(type: "END_CALL")
              ],
            )
          ],
        ),
      )
    );
  }
}

class CallScreenButton extends ConsumerWidget {

  CallScreenButton({
    required this.type
  }): super(key: UniqueKey());

  final String type;

  Widget build(BuildContext context, WidgetRef ref) {
    switch(type) {
      case "RECORD":
        return TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.record_voice_over),
            label: Text("Record")
        );
      case "HOLD":
        return TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.pause),
            label: Text("Hold")
        );
      case "ADD_CALL":
        return TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add_call),
            label: Text("Add Call")
        );
      case "MUTE":
        return TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.mic_off),
            label: Text("Mute")
        );
      case "SWITCH_TO_VIDEO":
        return TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.video_call),
            label: Text("Video")
        );
      case "AUDIO_SOURCE":
        return TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.speaker),
            label: Text("Speaker")
        );
      case "END_CALL":
        return TextButton.icon(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red),
              iconColor: MaterialStatePropertyAll(Colors.white)
            ),
            icon: Icon(Icons.call),
            label: Text("End Call")
        );
      default:
        return Container();
    }
      
  }
}
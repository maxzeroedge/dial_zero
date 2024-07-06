import 'package:dial_zero/models/audio_device_option_model.dart';
import 'package:dial_zero/utils/call_screen_utilities.dart';
import 'package:flutter/material.dart';

class AudioSourceSelectorWidget extends StatefulWidget {
  const AudioSourceSelectorWidget({
    super.key,
  });

  @override
  State<AudioSourceSelectorWidget> createState() => AudioSourceSelectorState();
}

class AudioSourceSelectorState extends State<AudioSourceSelectorWidget> {
  late AudioDeviceOption selectedAudioDeviceOption;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAvailableAudioDevices(AudioDeviceType.OUTPUT),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AudioDeviceOption> audioDeviceOptions = snapshot.data!.map(
                (e) => AudioDeviceOption.fromJson(e)
            ).toList();
            return PopupMenuButton<AudioDeviceOption>(
                initialValue: selectedAudioDeviceOption ?? audioDeviceOptions[0],
                onSelected: (AudioDeviceOption item) {
                  onPressedAction(DialerActions.AUDIO_SOURCE,
                      param: item
                  );
                  setState(() {
                    selectedAudioDeviceOption = item;
                  });
                },
                itemBuilder: (BuildContext context) => audioDeviceOptions
                    .map((audioDeviceOption) =>
                        PopupMenuItem<AudioDeviceOption>(
                          value: audioDeviceOption,
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(DialerActions.AUDIO_SOURCE.icon),
                              label: Text(DialerActions.AUDIO_SOURCE.label)),
                        ))
                    .toList());
          } else if(snapshot.hasError) {
            print(snapshot.error);
          }
          return CircularProgressIndicator();
        });
  }
}

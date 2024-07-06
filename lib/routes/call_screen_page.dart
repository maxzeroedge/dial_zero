import 'package:dial_zero/models/dialled_model.dart';
import 'package:dial_zero/utils/call_screen_utilities.dart';
import 'package:dial_zero/widgets/battery_background_indicator.dart';
import 'package:dial_zero/widgets/call_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CallScreenPageWidget extends ConsumerWidget {

  Widget build(BuildContext context, WidgetRef ref) {
    String dialledNumber = ref.read(dialledProvider);
    return Scaffold(
      body: SafeArea(
        child: BatteryBackgroundIndicator(
          UniqueKey(),
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

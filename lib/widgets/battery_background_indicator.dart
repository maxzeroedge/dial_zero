import 'package:dial_zero/providers/battery_state_notifier.dart';
import 'package:dial_zero/utils/call_screen_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants.dart';

class BatteryBackgroundIndicator extends StatelessWidget {

  const BatteryBackgroundIndicator(Key key, {
    required this.child
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: BatteryBackgroundIndicatorBg(),
        ),
        Container(
          child: this.child,
        ),
      ],
    );
  }
}

class BatteryBackgroundIndicatorBg extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref.read(batteryStateNotifierProvider.future),
        builder: (buildContext, snapshot) {
          double batteryLevel = ref
              .read(batteryStateNotifierProvider.notifier)
              .getBatteryLevelAsDouble();
          if(
            snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null
          ) {
            return BatteryBackground(batteryLevel: snapshot.data!/100);
          }
          return Center(
            child: BatteryBackground(
                batteryLevel: 0.0
            ),
          );
        }
    );
  }
}

class BatteryBackground extends StatelessWidget {
  const BatteryBackground({
    super.key,
    required this.batteryLevel,
  });

  final double batteryLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.transparent,
                batteryColor
              ],
              stops: [1-batteryLevel, 1-batteryLevel],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );
  }
}
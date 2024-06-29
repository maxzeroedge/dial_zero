import 'package:dial_zero/utils/call_screen_utilities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'battery_state_notifier.g.dart';

@riverpod
class BatteryStateNotifier extends _$BatteryStateNotifier {

  int? _batteryLevel;

  @override
  FutureOr<int?> build() async {
    this._batteryLevel = await getBatteryLevel();
    return this._batteryLevel;
  }

  double getBatteryLevelAsDouble() {
    return (_batteryLevel ?? 0) / 100;
  }
}
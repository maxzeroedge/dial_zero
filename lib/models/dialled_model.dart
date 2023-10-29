import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dialled_model.g.dart';

@riverpod
class Dialled extends _$Dialled {

  @override
  String build() => "";

  void addToDial(String a) => state += a;

  void removeFromDial() {
    if(state.isNotEmpty) {
      state = state.substring(0, state.length - 1);
    }
  }
}
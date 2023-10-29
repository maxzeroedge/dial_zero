import 'package:dial_zero/models/dialled_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialPadButtonWidget extends ConsumerWidget {

  DialPadButtonWidget(Key key, {
    required this.type,
    this.heading = "",
    this.subheading = "",
  }): super(key: key);

  String type;
  String heading;
  String subheading;

  Widget build(BuildContext context, WidgetRef ref) {
    Dialled dialled = ref.read(dialledProvider.notifier);
    switch (this.type ) {
      case "NUMBER":
        return TextButton(
          onPressed: () {
            dialled.addToDial(this.heading);
          },
          child: ListTile(
            title: Text(
                this.heading,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32.0
                ),
            ),
            subtitle: Text(
              this.subheading,
              textAlign: TextAlign.center,
            ),
          ),
        );
      case "HIDE_BUTTON":
        return DialerButtonWidget(
            icon: Icons.dialpad,
            onPressed: () {}
        );
      case "CALL_BUTTON":
        return DialerButtonWidget(
            icon: Icons.call_rounded,
            onPressed: () {
              String dialled = ref.read(dialledProvider);
              if(dialled.isNotEmpty) {
                //Call with dialled
              }
            }
        );
      case "DELETE_BUTTON":
        return DialerButtonWidget(
            icon: Icons.backspace_rounded,
            onPressed: () {
              dialled.removeFromDial();
            }
        );
      default:
        return Container(
          child: Text("X"),
        );
    }
  }
}

class DialerButtonWidget extends StatelessWidget {

  DialerButtonWidget({
    required this.icon,
    required this.onPressed
  }): super(key: UniqueKey());

  final IconData icon;
  final Function() onPressed;

  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          alignment: Alignment.center,
          iconSize: MaterialStateProperty.all(32.0),
        ),
        child: Icon(icon),
    );
  }
}
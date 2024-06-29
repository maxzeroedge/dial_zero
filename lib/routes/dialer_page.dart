import 'package:dial_zero/models/dialled_model.dart';
import 'package:dial_zero/utils/constants.dart';
import 'package:dial_zero/widgets/battery_background_indicator.dart';
import 'package:dial_zero/widgets/dial_pad_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DialerPageWidget extends ConsumerWidget {

  final List<Map> keyMap = [
    {
      "type": "NUMBER",
      "heading": "1",
      "subheading": ""
    },
    {
      "type": "NUMBER",
      "heading": "2",
      "subheading": "abc"
    },
    {
      "type": "NUMBER",
      "heading": "3",
      "subheading": "def"
    },
    {
      "type": "NUMBER",
      "heading": "4",
      "subheading": "ghi"
    },
    {
      "type": "NUMBER",
      "heading": "5",
      "subheading": "jkl"
    },
    {
      "type": "NUMBER",
      "heading": "6",
      "subheading": "mno"
    },
    {
      "type": "NUMBER",
      "heading": "7",
      "subheading": "pqrs"
    },
    {
      "type": "NUMBER",
      "heading": "8",
      "subheading": "tuv"
    },
    {
      "type": "NUMBER",
      "heading": "9",
      "subheading": "wxyz"
    },
    {
      "type": "NUMBER",
      "heading": "*",
      "subheading": ","
    },
    {
      "type": "NUMBER",
      "heading": "0",
      "subheading": "+"
    },
    {
      "type": "NUMBER",
      "heading": "#",
      "subheading": ";"
    },
    {
      "type": "HIDE_BUTTON",
      "heading": "hide_menu"
    },
    {
      "type": "CALL_BUTTON",
      "heading": "start_call"
    },
    {
      "type": "DELETE_BUTTON",
      "heading": "backspace"
    }
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: BatteryBackgroundIndicator(
        UniqueKey(),
        child: SafeArea(
          child: Column(
            children: [
              TextField(
                style: TextStyle(
                    fontSize: 32.0
                ),
                controller: TextEditingController(
                    text: ref.watch(dialledProvider)
                ),
                keyboardType: TextInputType.none,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //         child: TextField(
              //           style: TextStyle(
              //               fontSize: 32.0
              //           ),
              //           controller: TextEditingController(
              //               text: ref.watch(dialledProvider)
              //           ),
              //           keyboardType: TextInputType.none,
              //         )
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         ref.read(dialledProvider.notifier).removeFromDial();
              //       },
              //       style: ButtonStyle(
              //         alignment: Alignment.center,
              //         iconSize: MaterialStateProperty.all(32.0),
              //       ),
              //       child: Icon(Icons.backspace_rounded),
              //     )
              //   ],
              // ),
              Expanded(
                child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: keyMap
                        .map((e) => DialPadButtonWidget(
                        ValueKey(e["heading"]),
                        heading: e["heading"] ?? "",
                        subheading: e["subheading"] ?? "",
                        type: e["type"]
                    )
                    ).toList()
                ),
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: batteryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              label: "Dialer"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: "Contact"
          )
        ],
      )
    );
  }
}
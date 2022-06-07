import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  SwitchClass createState() => SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      // print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      // print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          const Text(
            'Expresso',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Transform.scale(
            scale: 0.9,
            child: Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
              activeColor: Colors.deepOrangeAccent,
              activeTrackColor: Colors.orange,
              inactiveThumbColor: Colors.grey[70],
              inactiveTrackColor: Colors.grey,
            ),
          ),
          const Text(
            'Completo',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ]);
  }
}

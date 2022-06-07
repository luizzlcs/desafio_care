import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'classific_clintion.dart';

class ConfigClassification extends StatelessWidget {
  const ConfigClassification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int order = (context.select((ClassificationClient c) => c.order));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: (() {
            Provider.of<ClassificationClient>(context, listen: false)
                .default1();
          }),
          child: Text(
            'Default',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: order == 0 ? Colors.red : Colors.black),
          ),
        ),
        GestureDetector(
          onTap: (() {
            Provider.of<ClassificationClient>(context, listen: false).az();
          }),
          child: Text(
            'A-z',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: order == 1 ? Colors.red : Colors.black),
          ),
        ),
        GestureDetector(
          onTap: (() {
            Provider.of<ClassificationClient>(context, listen: false).za();
          }),
          child: Text(
            'Z-a',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: order == 2 ? Colors.red : Colors.black),
          ),
        ),
      ],
    );
  }
}

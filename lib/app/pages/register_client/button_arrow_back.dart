import 'package:flutter/material.dart';

class ButtonArrowBack extends StatelessWidget {
  const ButtonArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}

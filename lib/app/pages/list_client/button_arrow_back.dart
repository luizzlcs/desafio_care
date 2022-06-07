import 'package:flutter/material.dart';

class ButtonArrowBack extends StatelessWidget {
  const ButtonArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 238, 238),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 117, 117, 117),
        ),
      ),
    );
  }
}

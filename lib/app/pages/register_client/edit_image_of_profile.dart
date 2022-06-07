import 'package:flutter/material.dart';

class EditImageOfProfile extends StatelessWidget {
  const EditImageOfProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 56,
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: const Color(0xff6147C5),
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

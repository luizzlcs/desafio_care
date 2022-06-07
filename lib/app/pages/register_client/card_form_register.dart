import 'package:flutter/material.dart';
import 'form_client.dart';

class CardFormRegister extends StatelessWidget {
  const CardFormRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // TODO HARDCODED
      height: MediaQuery.of(context).size.height * 1.5,
      width: MediaQuery.of(context).size.width * 0.9,
      top: 159,
      left: 16,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            right: 30,
            left: 30,
          ),
          child: Column(
            children: const [
              FormClient(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:desafio_care/app/pages/list_client/card_list_view/card_internal.dart';
import 'package:flutter/material.dart';

class CardOfBackground extends StatelessWidget {
  const CardOfBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 240, 238, 238),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 7.9),
        child: CardInternal(),
      ),
    );
  }
}

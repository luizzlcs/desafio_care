import 'package:desafio_care/app/pages/list_client/search_bar.dart';
import 'package:flutter/material.dart';
import 'button_arrow_back.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: const [
            ButtonArrowBack(),
            SizedBox(width: 5),
            SearchBar(),
          ],
        );
      },
    );
  }
}

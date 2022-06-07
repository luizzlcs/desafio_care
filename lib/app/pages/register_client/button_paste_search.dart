import 'package:flutter/material.dart';

class ButtonPasteSearch extends StatelessWidget {
  const ButtonPasteSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26, top: 10),
      child: InkWell(
        onTap: () {},
        child: const Icon(
          Icons.content_paste_search,
          color: Colors.white,
        ),
      ),
    );
  }
}

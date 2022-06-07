import 'package:flutter/material.dart';
import 'background_layout_components.dart';
import 'button_arrow_back.dart';
import 'button_paste_search.dart';
import 'custom_switch.dart';

class TopOfBottomScreen extends StatelessWidget {
  const TopOfBottomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150 * 1.3,
          decoration: const BoxDecoration(
            color: Color(0xff6147C5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ButtonArrowBack(),
                  ButtonPasteSearch(),
                ],
              ),
              const BackgroundLayoutComponents(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SwitchScreen(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

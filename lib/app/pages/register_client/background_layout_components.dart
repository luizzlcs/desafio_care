import 'package:flutter/material.dart';

import 'edit_image_of_profile.dart';
import 'image_of_profile.dart';

class BackgroundLayoutComponents extends StatelessWidget {
  const BackgroundLayoutComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: const [
            ImageOfProfile(),
            EditImageOfProfile(),
          ],
        ),
      ],
    );
  }
}

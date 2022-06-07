import 'package:flutter/material.dart';

class ImageOfProfile extends StatelessWidget {
  const ImageOfProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 40,
      backgroundImage: NetworkImage(
        'https://www.prosesc.org.br/files/depoimentos/1586969992913_perfilsemfoto.jpg',
      ),
    );
  }
}

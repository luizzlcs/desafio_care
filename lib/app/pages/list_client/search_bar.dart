import 'package:flutter/material.dart';

import '../ui/custom_field.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * .81,
          height: MediaQuery.of(context).size.width * 0.13,
          child: CustomField(
            hintText: 'Buscar',
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 194, 193, 193),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 240, 238, 238),
            prefixIcon: IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 194, 193, 193),
                size: 26,
              ),
            ),
            suffixIconButton: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.deepPurple,
                size: 26,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        );
      },
    );
  }
}

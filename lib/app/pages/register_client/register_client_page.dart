
import 'package:flutter/material.dart';

import 'card_form_register.dart';
import 'top_of_ bottom_screen.dart';

class RegisterClientPage extends StatelessWidget {
  const RegisterClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                // TODO HARDCODED
                height: MediaQuery.of(context).size.height * 1.5,
                color: Colors.white,
                child: const TopOfBottomScreen(),
              ),
              const CardFormRegister(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:desafio_care/app/pages/list_client/card_list_view/config_classification.dart';
import 'package:desafio_care/app/pages/list_client/top_bar.dart';
import 'package:flutter/material.dart';
import '../../../firebase_auth/auth_firebase_custom.dart';
import 'card_list_view/card_of_background.dart';

class ListClientPage extends StatelessWidget {
  ListClientPage({Key? key}) : super(key: key);

  var logof = AuthFirebaseCustom();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(height: 3),
                  TopBar(),
                  SizedBox(height: 16),
                  ConfigClassification(),
                  SizedBox(height: 16),
                  CardOfBackground(),
                ],
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/register");
        },
        backgroundColor: Colors.purple[900],
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

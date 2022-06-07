import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_care/app/pages/list_client/list_client_page.dart';
import 'package:desafio_care/app/pages/login/login.dart';
import 'package:desafio_care/app/pages/register_client/register_client_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      routes: {
        '/list': (context) => ListClientPage(),
        '/register': (context) => const RegisterClientPage(),
        '/login': (context) => const Login(),
      },
    );
  }
}

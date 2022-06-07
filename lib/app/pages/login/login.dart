import 'package:desafio_care/app/pages/login/custom_field_password.dart';
import 'package:desafio_care/app/pages/ui/custom_field.dart';
import 'package:desafio_care/firebase_auth/auth_firebase_custom.dart';
import 'package:desafio_care/firebase_auth/auth_interface.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

bool obscurePassword = true;
final AuthInterface authFirebaseCustom = AuthFirebaseCustom();
var controllerEmail = TextEditingController();
var controllerPass = TextEditingController();
String? errorMsg;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: Container(
                  color: const Color(0xff6147C5),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 14,
                    ),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5 * 3),
                          const Text(
                            'Olá, Farma!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Bem vindo ao seu ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const Text(
                            'aplicativo de saúde.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            height: 38,
                            child: CustomField(
                              controller: controllerEmail,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.white),
                              hintText: 'E-mail',
                              suffixIconButton: IconButton(
                                onPressed: (() {
                                  controllerEmail.clear();
                                }),
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white54,
                                ),
                              ),
                              hintStyle: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                              filled: true,
                              fillColor: const Color(0xff00DEED),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 38,
                            child: CustomFieldPassword(
                              controller: controllerPass,
                              obscurePassword: obscurePassword,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'Esqueci minha senha',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              var mail = controllerEmail.text;
                              var pass = controllerPass.text;

                              var result = await authFirebaseCustom.login(
                                  mail.toString(), pass.toString());

                              if (result == "loged") {
                                Navigator.of(context).popAndPushNamed("/list");
                              } else {
                                final snackBar = SnackBar(
                                  backgroundColor: const Color(0xffA378FD),
                                  content: Text(
                                    errorMsg = result,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Text('Entre'),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff00DEED),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          const Text(
                            'Ainda não é cliente?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          InkWell(
                            onTap: (() async {
                              // Navigator.of(context).pushNamed('/register');

                              var mail = controllerEmail.text;
                              var pass = controllerPass.text;
                              var result = '';
                              var register =
                                  await authFirebaseCustom.register(mail, pass);

                              if (register == 'Register user.') {
                                result = await authFirebaseCustom.login(
                                    mail.toString(), pass.toString());
                                Navigator.of(context)
                                    .pushReplacementNamed("/list");
                              } else {
                                final snackBar = SnackBar(
                                  backgroundColor: const Color(0xffA378FD),
                                  content: Text(errorMsg = register),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                setState(() => errorMsg = "Not autenticad");
                              }
                            }),
                            child: const Text(
                              'Cadastre-se',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

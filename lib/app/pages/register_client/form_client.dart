import 'package:desafio_care/app/pages/ui/custom_field.dart';
import 'package:desafio_care/firebase_firestore/client.dart';
import 'package:desafio_care/firebase_firestore/client_dao.dart';
import 'package:desafio_care/firebase_firestore/data_base_client.dart';
import 'package:flutter/material.dart';

class FormClient extends StatefulWidget {
  const FormClient({Key? key}) : super(key: key);

  @override
  State<FormClient> createState() => _FormClientState();
}

class _FormClientState extends State<FormClient> {
  Map<String, String> formData = {};
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerCpf = TextEditingController();
  final controllerBirthday = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerPhone = TextEditingController();
  final ClientDAO dataBaseClient = DataBaseClient();
  String? message;

  void loadFormData(Client? client) {
    if (client != null) {
      formData['name'] = client.name;
      formData['email'] = client.email;
      formData['cpf'] = client.cpf;
      formData['birthday'] = client.birthday;
      formData['phone'] = client.phone;
      formData['gender'] = client.gender;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Client? client =
        ModalRoute.of(context)?.settings.arguments as Client?;
    print(client);
    loadFormData(client);
    return Expanded(
      child: Column(
        children: [
          CustomField(
            controller: client == null ? controllerName : controllerName
              ..text = formData['name'] ?? "",
            hintText: 'Nome Completo',
            hintStyle: const TextStyle(color: Color(0xff1A027F)),
          ),
          const SizedBox(height: 5),
          CustomField(
            controller: client == null ? controllerEmail : controllerEmail
              ..text = formData['email'] ?? "",
            hintText: 'E-mail',
            hintStyle: const TextStyle(color: Color(0xff1A027F)),
          ),
          const SizedBox(height: 5),
          CustomField(
            controller: client == null ? controllerCpf : controllerCpf
              ..text = formData['cpf'] ?? "",
            hintText: 'CPF',
            hintStyle: const TextStyle(color: Color(0xff1A027F)),
          ),
          const SizedBox(height: 5),
          CustomField(
            controller: client == null ? controllerBirthday : controllerBirthday
              ..text = formData['birthday'] ?? "",
            hintText: 'DATA NASCIMENTO',
            hintStyle: const TextStyle(color: Color(0xff1A027F)),
          ),
          const SizedBox(height: 5),
          CustomField(
            controller: client == null ? controllerGender : controllerGender
              ..text = formData['gender'] ?? "",
            hintText: 'SEXO',
            hintStyle: const TextStyle(color: Color(0xff1A027F)),
          ),
          const SizedBox(height: 5),
          CustomField(
            controller: client == null ? controllerPhone : controllerPhone
              ..text = formData['phone'] ?? "",
            hintText: 'TELEFONE',
            hintStyle: const TextStyle(color: Color(0xff1A027F)),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 70,
                color: Colors.purple[900],
                onPressed: () {
                  var client = Client(
                      name: controllerName.text,
                      gender: controllerGender.text,
                      cpf: controllerCpf.text,
                      email: controllerEmail.text,
                      phone: controllerPhone.text,
                      birthday: controllerBirthday.text);
                  var result = dataBaseClient.save(client);
                  final snackBar = SnackBar(
                    backgroundColor: const Color(0xffA378FD),
                    content: Text(
                      result,
                    ),
                  );
                  if (result == "cadastrado com sucesso") {
                    dataBaseClient.find();
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                icon: const Icon(Icons.save),
              ),
              IconButton(
                disabledColor: Colors.black,
                iconSize: 70,
                color: Colors.purple[900],
                onPressed: client == null
                    ? null
                    : () {
                        dataBaseClient.remove(client.cpf);
                        Navigator.of(context).pop();
                      },
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}

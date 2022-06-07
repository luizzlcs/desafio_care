import 'package:desafio_care/firebase_firestore/client.dart';

abstract class ClientDAO {
  String save(Client client);

  remove(String cpf);

  Stream<List<Client>> find();
}

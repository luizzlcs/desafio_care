import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_care/firebase_firestore/client.dart';
import 'package:desafio_care/firebase_firestore/client_dao.dart';

class DataBaseClient implements ClientDAO {
  late CollectionReference clientCollection;

  DataBaseClient() {
    clientCollection = FirebaseFirestore.instance.collection('client');
  }

  @override
  save(Client client) {
    try {
      clientCollection.doc(client.cpf).set(client.toMap());
      return "cadastrado com sucesso";
    } on FirebaseException catch (e) {
      return 'erro ao cadastrar - ${e.code}';
    }
  }

  @override
  Stream<List<Client>> find() {
    var result = clientCollection.snapshots();
    return result
        .map((qShot) => qShot.docs.map((doc) => Client.fromJson(doc)).toList());
  }

  Stream<List<Client>> findOderAsc() {
    var result =
        clientCollection.orderBy('name', descending: false).snapshots();
    return result
        .map((qShot) => qShot.docs.map((doc) => Client.fromJson(doc)).toList());
  }

  Stream<List<Client>> findOderDesc() {
    var result = clientCollection.orderBy('name', descending: true).snapshots();
    return result
        .map((qShot) => qShot.docs.map((doc) => Client.fromJson(doc)).toList());
  }

  @override
  remove(String cpf) {
    clientCollection.doc(cpf).delete();
  }
}

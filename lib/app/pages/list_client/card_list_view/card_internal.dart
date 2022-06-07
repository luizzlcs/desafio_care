import 'package:desafio_care/firebase_firestore/client.dart';
import 'package:desafio_care/firebase_firestore/data_base_client.dart';
import 'package:flutter/material.dart';

class CardInternal extends StatefulWidget {
  const CardInternal({Key? key}) : super(key: key);

  @override
  State<CardInternal> createState() => _CardInternalState();
}

class _CardInternalState extends State<CardInternal> {
  var clientsData = DataBaseClient();

  var order = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (() {
                  setState(() {
                    order = 0;
                  });
                }),
                child: Text(
                  'Default',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: order == 0 ? Colors.red : Colors.black),
                ),
              ),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    order = 1;
                  });
                }),
                child: Text(
                  'A-z',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: order == 1 ? Colors.red : Colors.black),
                ),
              ),
              GestureDetector(
                onTap: (() {
                  setState(() {
                    order = 2;
                  });
                }),
                child: Text(
                  'Z-a',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: order == 2 ? Colors.red : Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<List<Client>>(
                stream: switchFind(clientsData, order),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator(
                      color: Colors.red,
                    );
                  }
                  var clients = snapshot.data!;
                  return ListView(
                    children: clients
                        .map(
                          (client) => buildClient(client, context),
                        )
                        .toList(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

Stream<List<Client>> switchFind(DataBaseClient clientsData, int order) {
  if (order == 0) {
    return clientsData.find();
  } else if (order == 1) {
    return clientsData.findOderAsc();
  } else {
    return clientsData.findOderDesc();
  }
}

Widget buildClient(Client? client, BuildContext context) => GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/register", arguments: client);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child:
              Center(child: Text(client!.name.substring(0, 1).toUpperCase())),
        ),
        title: Text(client.name),
        subtitle: Text(client.cpf),
      ),
    );

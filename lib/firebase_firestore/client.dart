import 'dart:convert';

class Client {
  String? urlAvatar;
  String name;
  String gender;
  String cpf;
  String email;
  String phone;
  String birthday;

  Client({
    this.urlAvatar,
    required this.name,
    required this.gender,
    required this.cpf,
    required this.email,
    required this.phone,
    required this.birthday,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (urlAvatar != null) {
      result.addAll({'urlAvatar': urlAvatar});
    }
    result.addAll({'name': name});
    result.addAll({'gender': gender});
    result.addAll({'cpf': cpf});
    result.addAll({'email': email});
    result.addAll({'phone': phone});
    result.addAll({'birthday': birthday});

    return result;
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      urlAvatar: map['urlAvatar'],
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      cpf: map['cpf'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      birthday: map['birthday'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  static Client fromJson(json) => Client(
      name: json['name'],
      gender: json['gender'],
      cpf: json['cpf'],
      email: json['email'],
      phone: json['phone'],
      birthday: json['birthday']);

  @override
  String toString() {
    return 'Client(urlAvatar: $urlAvatar, name: $name, gender: $gender, cpf: $cpf, email: $email, phone: $phone, birthday: $birthday)';
  }
}

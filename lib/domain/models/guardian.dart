import 'package:tempvet/domain/models/animal.dart';

class Guardian {
  final int? id;
  final String name;
  final String email;
  final String address;
  final String cpf;
  List<Animal>? animais;

  Guardian({this.id, required this.name, required this.email, required this.address, required this.cpf, this.animais});

  factory Guardian.fromJson(Map<String, dynamic> json) {
    return Guardian(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      cpf: json['cpf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'cpf': cpf,
    };
  }
}
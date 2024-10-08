import 'package:tempvet/domain/models/animal.dart';

class Guardian {
  final int id;
  final String name;
  final String address;
  final String cpf;
  List<Animal>? animais;

  Guardian({required this.id, required this.name, required this.address, required this.cpf, this.animais});

  factory Guardian.fromJson(Map<String, dynamic> json) {
    return Guardian(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      cpf: json['cpf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'cpf': cpf,
    };
  }
}
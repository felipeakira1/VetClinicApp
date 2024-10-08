// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:tempvet/domain/models/appointment.dart';
import 'package:tempvet/domain/models/guardian.dart';

class Animal {
  int? id;
  String name;
  String species;
  String breed;
  int age;
  String gender;
  int guardianId;
  Guardian? guardian;

  Animal({
    this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.age,
    required this.gender,
    required this.guardianId,
  });

  Animal copyWith({
    int? id,
    String? name,
    String? species,
    String? breed,
    int? age,
    String? gender,
    int? ownerId,
    List<Appointment>? appointents,
  }) {
    return Animal(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      guardianId: ownerId ?? guardianId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'species': species,
      'breed': breed,
      'age': age,
      'gender': gender,
      'ownerId': guardianId,
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] as String,
      species: map['species'] as String,
      breed: map['breed'] as String,
      age: map['age'] as int,
      gender: map['gender'] as String,
      guardianId: map['ownerId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) => Animal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Animal(id: $id, name: $name, species: $species, breed: $breed, age: $age, gender: $gender, ownerId: $guardianId)';
  }
}

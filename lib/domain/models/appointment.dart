import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/domain/models/guardian.dart';
import 'package:tempvet/domain/models/veterinarian.dart';

class Appointment {
  int? id;
  String date;
  String hour;
  double valor;
  double spent;
  String reason;
  String? diagnostic;
  String? treatment;
  int animalId;
  int veterinarianId;
  
  Veterinarian? veterinarian;
  Animal? animal;
  Guardian? guardian;

  Appointment({
    this.id,
    required this.date,
    required this.hour,
    required this.valor,
    required this.spent,
    this.animal,
    required this.reason,
    this.diagnostic,
    this.treatment,
    required this.animalId,
    required this.veterinarianId,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      date: json['date'],
      hour: json['hour'],
      valor: json['valor'],
      spent: json['spent'],
      reason: json['reason'],
      diagnostic: json['diagnostic'],
      treatment: json['treatment'],
      animalId: json['animalId'],
      veterinarianId: json['veterinarianId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'hour': hour,
      'valor': valor,
      'spent': spent,
      'reason': reason,
      'diagnostic': diagnostic,
      'treatment': treatment,
      'animalId': animalId,
      'veterinarianId': veterinarianId,
    };
  }
}
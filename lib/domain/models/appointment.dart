import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/domain/models/guardian.dart';

class Appointment {
  int? id;
  String date;
  String hour;
  double valor;
  double spent;
  Animal? animal;
  Guardian? guardian;
  String reason;
  String? diagnostic;
  String? treatment;
  int animalId;

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
    required this.animalId
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
      animalId: json['animalId']
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
    };
  }
}
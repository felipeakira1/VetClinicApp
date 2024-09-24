class Appointment {
  int id;
  String date;
  String hour;
  double valor;
  double gasto;
  int animalId;
  int veterinarioId;
  String motivo;
  String diagostico;
  String prescricoes;

  Appointment({
    required this.id,
    required this.date,
    required this.hour,
    required this.valor,
    required this.gasto,
    required this.animalId,
    required this.veterinarioId,
    required this.motivo,
    required this.diagostico,
    required this.prescricoes,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      date: json['date'],
      hour: json['hour'],
      valor: json['valor'],
      gasto: json['gasto'],
      animalId: json['animalId'],
      veterinarioId: json['veterinarioId'],
      motivo: json['motivo'],
      diagostico: json['diagostico'],
      prescricoes: json['prescricoes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'hour': hour,
      'valor': valor,
      'gasto': gasto,
      'animalId': animalId,
      'veterinarioId': veterinarioId,
      'motivo': motivo,
      'diagostico': diagostico,
      'prescricoes': prescricoes,
    };
  }
}
import 'package:tempvet/repository/appointment_repository.dart';

import '../../domain/models/Appointment.dart';

class InMemoryAppointmentRepository implements AppointmentRepository {
  final List<Appointment> _appointments = [
    Appointment(date: '26/09/2024', hour: '15:00', valor: 100.0, spent: 15.0, reason: 'reason', animalId: 1)
  ];

  @override
  Future<void> createAppointment(Appointment appointment) async {
    _appointments.add(appointment);
  }

  @override
  Future<List<Appointment>> fetchAppointments() async {
    return Future.value(_appointments);
  }

  @override
  Future<Appointment> fetchAppointmentById(int id) async {
    return Future.value(_appointments.firstWhere((appointmnet) => appointmnet.id == id));
  }
}
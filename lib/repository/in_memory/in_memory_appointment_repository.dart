import 'package:tempvet/domain/models/Appointment.dart';
import 'package:tempvet/repository/appointment_repository.dart';

class InMemoryAppointmentRepository implements AppointmentRepository {
  final List<Appointment> _appointments = [
    Appointment(date: '2024-20-20', hour: '14:00:24', valor: 100.0, gasto: 20.0, animalId: 1, veterinarioId: 1, motivo: 'N motivos'),
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
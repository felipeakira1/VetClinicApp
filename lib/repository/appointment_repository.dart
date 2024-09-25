import 'package:tempvet/domain/models/Appointment.dart';

abstract class AppointmentRepository {
  Future<void> createAppointment(Appointment appointment);
  Future<List<Appointment>> fetchAppointments();
  Future<Appointment> fetchAppointmentById(int id);
}
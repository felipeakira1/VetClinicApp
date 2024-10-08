import 'package:tempvet/domain/models/appointment.dart';

abstract class AppointmentRepository {
  Future<void> createAppointment(Appointment appointment);
  Future<List<Appointment>> fetchAppointments();
  Future<Appointment> fetchAppointmentById(int id);
}
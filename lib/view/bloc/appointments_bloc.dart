

import 'package:tempvet/domain/models/Appointment.dart';
import 'package:tempvet/repository/appointment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppointmentsEvents {}

class FetchAppointments extends AppointmentsEvents {}

abstract class AppointmentsStates {}

class AppointmentsLoading extends AppointmentsStates {}

class AppointmentsLoaded extends AppointmentsStates {
  final List<Appointment> appointments;

  AppointmentsLoaded(this.appointments);
}

class AppointmentsError extends AppointmentsStates {
  final String message;

  AppointmentsError(this.message);
}

class AppointmentsBloc extends Bloc<AppointmentsEvents, AppointmentsStates> {
  final AppointmentRepository _appointmentRepository;

  AppointmentsBloc(this._appointmentRepository) : super(AppointmentsLoading()) {
    on<FetchAppointments>((FetchAppointments event, Emitter<AppointmentsStates> emit) async {
      emit(AppointmentsLoading());
      try {
        List<Appointment> appointments = await _appointmentRepository.fetchAppointments();
        emit(AppointmentsLoaded(appointments));
      } catch(e) {
        emit(AppointmentsError(e.toString()));
      }
    });
  }
}
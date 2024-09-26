

import 'package:tempvet/domain/models/Appointment.dart';
import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/repository/animal_repository.dart';
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
  final AnimalRepository _animalRepository;

  AppointmentsBloc(this._appointmentRepository, this._animalRepository) : super(AppointmentsLoading()) {
    on<FetchAppointments>((FetchAppointments event, Emitter<AppointmentsStates> emit) async {
      emit(AppointmentsLoading());
      try {
        List<Appointment> appointments = await _appointmentRepository.fetchAppointments();
        for(Appointment appointment in appointments) {
          appointment.animal = (await _animalRepository.fetchAnimalById(appointment.animalId) as Animal?);
        }
        emit(AppointmentsLoaded(appointments));
      } catch(e) {
        emit(AppointmentsError(e.toString()));
      }
    });
  }
}
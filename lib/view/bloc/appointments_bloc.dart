

import 'package:tempvet/domain/models/appointment.dart';
import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/domain/models/guardian.dart';
import 'package:tempvet/domain/models/veterinarian.dart';
import 'package:tempvet/repository/animal_repository.dart';
import 'package:tempvet/repository/appointment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/repository/guardian_repository.dart';
import 'package:tempvet/repository/veterinarian_repository.dart';

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
  final GuardianRepository _guardianRepository;
  final VeterinarianRepository _veterinarianRepository;

  AppointmentsBloc(this._appointmentRepository, this._veterinarianRepository, this._animalRepository, this._guardianRepository) : super(AppointmentsLoading()) {
    on<FetchAppointments>((FetchAppointments event, Emitter<AppointmentsStates> emit) async {
      emit(AppointmentsLoading());
      try {
        List<Appointment> appointments = await _appointmentRepository.fetchAppointments();
        for(Appointment appointment in appointments) {
          appointment.veterinarian = (await _veterinarianRepository.retrieveVeterinarianById(appointment.veterinarianId) as Veterinarian?);
          appointment.animal = (await _animalRepository.fetchAnimalById(appointment.animalId) as Animal?);
          appointment.guardian = (await _guardianRepository.retrieveGuardianById(appointment.animal!.guardianId) as Guardian?);
        }
        emit(AppointmentsLoaded(appointments));
      } catch(e) {
        emit(AppointmentsError(e.toString()));
      }
    });
  }
}
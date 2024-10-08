import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/repository/animal_repository.dart';
import 'package:tempvet/repository/appointment_repository.dart';
import 'package:tempvet/repository/guardian_repository.dart';
import 'package:tempvet/repository/in_memory/in_memory_animal_repository.dart';
import 'package:tempvet/repository/in_memory/in_memory_appointment_repository.dart';
import 'package:tempvet/repository/in_memory/in_memory_guardian_repository.dart';
import 'package:tempvet/view/bloc/appointments_bloc.dart';
import 'package:tempvet/view/pages/login_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppointmentRepository appointmentRepository = InMemoryAppointmentRepository();
    AnimalRepository animalRepository = InMemoryAnimalRepository();
    GuardianRepository guardianRepository = InMemoryGuardianRepository();

    return BlocProvider(
      create: (context) => AppointmentsBloc(appointmentRepository, animalRepository, guardianRepository),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: Colors.black, secondary: Colors.yellow),
          ),
          home: LoginPage()),
    );
  }
}

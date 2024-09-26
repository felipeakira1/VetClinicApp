import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempvet/domain/models/Appointment.dart';
import 'package:tempvet/view/bloc/appointments_bloc.dart';
import 'package:tempvet/view/widgets/appointment_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<AppointmentsBloc>().add(FetchAppointments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('VetClinic')),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Próximas consultas'),
            const SizedBox(height: 16),
            BlocBuilder<AppointmentsBloc, AppointmentsStates>(
              builder: (context, state) {
                if(state is AppointmentsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if(state is AppointmentsLoaded) {
                  return Column(
                    children: state.appointments.map((appointment) => AppointmentCard(appointment: appointment)).toList(),
                  );
                } else if(state is AppointmentsError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
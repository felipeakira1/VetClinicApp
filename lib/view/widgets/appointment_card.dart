import 'package:flutter/material.dart';
import 'package:tempvet/domain/models/Appointment.dart';
import 'package:tempvet/view/widgets/green_button.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({
    super.key, 
    required this.appointment
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CONSULTA ${appointment.hour}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 4),
                Text('Tutor: ${appointment.hour}', overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                if (appointment.animal != null) 
                  Text('Pet: ${appointment.animal!.name}'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GreenButton(onPressed: (){}, title: 'Acessar', bold: false,),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tempvet/domain/models/animal.dart';
import 'package:tempvet/view/widgets/custom_icon_button.dart';
import 'package:tempvet/view/widgets/green_button.dart';

class AnimalTile extends StatelessWidget {
  final Animal animal;
  
  const AnimalTile({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffd3e2e5), width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('/ares.jpg', width: 80, height: 80, fit: BoxFit.cover),
            const SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(animal.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Text('Tutor(a): ${animal.guardian!.name}'),
                  Text(animal.age.toString()),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomIconButton(icon: Icons.add, color: Colors.grey, onPressed: () {}),
                      const SizedBox(width: 8.0,),
                      CustomIconButton(icon: Icons.edit, color: Colors.grey, onPressed: () {}),
                      const SizedBox(width: 8.0,),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tempvet/domain/models/guardian.dart';
import 'package:tempvet/view/widgets/custom_icon_button.dart';

class GuardianTile extends StatelessWidget {
  final Guardian guardian;
  
  const GuardianTile({super.key, required this.guardian});

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(guardian.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Text(guardian.email, style: const TextStyle(fontSize: 16),),
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
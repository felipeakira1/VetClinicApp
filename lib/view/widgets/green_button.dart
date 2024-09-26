import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final bool bold;

  const GreenButton({super.key, required this.onPressed, required this.title, this.bold = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade900,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: bold ? FontWeight.bold : FontWeight.normal))
      ),
    );
  }
}
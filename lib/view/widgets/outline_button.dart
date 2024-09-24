import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final void Function() onPressed;
  const OutlineButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,

        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          side: BorderSide(color: Colors.grey.shade200, width: 2),
        ),
        child: Text('Cadastrar-se', style: TextStyle(color: Colors.grey.shade700, fontSize: 16))
      ),
    );
  }
}
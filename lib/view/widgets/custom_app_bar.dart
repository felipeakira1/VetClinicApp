import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green.shade900,
      foregroundColor: Colors.white,
      title: const Text('VetClinic', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
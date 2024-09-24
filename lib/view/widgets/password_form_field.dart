import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final String title;
  final String? initialValue;
  final IconData suffixIcon;
  final TextEditingController controller;

  const PasswordFormField({
    super.key,
    required this.title,
    this.initialValue,
    required this.suffixIcon,
    required this.controller,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8.0,),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(widget.suffixIcon),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            ),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
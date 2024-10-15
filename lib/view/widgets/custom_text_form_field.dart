// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String? initialValue;
  final IconData suffixIcon;
  final TextEditingController controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? errorText;


  const CustomTextFormField({
    super.key,
    required this.title,
    this.initialValue,
    required this.suffixIcon,
    required this.controller,
    this.obscureText,
    this.validator, 
    this.errorText, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 8.0,),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText ?? false,
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
              suffixIcon: Icon(suffixIcon),
            ),
            style: const TextStyle(
              fontSize: 16,
            ),
            validator: validator
          ),
        ),
      ],
    );
  }
}

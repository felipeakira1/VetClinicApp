import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  String? selectedItem;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final String? errorText;

  CustomDropdown({
    super.key, 
    required this.label, 
    required this.items, 
    required this.onChanged,
    this.selectedItem,
    this.validator,
    this.errorText,
  });
     

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            // border: Border.all(color: const Color(0xffd3e2e5), width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              hint: Text(label),
              dropdownColor: Colors.white,
              value: selectedItem,
              onChanged: (newValue) {
                onChanged(newValue);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              validator: validator,
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.green.shade900,),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
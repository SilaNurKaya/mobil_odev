import 'package:flutter/material.dart';

class KitapFormAlani extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const KitapFormAlani({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: const Color.fromARGB(117, 0, 0, 0),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: const Color.fromARGB(9, 20, 11, 8), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        style: TextStyle(
          color: const Color.fromARGB(246, 0, 0, 0),
          fontSize: 16,
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Lütfen $label giriniz';
              }
              return null;
            },
      ),
    );
  }
}

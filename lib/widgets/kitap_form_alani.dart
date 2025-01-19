import 'package:flutter/material.dart';

class KitapFormAlani extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const KitapFormAlani({
    Key? key,
    required this.label,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0), // Daha fazla boşluk
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.deepPurple), // Etiket rengi
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16), // Yuvarlatılmış köşeler
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.deepOrange, width: 2),
          ),
          filled: true,
          fillColor: Colors.grey[200], // Arka plan rengi
        ),
        style: TextStyle(
            color: Colors.black87, fontSize: 16), // Yazı rengi ve büyüklüğü
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

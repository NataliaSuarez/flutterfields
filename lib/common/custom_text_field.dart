import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String valor = "";

  CustomTextField({required this.valor, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (texto) {
        valor = texto;
      },
    );
  }
}

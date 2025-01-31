import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled; // 1. Adicione a propriedade

  const InputWidget({
    super.key,
    required this.label,
    required this.controller,
    this.enabled = true, // 2. Torne opcional com valor padrão
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        enabled: enabled, // 3. Aplique a propriedade aqui
        decoration: InputDecoration(
          labelText: label, // 4. Corrija para labelText
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

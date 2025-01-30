import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultadoButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ResultadoButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Resultado',
      child: Icon(FontAwesomeIcons.equals),
    );
  }
}

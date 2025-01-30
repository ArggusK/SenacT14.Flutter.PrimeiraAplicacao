import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClearFieldsButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ClearFieldsButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Limpar Campos',
      child: Icon(FontAwesomeIcons.eraser),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget iconButtonsRow({
  required void Function() soma,
  required void Function() subtracao,
  required void Function() multiplicacao,
  required void Function() divisao,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton.filled(
        onPressed: soma,
        icon: Icon(FontAwesomeIcons.plus),
      ),
      IconButton.filled(
        onPressed: subtracao,
        icon: Icon(FontAwesomeIcons.minus),
      ),
      IconButton.filled(
        onPressed: multiplicacao,
        icon: Icon(FontAwesomeIcons.xmark),
      ),
      IconButton.filled(
        onPressed: divisao,
        icon: Icon(FontAwesomeIcons.divide),
      ),
    ],
  );
}

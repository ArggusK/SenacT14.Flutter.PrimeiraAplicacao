import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget iconButtonsRow({
  void Function()? soma,
  void Function()? subtracao,
  void Function()? multiplicacao,
  void Function()? divisao,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton.filled(
        onPressed: soma,
        icon: const Icon(FontAwesomeIcons.plus),
      ),
      const SizedBox(width: 10),
      IconButton.filled(
        onPressed: subtracao,
        icon: const Icon(FontAwesomeIcons.minus),
      ),
      const SizedBox(width: 10),
      IconButton.filled(
        onPressed: multiplicacao,
        icon: const Icon(FontAwesomeIcons.xmark),
      ),
      const SizedBox(width: 10),
      IconButton.filled(
        onPressed: divisao,
        icon: const Icon(FontAwesomeIcons.divide),
      ),
    ],
  );
}

import 'package:flutter/material.dart';

class NumericButtons extends StatelessWidget {
  final Function(String) addNumber;
  final Function divisaoCalc;
  final Function multiplicacaoCalc;
  final Function subtracaoCalc;
  final Function resultadoCalc;
  final Function somaCalc;
  final Function clearFields;
  final Function backspace;
  final Function clearInput;
  final Function porcentagemCalc;

  const NumericButtons({
    Key? key,
    required this.addNumber,
    required this.divisaoCalc,
    required this.multiplicacaoCalc,
    required this.subtracaoCalc,
    required this.resultadoCalc,
    required this.somaCalc,
    required this.clearFields,
    required this.backspace,
    required this.clearInput,
    required this.porcentagemCalc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        numericButtonsRow0(),
        numericButtonsRow(),
        numericButtonsRow2(),
        numericButtonsRow3(),
        numericButtonsRow4(),
      ],
    );
  }

  Widget numericButtonsRow0() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CalcButton(
          text: "%",
          onPressed: porcentagemCalc,
        ),
        CalcButton(
          text: "CE",
          onPressed: clearInput,
        ),
        CalcButton(
          text: "C",
          onPressed: clearFields,
        ),
        CalcButton(
          text: "⌫",
          onPressed: backspace,
        ),
      ],
    );
  }

  Widget numericButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CalcButton(
          text: "7",
          onPressed: () => addNumber("7"),
        ),
        CalcButton(
          text: "8",
          onPressed: () => addNumber("8"),
        ),
        CalcButton(
          text: "9",
          onPressed: () => addNumber("9"),
        ),
        CalcButton(
          text: "÷",
          onPressed: divisaoCalc,
        ),
      ],
    );
  }

  Widget numericButtonsRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CalcButton(
          text: "4",
          onPressed: () => addNumber("4"),
        ),
        CalcButton(
          text: "5",
          onPressed: () => addNumber("5"),
        ),
        CalcButton(
          text: "6",
          onPressed: () => addNumber("6"),
        ),
        CalcButton(
          text: "x",
          onPressed: multiplicacaoCalc,
        ),
      ],
    );
  }

  Widget numericButtonsRow3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CalcButton(
          text: "1",
          onPressed: () => addNumber("1"),
        ),
        CalcButton(
          text: "2",
          onPressed: () => addNumber("2"),
        ),
        CalcButton(
          text: "3",
          onPressed: () => addNumber("3"),
        ),
        CalcButton(
          text: "-",
          onPressed: subtracaoCalc,
        ),
      ],
    );
  }

  Widget numericButtonsRow4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CalcButton(
          text: ".",
          onPressed: () => addNumber("."),
        ),
        CalcButton(
          text: "0",
          onPressed: () => addNumber("0"),
        ),
        CalcButton(
          text: "=",
          onPressed: resultadoCalc,
        ),
        CalcButton(
          text: "+",
          onPressed: somaCalc,
        ),
      ],
    );
  }
}

class CalcButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CalcButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(text),
    );
  }
}

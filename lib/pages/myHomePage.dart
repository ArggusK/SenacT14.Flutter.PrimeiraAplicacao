import 'package:first_aplicaton_flutter/widgets/calcButton_widget.dart';
import 'package:first_aplicaton_flutter/widgets/eraseButton_widget.dart';
import 'package:first_aplicaton_flutter/widgets/input_widget.dart';
import 'package:first_aplicaton_flutter/widgets/resulButton_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController1 = TextEditingController();
  double valorGuardado1 = 0;
  double valorGuardado2 = 0;
  double? valorGuardado1Label;
  double? valorGuardado2Label;
  String calculo = "";
  String result = "";
  bool _inputEnabled = true;
  bool _operadoresHabilitados = true;

  @override
  void initState() {
    super.initState();
    textController1.addListener(_handleTextInput);
  }

  void _handleTextInput() {
    if (textController1.text.isNotEmpty && result.isNotEmpty) {
      setState(() {
        result = "";
        _operadoresHabilitados = true;
      });
    }
  }

  void _handleOperation(String newCalculo) {
    if (!_operadoresHabilitados) return;

    setState(() {
      _inputEnabled = true;
      _operadoresHabilitados = false;

      if (result.isNotEmpty) {
        valorGuardado1 = double.tryParse(result.split(' ').last) ?? 0;
        valorGuardado1Label = valorGuardado1;
        result = "";
      } else {
        valorGuardado1 = double.tryParse(textController1.text) ?? 0;
        valorGuardado1Label = double.tryParse(textController1.text);
      }

      textController1.clear();
      calculo = newCalculo;
      valorGuardado2Label = null;
    });
  }

  void resultadoCalc() {
    if (calculo.isEmpty || !_inputEnabled) return;

    setState(() {
      valorGuardado2 = double.tryParse(textController1.text) ?? 0;
      valorGuardado2Label = double.tryParse(textController1.text);

      switch (calculo) {
        case "+":
          result = "${valorGuardado1 + valorGuardado2}";
          break;
        case "-":
          result = "${valorGuardado1 - valorGuardado2}";
          break;
        case "x":
          result = "${valorGuardado1 * valorGuardado2}";
          break;
        case "÷":
          result = valorGuardado2 != 0
              ? "${valorGuardado1 / valorGuardado2}"
              : "Erro";
          break;
      }

      textController1.clear();
      _inputEnabled = false;
      _operadoresHabilitados = true;
    });
  }

  void clearFields() {
    setState(() {
      textController1.clear();
      result = "";
      valorGuardado1Label = null;
      valorGuardado2Label = null;
      calculo = "";
      _inputEnabled = true;
      _operadoresHabilitados = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              [
                if (valorGuardado1Label != null) valorGuardado1Label.toString(),
                if (calculo.isNotEmpty) calculo,
                if (valorGuardado2Label != null) valorGuardado2Label.toString(),
              ].join(' '),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            InputWidget(
              controller: textController1,
              label: "Digite um número",
              enabled: _inputEnabled,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  iconButtonsRow(
                    soma: _operadoresHabilitados
                        ? () => _handleOperation("+")
                        : null,
                    subtracao: _operadoresHabilitados
                        ? () => _handleOperation("-")
                        : null,
                    multiplicacao: _operadoresHabilitados
                        ? () => _handleOperation("x")
                        : null,
                    divisao: _operadoresHabilitados
                        ? () => _handleOperation("÷")
                        : null,
                  ),
                  const SizedBox(height: 20),
                  Text(result.isNotEmpty ? "Resultado: $result" : "",
                      style: const TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClearFieldsButton(
            onPressed: clearFields, // Mantém funcionalidade de limpar
          ),
          const SizedBox(height: 12),
          ResultadoButton(
            onPressed: resultadoCalc, // Mantém funcionalidade de cálculo
          ),
        ],
      ),
    );
  }
}

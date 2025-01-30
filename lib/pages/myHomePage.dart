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
  var textController1 = TextEditingController();
  double valorGuardado1 = 0;
  double? valorGuardado2;
  double? valorGuardado1Label;
  double? valorGuardado2Label;
  String calculo = "";
  String result = "";

  void _handleOperation(String newCalculo) {
    setState(() {
      // Se já houver uma operação em andamento, calcula automaticamente
      if (calculo.isNotEmpty && textController1.text.isNotEmpty) {
        valorGuardado2 = double.tryParse(textController1.text) ?? 0;
        valorGuardado2Label = valorGuardado2;
        _calcularOperacaoAtual();
      }

      // Se houver um resultado, usa-o como valor1
      if (result.isNotEmpty) {
        valorGuardado1 = double.tryParse(result.split(' ').last) ?? 0;
        valorGuardado1Label = valorGuardado1;
        result = "";
      } else if (textController1.text.isNotEmpty) {
        // Caso normal: pega o valor do campo de entrada
        valorGuardado1 = double.tryParse(textController1.text) ?? 0;
        valorGuardado1Label = valorGuardado1;
      }

      // Prepara para a nova operação
      calculo = newCalculo;
      textController1.clear();
      valorGuardado2Label = null;
    });
  }

  void _calcularOperacaoAtual() {
    switch (calculo) {
      case "+":
        valorGuardado1 += valorGuardado2!;
        break;
      case "-":
        valorGuardado1 -= valorGuardado2!;
        break;
      case "x":
        valorGuardado1 *= valorGuardado2!;
        break;
      case "÷":
        valorGuardado1 /= valorGuardado2!;
        break;
    }
    valorGuardado1Label = valorGuardado1;
    valorGuardado2Label = null;
  }

  void somaCalc() => _handleOperation("+");
  void subtracaoCalc() => _handleOperation("-");
  void multiplicacaoCalc() => _handleOperation("x");
  void divisaoCalc() => _handleOperation("÷");

  void resultadoCalc() {
    setState(() {
      if (textController1.text.isNotEmpty) {
        valorGuardado2 = double.tryParse(textController1.text) ?? 0;
        valorGuardado2Label = valorGuardado2;
        _calcularOperacaoAtual();
        result = "resultado $valorGuardado1";
        textController1.clear();
        calculo = "";
      }
    });
  }

  void clearFields() {
    setState(() {
      textController1.clear();
      result = "";
      valorGuardado1 = 0;
      valorGuardado1Label = null;
      valorGuardado2 = null;
      valorGuardado2Label = null;
      calculo = "";
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
              style: const TextStyle(fontSize: 20),
            ),
            InputWidget(controller: textController1, label: ""),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconButtonsRow(
                      soma: somaCalc,
                      subtracao: subtracaoCalc,
                      multiplicacao: multiplicacaoCalc,
                      divisao: divisaoCalc,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      result,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ]),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClearFieldsButton(
            onPressed: clearFields,
          ),
          const SizedBox(height: 10),
          ResultadoButton(
            onPressed: resultadoCalc,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

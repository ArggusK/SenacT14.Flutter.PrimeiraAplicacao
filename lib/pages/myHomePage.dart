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
  double valorGuardado2 = 0;
  double? valorGuardado1Label;
  double? valorGuardado2Label;
  String calculo = "";
  String result = "";
  String historico = "";

  void criarOperacao() {
    final inputText = textController1.text;
    if (inputText.isEmpty) {
      setState(() {
        result = "Erro: Insira um número";
      });
      return;
    }

    final parsedValue = double.tryParse(inputText);
    if (parsedValue == null) {
      setState(() {
        result = "Erro: Número inválido";
        textController1.clear();
      });
      return;
    }

    setState(() {
      valorGuardado2 = parsedValue;
      valorGuardado2Label = parsedValue;

      switch (calculo) {
        case "+":
          valorGuardado1 += valorGuardado2;
          break;
        case "-":
          valorGuardado1 -= valorGuardado2;
          break;
        case "x":
          valorGuardado1 *= valorGuardado2;
          break;
        case "÷":
          if (valorGuardado2 == 0) {
            result = "Erro: Divisão por zero";
            historico = "";
            valorGuardado1 = 0;
            valorGuardado1Label = null;
            calculo = "";
            valorGuardado2Label = null;
            textController1.clear();
            return;
          }
          valorGuardado1 /= valorGuardado2;
          break;
        default:
          valorGuardado1 = valorGuardado2;
          break;
      }

      result = "Resultado: $valorGuardado1";
      historico =
          "$valorGuardado1Label $calculo $valorGuardado2 = $valorGuardado1";

      valorGuardado1Label = valorGuardado1;
      valorGuardado2Label = null;
      textController1.clear();
    });
  }

  void somaCalc() {
    if (textController1.text.isEmpty && calculo.isEmpty) {
      setState(() {
        result = "Erro: Insira um número";
      });
      return;
    }
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        final parsedValue = double.tryParse(textController1.text);
        if (parsedValue == null) {
          result = "Erro: Número inválido";
          return;
        }
        valorGuardado1 = parsedValue;
        valorGuardado1Label = parsedValue;
        historico = "$valorGuardado1 +";
        textController1.clear();
      }
      calculo = "+";
    });
  }

  void subtracaoCalc() {
    if (textController1.text.isEmpty && calculo.isEmpty) {
      setState(() {
        result = "Erro: Insira um número";
      });
      return;
    }
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        final parsedValue = double.tryParse(textController1.text);
        if (parsedValue == null) {
          result = "Erro: Número inválido";
          return;
        }
        valorGuardado1 = parsedValue;
        valorGuardado1Label = parsedValue;
        historico = "$valorGuardado1 -";
        textController1.clear();
      }
      calculo = "-";
    });
  }

  void multiplicacaoCalc() {
    if (textController1.text.isEmpty && calculo.isEmpty) {
      setState(() {
        result = "Erro: Insira um número";
      });
      return;
    }
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        final parsedValue = double.tryParse(textController1.text);
        if (parsedValue == null) {
          result = "Erro: Número inválido";
          return;
        }
        valorGuardado1 = parsedValue;
        valorGuardado1Label = parsedValue;
        historico = "$valorGuardado1 x";
        textController1.clear();
      }
      calculo = "x";
    });
  }

  void divisaoCalc() {
    if (textController1.text.isEmpty && calculo.isEmpty) {
      setState(() {
        result = "Erro: Insira um número";
      });
      return;
    }
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        final parsedValue = double.tryParse(textController1.text);
        if (parsedValue == null) {
          result = "Erro: Número inválido";
          return;
        }
        valorGuardado1 = parsedValue;
        valorGuardado1Label = parsedValue;
        historico = "$valorGuardado1 ÷";
        textController1.clear();
      }
      calculo = "÷";
    });
  }

  void resultadoCalc() {
    criarOperacao();
    setState(() {
      calculo = "";
      historico = "";
    });
  }

  void clearFields() {
    setState(() {
      textController1.clear();
      result = "";
      valorGuardado1 = 0;
      valorGuardado1Label = null;
      calculo = "";
      valorGuardado2Label = null;
      historico = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              historico,
              style: const TextStyle(fontSize: 20),
            ),
            InputWidget(controller: textController1, label: ""),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconButtonsRow(
                      soma: somaCalc,
                      subtracao: subtracaoCalc,
                      multiplicacao: multiplicacaoCalc,
                      divisao: divisaoCalc,
                    ),
                    SizedBox(height: 16),
                    Text(
                      result,
                      style: TextStyle(fontSize: 16),
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
          SizedBox(height: 10),
          ResultadoButton(
            onPressed: resultadoCalc,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

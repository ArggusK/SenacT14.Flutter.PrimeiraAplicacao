import 'package:first_aplicaton_flutter/widgets/history_widget.dart';
import 'package:first_aplicaton_flutter/widgets/input_widget.dart';
import 'package:first_aplicaton_flutter/widgets/numericButto_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var textController1 = TextEditingController();
  List<String> history = [];
  double valorGuardado1 = 0;
  double valorGuardado2 = 0;
  double? valorGuardado1Label;
  double? valorGuardado2Label;
  String calculo = "";
  String historico = "";

  void criarOperacao() {
    final inputText = textController1.text;
    if (inputText.isEmpty) {
      setState(() {
        textController1.text = "Erro: Insira um número";
      });
      return;
    }

    final valorParsed = double.tryParse(inputText);
    if (valorParsed == null) {
      setState(() {
        textController1.text = "Erro: Número inválido";
      });
      return;
    }

    setState(() {
      valorGuardado2 = valorParsed;
      valorGuardado2Label = valorParsed;

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
            textController1.text = "Erro: Divisão por zero";
            historico = "";
            valorGuardado1 = 0;
            valorGuardado1Label = null;
            calculo = "";
            valorGuardado2Label = null;
            return;
          }
          valorGuardado1 /= valorGuardado2;
          break;
        default:
          valorGuardado1 = valorGuardado2;
          break;
      }

      textController1.text = valorGuardado1.toString();

      historico =
          "$valorGuardado1Label $calculo $valorGuardado2 = $valorGuardado1";

      history.add(
          "$valorGuardado1Label $calculo $valorGuardado2 = $valorGuardado1");

      valorGuardado1Label = valorGuardado1;
      valorGuardado2Label = null;
    });
  }

  void porcentagemCalc() {
    final inputText = textController1.text;
    if (inputText.isEmpty) {
      setState(() {
        textController1.text = "Erro: Insira um número";
      });
      return;
    }

    final parsedValue = double.tryParse(inputText);
    if (parsedValue == null) {
      setState(() {
        textController1.text = "Erro: Número inválido";
      });
      return;
    }

    setState(() {
      if (calculo.isNotEmpty && valorGuardado1Label != null) {
        switch (calculo) {
          case "+":
          case "-":
            valorGuardado2 = valorGuardado1 * (parsedValue / 100);
            break;
          case "x":
          case "÷":
            valorGuardado2 = parsedValue / 100;
            break;
          default:
            valorGuardado2 = parsedValue / 100;
            break;
        }

        textController1.text = valorGuardado2.toString();
      } else {
        valorGuardado2 = parsedValue / 100;
        textController1.text = valorGuardado2.toString();
      }
    });
  }

  void somaCalc() {
    if (textController1.text.isEmpty && calculo.isEmpty) {
      setState(() {
        textController1.text = "Erro: Insira um número";
      });
      return;
    }
    setState(() {
      if (calculo.isNotEmpty && valorGuardado1Label != null) {
        criarOperacao();
      } else {
        final parsedValue = double.tryParse(textController1.text);
        if (parsedValue == null) {
          textController1.text = "Erro: Número inválido";
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
        textController1.text = "Erro: Insira um número";
      });
      return;
    }
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        final parsedValue = double.tryParse(textController1.text);
        if (parsedValue == null) {
          textController1.text = "Erro: Número inválido";
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
        textController1.text = "Erro: Insira um número";
      });
      return;
    }
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        final parsedValue = double.tryParse(textController1.text);
        if (parsedValue == null) {
          textController1.text = "Erro: Número inválido";
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
        textController1.text = "Erro: Insira um número";
      });
      return;
    }
    setState(() {
      if (calculo.isNotEmpty) {
        criarOperacao();
      } else {
        final parsedValue = double.tryParse(textController1.text);
        if (parsedValue == null) {
          textController1.text = "Erro: Número inválido";
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
    });
  }

  void clearFields() {
    setState(() {
      textController1.clear();
      valorGuardado1 = 0;
      valorGuardado1Label = null;
      calculo = "";
      valorGuardado2Label = null;
      historico = "";
    });
  }

  void addNumber(String number) {
    setState(() {
      textController1.text += number;
    });
  }

  void exibirHistorico(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Calculation History'),
          content: HistoryWidget(history: history),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              exibirHistorico(context);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 16.0, right: 16.0),
            child: Text(
              historico,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          InputWidget(controller: textController1, label: ""),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumericButtons(
                  addNumber: addNumber,
                  divisaoCalc: divisaoCalc,
                  multiplicacaoCalc: multiplicacaoCalc,
                  subtracaoCalc: subtracaoCalc,
                  resultadoCalc: resultadoCalc,
                  somaCalc: somaCalc,
                  clearFields: clearFields,
                  clearInput: () {
                    setState(() {
                      textController1.clear();
                    });
                  },
                  backspace: () {
                    setState(() {
                      textController1.text = textController1.text.isNotEmpty
                          ? textController1.text
                              .substring(0, textController1.text.length - 1)
                          : "";
                    });
                  },
                  porcentagemCalc: porcentagemCalc,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

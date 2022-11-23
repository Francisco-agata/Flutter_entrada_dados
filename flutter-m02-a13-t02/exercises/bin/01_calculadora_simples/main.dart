import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraSimples());
}

class CalculadoraSimples extends StatefulWidget {
  const CalculadoraSimples({Key? key}) : super(key: key);

  @override
  _CalculadoraSimplesState createState() => _CalculadoraSimplesState();
}

class _CalculadoraSimplesState extends State<CalculadoraSimples> {
  // Declara��o dos atributos (vari�veis)
  TextEditingController campoValor1 = TextEditingController(text: "");
  TextEditingController campoValor2 = TextEditingController(text: "");
  num valor1 = 0, valor2 = 0, resultado = 0;
  Color corBase = Colors.grey.shade700;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          backgroundColor: corBase,
          title: const Text(
            "Calculadora Simples",
            style: TextStyle(
              fontSize: 28
            ),
          ),
        ),

        body: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              // Texto que mostra o Resultado do c�lculo
              Text(
                "Resultado: $resultado",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: corBase,
                ),
              ),

              const SizedBox(height: 20,),

              // Campo de Texto (input do valor 1)
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Informe o primeiro valor"),
                controller: campoValor1,
              ),

              // Campo de Texto (input do valor 2)
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Informe o segundo valor"),
                controller: campoValor2,
              ),

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Bot�o Somar
                  MaterialButton(
                    color: corBase,
                    onPressed: somar,
                    child: const Text(
                      "Somar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Bot�o Limpar
                  MaterialButton(
                    color: corBase,
                    onPressed: limparCampos,
                    child: const Text(
                      "Limpar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void somar() {
    if (campoValor1.text == "") {
      setState(() {
        valor1 = 0;
      });
      return;
    }

    if (campoValor2.text == "") {
      setState(() {
        valor2 = 0;
      });
      return;
    }

    setState(() {
      // Converte os campos de texto em valores num�ricos
      valor1 = num.parse(campoValor1.text);
      valor2 = num.parse(campoValor2.text);

      // Efetua o c�lculo e guarda o resultado
      resultado = valor1 + valor2;
    });
  }

  // Reseta os valores e Limpa os campos
  void limparCampos() {
    setState(() {
      valor1 = 0;
      valor2 = 0;
      resultado = 0;
      campoValor1.text = "";
      campoValor2.text = "";
    });
  }
}
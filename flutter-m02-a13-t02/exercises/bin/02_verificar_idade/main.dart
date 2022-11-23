import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Idade(),
    ),
  );
}

class Idade extends StatefulWidget {
  const Idade({Key? key}) : super(key: key);

  @override
  _IdadeState createState() => _IdadeState();
}

class _IdadeState extends State<Idade> {
  // Declara��o dos atributos (vari�veis)
  TextEditingController campoIdade = TextEditingController(text: "");
  num idade = 0;
  Color corBase = const Color(0xFF2974BB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: corBase,
        title: const Text(
          "Podes votar?",
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            // Campo de Texto (input da idade)
            TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Informe sua idade"),
              controller: campoIdade,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            MaterialButton(
              color: corBase,
              onPressed: verificarIdade,
              child: const Text(
                "Verificar Idade",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verificarIdade() {
    if (campoIdade.text == "") {
      setState(() {
        idade = 0;
        mostrarMensagem("informe sua idade");
      });
      return;
    }

    // Converte o campo de texto em valor num�rico
    idade = int.parse(campoIdade.text);

    // Verifica a faixa et�ria
    if (idade < 16) {
      mostrarMensagem("N�o podes votar");
    } else if (idade >= 18 && idade <= 65) {
      mostrarMensagem("Voto obrigat�rio!");
    } else {
      mostrarMensagem("Voto facultativo");
    }
  }

  void mostrarMensagem(String mensagem) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Foco(),
    ),
  );
}

class Foco extends StatefulWidget {
  const Foco({Key? key}) : super(key: key);

  @override
  _FocoState createState() => _FocoState();
}

class _FocoState extends State<Foco> {
  FocusNode campo1 = FocusNode();
  FocusNode campo2 = FocusNode();
  FocusNode campo3 = FocusNode();
  FocusNode campo4 = FocusNode();
  FocusNode campo5 = FocusNode();
  Color corBase = Colors.green.shade900;
  Random random = Random();
  int sorteado = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: corBase,
        title: const Text(
          "Focus Random",
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        margin: const EdgeInsets.only(top: 25),
        child: ListView(
          children: [
            Text(
              "Sorteado: $sorteado",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: corBase,
              ),
            ),

            const SizedBox(height: 10),

            // Input 1
            TextField(
              keyboardType: TextInputType.text,
              focusNode: campo1,
            ),

            // Input 2
            TextField(
              keyboardType: TextInputType.text,
              focusNode: campo2,
            ),

            // Input 3
            TextField(
              keyboardType: TextInputType.text,
              focusNode: campo3,
            ),

            // Input 4
            TextField(
              keyboardType: TextInputType.text,
              focusNode: campo4,
            ),

            // Input 5
            TextField(
              keyboardType: TextInputType.text,
              focusNode: campo5,
            ),

            const SizedBox(height: 20),

            MaterialButton(
              color: corBase,
              onPressed: sortearFoco,
              child: const Text(
                "Focus Random",
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

  void sortearFoco() {
    // Sorteia um número aleatório entre 1 e 5
    int numero = random.nextInt(5) +1;

    // Se o número for igual ao anterior, sorteia outro
    while (numero == sorteado) {
      numero = random.nextInt(5) +1;
    }

    switch (numero) {
      case 1:
        FocusScope.of(context).requestFocus(campo1);
        setState(() {
          sorteado = numero;
        });
        break;

      case 2:
        FocusScope.of(context).requestFocus(campo2);
        setState(() {
          sorteado = numero;
        });
        break;

      case 3:
        FocusScope.of(context).requestFocus(campo3);
        setState(() {
          sorteado = numero;
        });
        break;

      case 4:
        FocusScope.of(context).requestFocus(campo4);
        setState(() {
          sorteado = numero;
        });
        break;

      case 5:
        FocusScope.of(context).requestFocus(campo5);
        setState(() {
          sorteado = numero;
        });
        break;
    }
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Fatec Ferraz- Controle de Alunos",
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dado";

  void _calcularIMC() {
    setState(() {
      double x = double.parse(xController.text);

      double y = double.parse(yController.text);

      double result = x + y;

      _infoText = "${result}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculadora",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                size: 120,
                color: Color(0xff8c4140),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Número 1",
                ),
                controller: xController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Número 2",
                ),
                controller: yController,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _calcularIMC();
                    },
                    child: const Text(
                      'Somar',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                  ),
                ),
              ),
              Text(
                "Resultado: $_infoText",
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

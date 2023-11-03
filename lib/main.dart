import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ScaffoldHome(),
    );
  }
}

class ScaffoldHome extends StatelessWidget {
  const ScaffoldHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora Gorjeta"),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.blueGrey.shade400,
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});
 
 @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  TextEditingController textEditingController = TextEditingController();
  double gorjeta = 0.0;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/image-calc.jpg", width: 300, height: 200 ), //image
          Text(
            "R\$ ${gorjeta.toStringAsFixed(2)}", // Mostra o valor da gorjeta com duas casas decimais
            style:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: textEditingController,
            onChanged: (value) {
              setState(() {
                if (textEditingController.text.isNotEmpty) {
                  double valorConta = double.parse(textEditingController.text);
                  gorjeta = valorConta * 0.10; // Calcula a gorjeta como 10% do valor da conta
                } else {
                  gorjeta = 0.0;
                }
              });
            },
            decoration: InputDecoration(
              hintText: "Digite o valor da conta.",
              prefixIcon: const Icon(Icons.monetization_on),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(width: 2, color: Colors.blueGrey.shade400),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(width: 2, color: Colors.blueGrey.shade400),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ],
      ),
    );
  }
}

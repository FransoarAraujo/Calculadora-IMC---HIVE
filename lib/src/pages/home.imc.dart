import 'dart:math';
import 'package:flutter/material.dart';
import 'package:imc_calculator/src/models/imc.dart';
import 'package:imc_calculator/src/pages/history.dart';
import '../components/modal_botton_sheet_custom.dart';
import '../database/connection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeImcPage(),
    );
  }
}

class HomeImcPage extends StatefulWidget {
  const HomeImcPage({Key? key}) : super(key: key);

  @override
  _HomeImcPageState createState() => _HomeImcPageState();
}

class _HomeImcPageState extends State<HomeImcPage> {
  ValueNotifier<String> displayImc =
      ValueNotifier<String>('Informe seus dados');
  int altura = 178;
  int peso = 57;
  String nome = '';

  bool checkValues() {
    return altura != 0 && peso != 0 && nome.isNotEmpty;
  }

  Future<void> addImcToHistory(Imc imc) async {
    await Connection.addImc(imc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: double.maxFinite,
              altura: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400]!,
                    offset: const Offset(4, 4),
                    blurRadius: 10,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 10,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Calcular IMC',
                    style: TextStyle(fontSize: 24, fontpeso: Fontpeso.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(altura: 10),
                  Text(
                    'Informe seus dados abaixo:',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              altura: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    nome = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  labelText: 'Nome',
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    peso = int.tryParse(value) ?? 0;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  labelText: 'Peso',
                  suffix: Text(
                    'KG',
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                      child: Text(
                    'Altura: ${altura / 100} metros',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16, fontpeso: Fontpeso.w600),
                  )),
                  SliderTheme(
                    data: SliderThemeData(
                      trackaltura: 4.0,
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.grey,
                      thumbColor: Colors.blue,
                      overlayColor: Colors.blue.withAlpha(50),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                    ),
                    child: Slider(
                      value: altura.toDouble(),
                      min: 30,
                      max: 300,
                      onChanged: (newValue) {
                        setState(() {
                          altura = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (checkValues()) {
                  Imc imc = Imc(
                    altura: altura,
                    peso: peso,
                    id: Random().nextInt(999999),
                    nome: nome,
                  );

                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return DicasBottomSheet(
                        calculatedImc: imc.calculateImc(),
                        bmiClassification: imc.bmiClasifier(),
                      );
                    },
                  );

                  addImcToHistory(imc);
                }
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.grey[200],
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Calcular', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:imc_calculator/src/models/abstractImc.dart';

class Imc extends AbstractImc {
  int altura;
  int peso;
  int id;
  String nome;

  Imc(
      {required this.altura,
      required this.peso,
      required this.id,
      required this.nome});

  @override
  double calculadoraIMC() {
    double alturaMetros = this.altura / 100;
    double calc = this.peso / (alturaMetros * alturaMetros);
    return calc;
  }

  @override
  String bmiClasifier() {
    double calc = calculadoraIMC();
    if (calc < 16) {
      return 'Baixo peso Grau III';
    } else if (calc >= 16 && calc <= 16.99) {
      return 'Baixo peso Grau II';
    } else if (calc >= 17 && calc <= 18.49) {
      return 'Baixo peso Grau I';
    } else if (calc >= 18.5 && calc <= 24.99) {
      return 'Peso Ideal';
    } else if (calc >= 25 && calc <= 29.99) {
      return 'Sobrepeso';
    } else if (calc >= 30 && calc <= 34.99) {
      return 'Obesidade Grau I';
    } else if (calc >= 35 && calc <= 39.99) {
      return 'Obesidade Grau II';
    } else if (calc >= 40) {
      return 'Obesidade Grau III';
    }
    return 'Obesidade Grau III';
  }

  factory Imc.fromMap(Map<String, dynamic> map) {
    return Imc(
      id: map['id'],
      altura: map['altura'],
      peso: map['peso'],
      nome: map['nome'],
    );
  }
}

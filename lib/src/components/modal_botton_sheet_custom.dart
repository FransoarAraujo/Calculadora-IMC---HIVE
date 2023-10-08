import 'package:flutter/material.dart';

class DicasBottomSheet extends StatelessWidget {
  final double calculadoraImc;
  final String classifificao;

  const DicasBottomSheet({
    Key? key,
    required this.calculadoraImc,
    required this.classifificao,
  }) : super(key: key);

  String getDicas() {
    if (classifificao.contains('Baixo peso Grau III')) {
      return 'Dicas para melhorar sua saúde:\n\n'
          '1. Procure um médico para avaliar sua situação.\n'
          '2. Mantenha uma dieta balanceada e rica em nutrientes.\n'
          '3. Busque orientação profissional para ganho de peso saudável.';
    } else if (classifificao.contains('Baixo peso Grau II')) {
      return 'Dicas para melhorar sua saúde:\n\n'
          '1. Consulte um profissional de saúde para avaliar sua situação.\n'
          '2. Busque uma alimentação mais calórica e nutritiva.\n'
          '3. Considere praticar atividades físicas para fortalecer seus músculos.';
    } else if (classifificao.contains('Baixo peso Grau I')) {
      return 'Dicas para melhorar sua saúde:\n\n'
          '1. Mantenha uma dieta balanceada e variada.\n'
          '2. Pratique exercícios para melhorar sua resistência física.\n'
          '3. Consulte um profissional para monitorar seu ganho de peso.';
    } else if (classifificao.contains('Magreza')) {
      return 'Dicas para melhorar sua saúde:\n\n'
          '1. Busque uma dieta equilibrada com alimentos nutritivos.\n'
          '2. Pratique atividades físicas para ganhar força e energia.\n'
          '3. Consulte um médico ou nutricionista para orientações.';
    } else if (classifificao.contains('Peso Ideal')) {
      return 'Parabéns pela sua saúde!\n\n'
          'Continue mantendo hábitos saudáveis para preservar seu bem-estar.';
    } else if (classifificao.contains('Sobrepeso')) {
      return 'Dicas para melhorar sua saúde:\n\n'
          '1. Equilibre a ingestão de calorias.\n'
          '2. Aumente a atividade física.\n'
          '3. Evite excesso de alimentos ricos em açúcares e gorduras.';
    } else if (classifificao.contains('Obesidade Grau I')) {
      return 'Dicas para melhorar sua saúde:\n\n'
          '1. Adote uma alimentação saudável e controlada.\n'
          '2. Pratique exercícios físicos regularmente.\n'
          '3. Consulte um profissional de saúde para orientações.';
    } else if (classifificao.contains('Obesidade Grau II')) {
      return 'Dicas para melhorar sua saúde:\n\n'
          '1. Procure orientação médica para avaliar riscos.\n'
          '2. Estabeleça metas de perda de peso com profissionais.\n'
          '3. Mantenha uma rotina de alimentação e exercícios.';
    } else if (classifificao.contains('Obesidade Grau III')) {
      return 'Dicas para melhorar sua saúde:\n\n'
          '1. Busque apoio médico para cuidados intensivos.\n'
          '2. Considere tratamentos multidisciplinares.\n'
          '3. Adote hábitos saudáveis de forma gradual e segura.';
    }
    return 'Dicas para melhorar sua saúde:\n\n'
        'Consulte um profissional de saúde para orientações específicas.';
  }

  Color getCircleColor(double calculadoraImc) {
    if (calculadoraImc < 18.5) {
      return Colors.blue;
    } else if (calculadoraImc >= 18.5 && calculadoraImc <= 24.9) {
      return Colors.green;
    } else if (calculadoraImc >= 25 && calculadoraImc <= 29.9) {
      return Colors.orange;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    String alertTitle = 'Dicas de Saúde';
    String dicas = getDicas();
    Color circleColor = getCircleColor(calculadoraImc);

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            alertTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Seu IMC é ${calculadoraImc.toStringAsFixed(2)} (${classifificao}).',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: circleColor,
            ),
          ),
          SizedBox(height: 16),
          Text(
            dicas,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text('Fechar', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

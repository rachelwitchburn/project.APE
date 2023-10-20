import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TaxaMetabolicaBasal(),
  ));
}

class TaxaMetabolicaBasal extends StatefulWidget {
  @override
  _TaxaMetabolicaBasalState createState() => _TaxaMetabolicaBasalState();
}

class _TaxaMetabolicaBasalState extends State<TaxaMetabolicaBasal> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  double calcularTMB(double peso, double altura, int idade, String genero) {
    if (genero == 'masculino') {
      return 88.362 + (13.397 * peso) + (4.799 * altura) - (5.677 * idade);
    } else {
      return 447.593 + (9.247 * peso) + (3.098 * altura) - (4.330 * idade);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treinador, @'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                'Taxa metabólica basal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Peso (em kg)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text(
              'Altura (em cm)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text(
              'Idade',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double peso = double.parse(pesoController.text);
                double altura = double.parse(alturaController.text);
                int idade = int.parse(idadeController.text);

                //fem
                double tmb = calcularTMB(peso, altura, idade, 'feminino');

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Resultado'),
                      content:
                          Text('Sua Taxa Metabólica Basal é: $tmb kcal/dia'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Fechar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}

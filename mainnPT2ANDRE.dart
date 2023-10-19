import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(nome: 'André'));
}

class MyApp extends StatefulWidget {
  final String nome;
  MyApp({Key? key, this.nome = ''}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int qtAlunos = 3;
  String aluno1 = 'Ana Paula';
  String aluno2 = 'Sara';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print('clicou');

          print('Quantidade de alunos agora é de $qtAlunos');
          setState(() {
            qtAlunos = qtAlunos + 1;
          });
        },
        child: Text(
          '${widget.nome}, atualmente você tem ${qtAlunos} alunos',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}

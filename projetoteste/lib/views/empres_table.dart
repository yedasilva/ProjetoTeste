import 'package:flutter/material.dart';

class Emprestimo extends StatelessWidget {
  const Emprestimo({Key? key}) : super(key: key);

  static const String _title = 'Agenda de Retirada';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: EscolhaStatefulWidget(),
        ),
      ),
    );
  }
}

class EscolhaStatefulWidget extends StatefulWidget {
  const EscolhaStatefulWidget({Key? key}) : super(key: key);

  @override
  State<EscolhaStatefulWidget> createState() => EscolhaStatefulWidget();
}

class _EscolhaStatefulWidget extends State<EscolhaStatefulWidget> {
  final ScrollController _firstController = ScrollController();
  String dropdownValue = 'Título';
  String dropdownValue = 'Usuário';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  });
  }
}

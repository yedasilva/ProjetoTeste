import 'package:flutter/material.dart';
import 'package:projetoteste/dataTitles/provider/titles.dart';
import 'package:projetoteste/models/title.dart';
import 'package:projetoteste/provider/title.dart';
import 'package:provider/provider.dart';

class TitleForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map <String, String> _formData = {};

  void _loadFormData (Title title) {
    if (title != null) {
      _formData['id'] = title.id;
      _formData['titulo'] = title.titulo;
      _formData['ano'] = title.ano;
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments;

    _loadFormData(title);

    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Títulos'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                final isValid = _form.currentState.validate();

                if(isValid){
                _form.currentState.save();
                Provider.of<Titles>(context, listen: false).put(Title(
                  id: _formData['id'],
                  titulo: _formData['título'],
                  ano: _formData['ano'],
                ),
                );
                Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      initialValue: _formData['titulo'],
                      decoration: const InputDecoration(labelText: 'Título'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Título inválido';
                        }

                        if (value.trim().length < 3 {
                          return 'Título muito pequeno. No mínimo 3 letras.';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['titulo'] = value,
                      ),
                  TextFormField(
                    initialValue: _formData['ano'],
                    decoration: const InputDecoration(labelText: 'Ano'),
                    onSaved: (value) => _formData['ano'] = value,
                  ),
                ],
              ),
            ),
          ),
        );
  }
}

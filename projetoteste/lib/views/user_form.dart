import 'package:flutter/material.dart';
import 'package:projetoteste/dataUsers/models/user.dart';
import 'package:projetoteste/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map <String, String> _formData = {};

  void _loadFormData (User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['cpf'] = user.cpf;
      _formData['name'] = user.name;    
      _formData['telefone'] = user.telefone;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;

    _loadFormData(user);

    return Scaffold(
        appBar: AppBar(
          title: Text('Formulário de Usuário'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                final isValid = _form.currentState?.validate();

                if(isValid !=null && isValid){
                _form.currentState?.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'],
                  cpf: _formData['cpf'],
                  name: _formData['name'],
                  telefone: _formData['telefone'],
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
                      initialValue: _formData['name'],
                      decoration: const InputDecoration(labelText: 'Nome'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nome inválido';
                        }

                        if (value.trim().length < 3 {
                          return 'Nome muito pequeno. No mínimo 3 letras.';
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['name'] = value,
                      ),
                  TextFormField(
                    initialValue: _formData['CPF'],
                    decoration: const InputDecoration(labelText: 'CPF'),
                    onSaved: (value) => _formData['CFP'] = value,

                  ),
                  TextFormField(
                    initialValue: _formData['Telefone'],
                    decoration: const InputDecoration(labelText: 'Telefone'),
                    onSaved: (value) => _formData['Telefone'] = value,

                  ),
                ],
              ),
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:projetoteste/dataUsers/data/user_exemplo.dart';
import 'package:projetoteste/dataUsers/component/user_tile.dart';
import 'package:projetoteste/dataUsers/models/user.dart';
import 'package:projetoteste/provider/users.dart';
import 'package:projetoteste/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.userForm);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}

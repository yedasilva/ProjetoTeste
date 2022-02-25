import 'package:flutter/material.dart';
import 'package:projetoteste/data/user_exemplo.dart';
import 'package:projetoteste/component/title_tile.dart';
import 'package:projetoteste/dataTitles/component/title.tile.dart';
import 'package:projetoteste/models/title.dart';
import 'package:projetoteste/provider/titles.dart';
import 'package:projetoteste/routes/app_routes.dart';
import 'package:provider/provider.dart';

class TitleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Title title = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Titulos'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.titleForm);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: titles.count,
        itemBuilder: (ctx, i) => TitleTile(titles.byIndex(i)),
      ),
    );
  }
}

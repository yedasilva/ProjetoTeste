import 'package:flutter/material.dart';
import 'package:projetoteste/dataTitles/provider/titles.dart';
import 'package:projetoteste/dataTitles/models/title.dart';
import 'package:projetoteste/routes/app_routes.dart';
import 'package:provider/provider.dart';

class TitleTile extends StatelessWidget {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black87,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  final Title title;

  const TitleTile(this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.titulo),
      subtitle: Text(title.ano),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.titleForm,
                  arguments: title,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Título'),
                    content: Text('Tem certeza???'),
                    actions: <Widget>[
                      TextButton(
                        style: flatButtonStyle,
                        child: ('Não'),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      TextButton(
                        style: flatButtonStyle,
                        child: ('Sim'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<Titles>(context, listen: false).remove(title);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

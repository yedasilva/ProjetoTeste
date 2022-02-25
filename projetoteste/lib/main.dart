import 'package:flutter/material.dart';
import 'package:projetoteste/dataTitles/models/title.dart';
import 'package:projetoteste/dataTitles/provider/titles.dart';
import 'package:projetoteste/dataUsers/models/user.dart';
import 'package:projetoteste/routes/app_routes.dart';
import 'package:projetoteste/views/title_form.dart';
import 'package:projetoteste/views/user_form.dart';
import 'package:projetoteste/views/user_list.dart';
import 'package:projetoteste/dataUsers/provider/users.dart';
import 'package:projetoteste/dataTitles/provider/titles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Titles(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.home: (_) => UserList(),
          AppRoutes.userForm: (_) => UserForm(),
          AppRoutes.titleForm: (_) => TitleForm(),
        },
      ),
    );
  }
}

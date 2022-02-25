import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projetoteste/data/user_exemplo.dart';
import 'package:projetoteste/dataTitles/models/title.dart';
import 'package:projetoteste/dataUsers/models/title.dart';
import 'package:projetoteste/models/title.dart';

class Titles with ChangeNotifier {
  final Map<String, Title> _items = {...titleExemplo};

  List<Title> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Title title) {
    if (title == null) {
      return;
    }

    if (title.id != null &&
        !title.id.trim().isEmpty &&
        _items.containsKey(title.id)) {
      _items.update(
        title.id,
        (_) => Titles(
          id: title.id,
          titulo: title.titulo,
          ano: title.ano,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Title(
          id: id,
          titulo: title.titulo,
          ano: title.ano,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Title title) {
    if (title != null && title.id != null) {
      _items.remove(title.id);
      notifyListeners();
    }
  }
}

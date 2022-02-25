import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projetoteste/data/user_exemplo.dart';
import 'package:projetoteste/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...userExemplo};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        !user.id.trim().isEmpty &&
        _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          cpf: user.cpf,
          name: user.name,
          telefone: user.telefone,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          cpf: user.cpf,
          name: user.name,
          telefone: user.telefone,
        ),
      );
    }
    notifyListeners();
  }

  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}

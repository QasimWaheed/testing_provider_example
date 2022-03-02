import 'dart:collection';

import 'package:flutter/material.dart';

import '../model/bread_crumb.dart';

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _items = [];

  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(_items);

  void add(BreadCrumb breadCrumb) {
    for (final item in items) {
      item.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
}
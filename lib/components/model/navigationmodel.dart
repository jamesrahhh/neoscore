import 'package:flutter/material.dart';

class NavigationModel extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void setPageIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }
}

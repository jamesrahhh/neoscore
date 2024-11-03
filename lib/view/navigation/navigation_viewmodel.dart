import 'package:flutter/foundation.dart';

class NavigationViewModel extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void setPage(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';

class ClassificationClient with ChangeNotifier {
  var _order = 0;
  int get order => _order;
  
  void default1() {
    _order = 0;
    notifyListeners();
  }

  void az() {
    _order = 1;
    notifyListeners();
  }

  void za() {
    _order = 2;
    notifyListeners();
  }
}

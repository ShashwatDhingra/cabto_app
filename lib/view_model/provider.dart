import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier
{
  // Work for Out Station Chips
  int _outStation_selected_chip = -1;

  int get outStation_selected_chip => _outStation_selected_chip;

  void toogle(int newIndex)
  {
    _outStation_selected_chip = newIndex;
    notifyListeners();
  }

}
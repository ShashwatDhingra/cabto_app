import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  // Work for Out Station Chips
  int _outStation_selected_chip = -1; // Index

  int get outStation_selected_chip => _outStation_selected_chip;

  void toogleOutstationChip(int newIndex) {
    _outStation_selected_chip = newIndex;
    notifyListeners();
  }

  // Work for maintaining the homepage column ratio

  List<int> _ratio = [5, 5];

  List<int> get ratio => _ratio;

  void toogleRatio(List<int> newRatio) {
    _ratio = newRatio;

    notifyListeners();
  }

  // Work to toogle between tab options and book options

  bool _bookState = false;

  bool get bookState => _bookState;

  void toogleBookState(bool newVal) {
    _bookState = newVal;
  }

  // Work for selected Car

  int _selectedCarIndex = 0;

  int get selectedCarIndex => _selectedCarIndex;

  void toogleSelectedCar(int index)
  {
    _selectedCarIndex = index;
    notifyListeners();
  }

    // Work for Out Station Chips
  int _book_option_selected_chip = -1; // Index

  int get book_option_selected_chip => _book_option_selected_chip;

  void toogleBookOptionChip(int newIndex) {
    _book_option_selected_chip = newIndex;
    notifyListeners();
  }
}

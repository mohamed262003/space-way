import 'package:flutter/material.dart';

class VariableProvider extends ChangeNotifier {
  int selectedHotel = 0;
  int selectedTransportation = 0;
  int selectedActivity = -1;
  bool pickedDate = false;
  bool pickedCurrency = false;
  String countryCurrency = "EGP";
  DateTime userDate = DateTime.now();

  void updateSelectedHotel(int newValue) {
    selectedHotel = newValue;
    notifyListeners();
  }

  void updateSelectedTransportation(int newValue) {
    selectedTransportation = newValue;
    notifyListeners();
  }

  void updateSelectedActivity(int newValue) {
    selectedActivity = newValue;
    notifyListeners();
  }

  void updatePickedDate(bool newValue) {
    pickedDate = newValue;
    notifyListeners();
  }

  void updateDate(DateTime dateFromTimeLine) {
    userDate = dateFromTimeLine;
    notifyListeners();
  }

  void updatePickedCurrency(bool newValue) {
    pickedCurrency = newValue;
    notifyListeners();
  }

  void updateCountryCurrency(String newValue) {
    countryCurrency = newValue;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/controller/home_controller.dart';

class SetMoneyController extends ChangeNotifier {
  final TextEditingController inputMoney = TextEditingController();
  final controllerHome = HomeController();
  double? selectedTermValue;
  double? selectedltvValue;

  var indicator$ = ValueNotifier(34);
  var indexPage$ = ValueNotifier(0);
  var hasVisible$ = ValueNotifier(false);

  int get indicator => indicator$.value;
  int get indexPage => indexPage$.value;
  bool get hasVisible => hasVisible$.value;

  void sendData(bool hasProtected) async {
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('name');
    var email = prefs.getString('email');
    print(name);
    print(email);
    print(selectedTermValue == null ? 3 : 3);
    print(selectedltvValue == null ? 20.0 : 20.0);
    print(inputMoney.text
        .replaceAll('R', '')
        .replaceAll('\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.'));
    print(hasProtected);
  }

  void resetPage() {
    indexPage$.value = 0;
    indicator$.value = 34;
  }

  void incrementIndexPage() {
    indexPage$.value++;
    _incrementIndicator();
    _hasVisible();
    notifyListeners();
  }

  void decrementIndexPage(context) {
    if (indicator > 66) {
      indexPage$.value--;
      _decrementIndicator();
      _hasVisible();
    } else {
      Navigator.pop(context);
    }
    notifyListeners();
  }

  void _hasVisible() {
    if (indicator$.value > 67) {
      hasVisible$.value = true;
    } else {
      hasVisible$.value = false;
    }
    notifyListeners();
  }

  void _incrementIndicator() => indicator$.value = indicator$.value + 33;
  void _decrementIndicator() => indicator$.value = indicator$.value - 33;
}
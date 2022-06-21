import 'package:flutter/material.dart';

class SetMoneyController extends ChangeNotifier {
  final TextEditingController inputMoney = TextEditingController();
  double? selectedTermValue;
  double? selectedltvValue;

  var indicator$ = ValueNotifier(34);
  var indexPage$ = ValueNotifier(0);
  var hasVisible$ = ValueNotifier(false);

  int get indicator => indicator$.value;
  int get indexPage => indexPage$.value;
  bool get hasVisible => hasVisible$.value;

  void sendData() {
    print(selectedTermValue);
    print(selectedltvValue);
    print(inputMoney.text);
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

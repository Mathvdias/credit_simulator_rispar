import 'package:flutter/material.dart';

class SetMoneyController {
  final TextEditingController inputMoney = TextEditingController();

  var indicator$ = ValueNotifier(34);
  var indexPage$ = ValueNotifier(0);
  var hasVisible$ = ValueNotifier(false);

  int get indicator => indicator$.value;
  int get indexPage => indexPage$.value;
  bool get hasVisible => hasVisible$.value;

  void incrementIndexPage() {
    indexPage$.value++;
    _incrementIndicator();
    _hasVisible();
  }

  void decrementIndexPage(context) {
    if (indicator > 66) {
      indexPage$.value--;
      _decrementIndicator();
      _hasVisible();
    } else {
      Navigator.pop(context);
    }
  }

  void _hasVisible() {
    if (indicator$.value > 67) {
      hasVisible$.value = true;
    } else {
      hasVisible$.value = false;
    }
  }

  void _incrementIndicator() => indicator$.value = indicator$.value + 33;
  void _decrementIndicator() => indicator$.value = indicator$.value - 33;
}

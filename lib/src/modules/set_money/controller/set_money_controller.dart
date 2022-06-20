import 'package:flutter/material.dart';

class SetMoneyController {
  var indicator$ = ValueNotifier(34);
  var indexPage$ = ValueNotifier(0);
  var hasVisible$ = ValueNotifier(false);
  int get indicator => indicator$.value;
  int get indexPage => indexPage$.value;
  bool get hasVisible => hasVisible$.value;

  void _hasVisible() {
    if (indicator$.value > 67) {
      hasVisible$.value = true;
    } else {
      hasVisible$.value = false;
    }
  }

  void incrementIndicator() => indicator$.value = indicator$.value + 33;

  void incrementIndexPage() {
    indexPage$.value++;
    incrementIndicator();
    _hasVisible();
  }

  void decrementIndicator() => indicator$.value = indicator$.value - 33;

  void decrementIndexPage(context) {
    if (indicator > 66) {
      decrementIndicator();
      _hasVisible();
      indexPage$.value--;
    } else {
      Navigator.pop(context);
    }
  }
}

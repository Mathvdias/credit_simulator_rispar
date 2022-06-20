import 'package:flutter/material.dart';

class SetMoneyController {
  var indicator$ = ValueNotifier(34);
  var indexPage$ = ValueNotifier(0);
  int get indicator => indicator$.value;
  int get indexPage => indexPage$.value;

  void incrementIndicator() {
    indicator$.value + 34;
  }

  void incrementIndexPage() {
    indicator$.value++;
  }
}

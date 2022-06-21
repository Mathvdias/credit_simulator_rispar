import 'package:credit_simulator/src/data/model/response/exception_responde.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/model/response/send_data_model.dart';
import '../../../data/repository/impl/send_data_respository.dart';
import '../../home/controller/home_controller.dart';
import '../model/send_data_model.dart';

class SetMoneyController extends ChangeNotifier {
  SetMoneyController(this._iDataUserRepository);
  final DataUserRepository _iDataUserRepository;

  final TextEditingController inputMoney = TextEditingController();
  final controllerHome = HomeController();
  var result = DataModel();
  double? selectedTermValue;
  double? selectedltvValue;

  var indicator$ = ValueNotifier(34);
  var indexPage$ = ValueNotifier(0);
  var hasVisible$ = ValueNotifier(false);
  final state = ValueNotifier<ResultState>(ResultState.start);

  int get indicator => indicator$.value;
  int get indexPage => indexPage$.value;
  bool get hasVisible => hasVisible$.value;

  Future<void> sendData(bool hasProtected) async {
    state.value = ResultState.loading;
    final prefs = await SharedPreferences.getInstance();
    final String? _name = prefs.getString('name');
    final String? _email = prefs.getString('email');
    final double? _term = selectedTermValue == null ? 3 : 3;
    final _ltv = selectedltvValue == null ? 20.0 : 20.0;
    final _amount = inputMoney.text
        .replaceAll('R', '')
        .replaceAll('\$', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');
    var _value = double.parse(_amount);
    final data = SendDataUser(
      fullname: _name,
      email: _email,
      ltv: _ltv,
      amount: _value,
      term: _term,
      hasProtectedCollateral: hasProtected,
    );
    try {
      result = await _iDataUserRepository.sendData(data);
      state.value = ResultState.success;
    } on ExceptionResponse catch (e) {
      state.value = ResultState.error;
      print(e);
    }
    ;
    notifyListeners();
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

enum ResultState { start, loading, success, error }

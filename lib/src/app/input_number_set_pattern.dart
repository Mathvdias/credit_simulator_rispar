import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../components/app_rispar.dart';

class InputNumberFormField extends StatelessWidget {
  final String inputText;
  final TextEditingController controller;
  const InputNumberFormField({
    Key? key,
    required this.inputText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'campo é requerido';
          }
          var value$ = value
              .replaceAll('R', '')
              .replaceAll('\$', '')
              .replaceAll('.', '')
              .replaceAll(',', '.');
          var _value = double.parse(value$);

          if (_value.toDouble() < 500.00 || _value.toDouble() > 300000.00) {
            return 'Valor inválido';
          }

          return null;
        },
        style: const TextStyle(
            fontSize: 30,
            color: Color(0xff559597),
            fontWeight: FontWeight.bold),
        inputFormatters: [
          LengthLimitingTextInputFormatter(13),
          FilteringTextInputFormatter.digitsOnly,
          CurrencyInputFormatter()
        ],
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0xffcee9e7)),
          ),
          labelText: inputText,
        ),
        onChanged: (String? value) {},
      ),
    );
  }

  void validate() {}
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

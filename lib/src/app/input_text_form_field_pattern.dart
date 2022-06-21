import 'package:flutter/material.dart';

import '../components/app_rispar.dart';

class InputTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String inputText;
  const InputTextFormField({
    Key? key,
    required this.controller,
    required this.inputText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          labelText: inputText,
        ),
        onSaved: (String? value) {},
      ),
    );
  }
}

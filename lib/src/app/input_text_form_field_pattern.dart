import 'package:flutter/material.dart';

import '../components/app_rispar.dart';

class InputTextFormField extends StatelessWidget {
  final String inputText;
  const InputTextFormField({
    Key? key,
    required this.inputText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: inputText,
        ),
        onSaved: (String? value) {},
      ),
    );
  }
}

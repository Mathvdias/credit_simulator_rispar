import 'package:flutter/material.dart';

import '../../../../app/input_number_set_pattern.dart';
import '../../../../app/text_info_pattern.dart';
import '../../../../components/app_rispar.dart';

class SetMoneyQuantity extends StatefulWidget {
  final Function onNext;
  final TextEditingController text;
  const SetMoneyQuantity({
    Key? key,
    required this.onNext,
    required this.text,
  }) : super(key: key);

  @override
  State<SetMoneyQuantity> createState() => _SetMoneyQuantityState();
}

class _SetMoneyQuantityState extends State<SetMoneyQuantity> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _infoSetMoneyValue(),
            const TextInfoPattern(
                title: 'Insira um valor entre ',
                titleExtension: 'R\$500 a R\$300.000'),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        Form(
          key: _key,
          child: InputNumberFormField(
            controller: widget.text,
            inputText: '',
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kPadding, vertical: 50),
          child: SizedBox(
              width: double.maxFinite,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      widget.onNext();
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                  child: const Text(
                    "Continuar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
        )
      ],
    );
  }

  RichText _infoSetMoneyValue() {
    return RichText(
      text: const TextSpan(
          text: 'De quanto ',
          style: TextStyle(
              color: Color(0xff559597),
              fontSize: 25,
              fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: 'você precisa?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

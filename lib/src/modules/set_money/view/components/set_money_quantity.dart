import 'package:flutter/material.dart';

import '../../../../app/input_text_form_field_pattern.dart';
import '../../../../app/text_info_pattern.dart';
import '../../../../components/app_rispar.dart';

class SetMoneyQuantity extends StatefulWidget {
  final Function onNext;
  const SetMoneyQuantity({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  @override
  State<SetMoneyQuantity> createState() => _SetMoneyQuantityState();
}

class _SetMoneyQuantityState extends State<SetMoneyQuantity> {
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
        const InputTextFormField(
          inputText: '',
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
                  onPressed: () => widget.onNext(),
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
}

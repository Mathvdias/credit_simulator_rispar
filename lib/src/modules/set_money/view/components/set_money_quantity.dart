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
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                _infoSetMoneyValue(),
                const TextInfoPattern(
                    title: 'Insira um valor entre ',
                    titleExtension: 'R\$500 a R\$300.000'),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
            ),
            const InputTextFormField(
              inputText: '',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding),
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
        ),
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

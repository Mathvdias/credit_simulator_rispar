import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/input_number_set_pattern.dart';
import '../../../../app/text_info_pattern.dart';
import '../../../../components/app_rispar.dart';
import '../../controller/set_money_controller.dart';

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
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SetMoneyController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _infoSetMoneyValue(),
            const TextInfoPattern(
                title: 'Insira um valor entre ',
                titleExtension: 'R\$1000 a R\$300.000'),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        Form(
          key: _key,
          child: InputNumberFormField(
            controller: controller.inputMoney,
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

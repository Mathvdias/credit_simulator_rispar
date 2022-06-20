import 'package:flutter/material.dart';

import '../../../../app/text_info_pattern.dart';
import '../../../../components/app_rispar.dart';
import 'slider_component.dart';
import 'slider_component_percent.dart';

class SetDataPayment extends StatefulWidget {
  final Function onNext;
  const SetDataPayment({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  @override
  State<SetDataPayment> createState() => _SetDataPaymentState();
}

class _SetDataPaymentState extends State<SetDataPayment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextInfoPattern(fontSize: 25, titleExtension: 'Valor escolhido'),
        _textColorGreen('R\$25.000'),
        const TextInfoPattern(
            fontSize: 18,
            title: 'Escolha a ',
            titleExtension: 'quantidade de parcelas'),
        const SliderComponent(
          divisions: 3,
          max: 12,
          min: 3,
        ),
        const TextInfoPattern(
            fontSize: 18,
            title: 'Escolha o ',
            titleExtension: 'percentual de garantia'),
        const SliderComponentPercent(
          divisions: 2,
          max: 50,
          min: 20,
        ),
        
        _textColorGreen('Garantia protegida'),
        _buttonNextWithoutWarranty(),
        _buttonNextPage(),
      ],
    );
  }

  _buttonNextWithoutWarranty() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: SizedBox(
        width: double.maxFinite,
        height: 45,
        child: TextButton(
            onPressed: () {},
            child: const Text('Continuar sem garantia',
                style: TextStyle(fontWeight: FontWeight.bold))),
      ),
    );
  }

  _buttonNextPage() {
    return Padding(
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
    );
  }

  _textColorGreen(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: RichText(
        text: TextSpan(
          text: text,
          style: const TextStyle(
              color: Color(0xff559597),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

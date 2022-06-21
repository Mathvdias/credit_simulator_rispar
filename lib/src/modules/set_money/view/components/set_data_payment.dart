import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/text_info_pattern.dart';
import '../../../../components/app_rispar.dart';
import '../../controller/set_money_controller.dart';
import 'slider_component.dart';
import 'slider_component_percent.dart';

class SetDataPayment extends StatefulWidget {
  final TextEditingController text;
  final Function onNext;
  const SetDataPayment({
    Key? key,
    required this.text,
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
        _textColorGreen(widget.text.text),
        const Spacer(
          flex: 1,
        ),
        const TextInfoPattern(
            fontSize: 18,
            title: 'Escolha a ',
            titleExtension: 'quantidade de parcelas'),
        const SliderComponent(
          divisions: 3,
          max: 12,
          min: 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('3 ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text('6',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text(' 9',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text('12',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        const Spacer(
          flex: 1,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('20%',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text('35%',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text('50%',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        _textColorGreen('Garantia protegida'),
        _textInformationCrash(),
        const Spacer(
          flex: 4,
        ),
        _buttonNextWithoutWarranty(),
        _buttonNextPage(),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }

  Padding _textInformationCrash() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kPadding),
      child: Text(
          "Bitcoin caiu? Fique tranquilo! Na garantia \nprotegida, você não recebe chamada de\nmargem e não é liquidado.",
          style: TextStyle(color: Colors.black, fontSize: 15)),
    );
  }

  _buttonNextWithoutWarranty() {
    final controller = context.watch<SetMoneyController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: SizedBox(
        width: double.maxFinite,
        height: 45,
        child: TextButton(
            onPressed: () => controller.sendData(false),
            child: const Text('Continuar sem garantia',
                style: TextStyle(fontWeight: FontWeight.bold))),
      ),
    );
  }

  _buttonNextPage() {
    final controller = context.watch<SetMoneyController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: SizedBox(
          width: double.maxFinite,
          height: 45,
          child: ElevatedButton(
              onPressed: () {
                controller.sendData(true);
                widget.onNext();
              },
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
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../components/app_rispar.dart';
import '../../controller/set_money_controller.dart';

class ErrorComponent extends StatefulWidget {
  const ErrorComponent({Key? key}) : super(key: key);

  @override
  State<ErrorComponent> createState() => _ErrorComponentState();
}

class _ErrorComponentState extends State<ErrorComponent> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SetMoneyController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: SizedBox(
            width: double.maxFinite,
            height: 45,
            child: ElevatedButton(
              child: const Text(
                'Tentar novamente',
              ),
              onPressed: () => controller.sendData(false),
            ),
          ),
        ),
      ],
    );
  }
}

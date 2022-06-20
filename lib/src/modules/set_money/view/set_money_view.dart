import 'package:flutter/material.dart';

import '../controller/set_money_controller.dart';
import 'components/set_data_payment.dart';
import 'components/set_money_quantity.dart';

class SetMoneyView extends StatefulWidget {
  const SetMoneyView({Key? key}) : super(key: key);

  @override
  State<SetMoneyView> createState() => _SetMoneyViewState();
}

class _SetMoneyViewState extends State<SetMoneyView> {
  int indexPage = 0;
  final controller = SetMoneyController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarHome(context),
        body: Column(
          children: [
            IndexedStack(
              index: indexPage,
              children: [
                SetMoneyQuantity(onNext: onNexImplement),
                SetDataPayment(onNext: onBackImplement)
              ],
            ),
          ],
        ));
  }

  AppBar _appBarHome(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 80,
      actions: const [
        CloseButton(
          color: Color(0xff559597),
        )
      ],
      title: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: LinearProgressIndicator(
          value: controller.indicator$.value / 100,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
        color: const Color(0xff559597),
      ),
    );
  }

  onNexImplement() {
    setState(() {
      indexPage++;
    });
  }

  onBackImplement() {
    setState(() {
      indexPage--;
    });
  }
}

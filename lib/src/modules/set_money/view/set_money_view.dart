import 'package:flutter/material.dart';

import '../controller/set_money_controller.dart';
import 'components/result_data_solicitation.dart';
import 'components/set_data_payment.dart';
import 'components/set_money_quantity.dart';

class SetMoneyView extends StatefulWidget {
  const SetMoneyView({Key? key}) : super(key: key);

  @override
  State<SetMoneyView> createState() => _SetMoneyViewState();
}

class _SetMoneyViewState extends State<SetMoneyView> {
  final controller = SetMoneyController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarHome(context),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: controller.indexPage,
                  children: [
                    SetMoneyQuantity(onNext: onNextImplement),
                    SetDataPayment(onNext: onNextImplement),
                    ResultDataSolicitation(onNext: onBackImplement)
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  AppBar _appBarHome(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 80,
      actions: [
        Visibility(
          visible: controller.hasVisible,
          child: const CloseButton(
            color: Color(0xff559597),
          ),
        )
      ],
      title: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: LinearProgressIndicator(
          value: controller.indicator / 100,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => onBackImplement(),
        icon: const Icon(Icons.arrow_back),
        color: const Color(0xff559597),
      ),
    );
  }

  onNextImplement() {
    setState(() {
      controller.incrementIndexPage();
    });
  }

  onBackImplement() {
    setState(() {
      controller.decrementIndexPage(context);
    });
  }
}

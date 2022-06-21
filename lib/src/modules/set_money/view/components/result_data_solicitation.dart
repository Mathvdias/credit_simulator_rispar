import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/result_component.dart';
import '../../../../components/app_rispar.dart';
import '../../controller/set_money_controller.dart';

class ResultDataSolicitation extends StatefulWidget {
  final Function onNext;
  const ResultDataSolicitation({
    Key? key,
    required this.onNext,
  }) : super(key: key);

  @override
  State<ResultDataSolicitation> createState() => _ResultDataSolicitationState();
}

class _ResultDataSolicitationState extends State<ResultDataSolicitation> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SetMoneyController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return stateManagement(controller.state.value);
          },
        ),
      ],
    );
  }

  stateManagement(ResultState state) {
    switch (state) {
      case ResultState.start:
        return _start();
      case ResultState.loading:
        return _loading();
      case ResultState.success:
        return _success();
      case ResultState.error:
        return _error();

      default:
        return _start();
    }
  }

  _loading() {
    final controller = context.watch<SetMoneyController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Resultado da simulação',
                  style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        ComponentResult(
            text: 'Valor escolhido',
            result: controller.result.netValue.toString()),
        ComponentResult(
            text: 'Garantia', result: controller.result.collateral.toString()),
        ComponentResult(
            text: 'Taxa de juros',
            result: controller.result.interestRate.toString()),
        ComponentResult(
            text: 'Percentual de garantia',
            result: controller.result.ltv.toString()),
        ComponentResult(
            text: 'Primeiro vencimento',
            result: controller.result.firstDueDate.toString()),
        ComponentResult(
            text: 'IOF', result: controller.result.iofFee.toString()),
        const ComponentResult(text: 'Tarifa da plataforma', result: ":/"),
        ComponentResult(
            text: 'Total financiado',
            result: controller.result.contractValue.toString()),
        ComponentResult(
            text: 'CET mensal',
            result: controller.result.monthlyRate.toString()),
        ComponentResult(
            text: 'CET anual', result: controller.result.annualRate.toString()),
        ComponentResult(
            text: 'Cotação do BTC',
            result: controller.result.collateralUnitPrice.toString()),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kPadding,
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: SizedBox(
            width: double.maxFinite,
            height: 45,
            child: ElevatedButton(
                onPressed: () => widget.onNext(),
                child: const Text('Nova simulação')),
          ),
        ),
      ],
    );
  }

  _success() {
    return SizedBox(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Transform.scale(
            scale: 1.5,
            child: const CupertinoActivityIndicator(
              color: Color(0xff559597),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: const [
              Text('Aguarde um momento',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text('Estamos simulando seu pedido de',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              Text(' crédito Rispar...',
                  style: TextStyle(
                    color: Colors.black,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  _start() {
    return Container();
  }

  _error() {
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
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

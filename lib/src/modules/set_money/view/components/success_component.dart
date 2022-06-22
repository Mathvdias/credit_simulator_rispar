import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../components/result_component.dart';
import '../../../../components/app_rispar.dart';
import '../../controller/set_money_controller.dart';

class SuccesComponent extends StatefulWidget {
  final Function function;
  const SuccesComponent({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  State<SuccesComponent> createState() => _SuccesComponentState();
}

class _SuccesComponentState extends State<SuccesComponent> {
  @override
  Widget build(BuildContext context) {
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
                      fontSize: 25,
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
            result:
                'R\$ ${controller.result.netValue!.toStringAsFixed(2).replaceAll('.', ',')}'),
        ComponentResult(
            text: 'Garantia',
            result: '₿ ${controller.result.collateral!.toDouble() / 100000000}'
                .replaceAll('.', ',')),
        ComponentResult(
            text: 'Taxa de juros',
            result:
                '${controller.result.interestRate!.toStringAsFixed(2).replaceAll('.', ',')}% a.m'),
        ComponentResult(
            text: 'Percentual de garantia',
            result: '${controller.result.ltv}%'),
        ComponentResult(
            text: 'Primeiro vencimento',
            result: dataFormat(controller.result.lastDueDate.toString())),
        ComponentResult(
            text: 'IOF',
            result:
                'R\$ ${controller.result.iofFee!.toStringAsFixed(2).replaceAll('.', ',')}'),
        ComponentResult(
            text: 'Tarifa da plataforma',
            result:
                "R\$ ${controller.result.originationFee!.toStringAsFixed(2).replaceAll('.', ',')}"),
        ComponentResult(
            text: 'Total financiado',
            result:
                "R\$ ${controller.result.contractValue!.toStringAsFixed(2).replaceAll('.', ',')}"),
        ComponentResult(
            text: 'CET mensal',
            result:
                '${controller.result.monthlyRate!.toStringAsFixed(2).replaceAll('.', ',')}%'),
        ComponentResult(
            text: 'CET anual',
            result:
                '${controller.result.annualRate!.toStringAsFixed(2).replaceAll('.', ',')}%'),
        ComponentResult(
            text: 'Cotação do BTC',
            result:
                'R\$ ${controller.result.collateralUnitPrice!.toStringAsFixed(2).replaceAll('.', ',')}'),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kPadding,
              vertical: MediaQuery.of(context).size.height * 0.1),
          child: SizedBox(
            width: double.maxFinite,
            height: 45,
            child: ElevatedButton(
                onPressed: () => widget.function(),
                child: const Text('Nova simulação')),
          ),
        ),
      ],
    );
  }

  String dataFormat(String value) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    final date = DateTime.parse(value);
    final data = dateFormat.format(date);
    return data;
  }
}

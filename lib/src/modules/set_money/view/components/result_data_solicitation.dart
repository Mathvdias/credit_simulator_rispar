import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/set_money_controller.dart';
import 'error_component.dart';
import 'loading_component.dart';
import 'success_component.dart';

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
        return const LoadingComponent();
      case ResultState.success:
        return SuccesComponent(
          function: widget.onNext,
        );
      case ResultState.error:
        return const ErrorComponent();

      default:
        return _start();
    }
  }

  _start() {
    return Container();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

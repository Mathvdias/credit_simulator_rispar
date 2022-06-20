import 'package:flutter/material.dart';

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
    return Center(
      child: ElevatedButton(
          onPressed: () => widget.onNext(), child: const Text("Continuar1")),
    );
  }
}

import 'package:flutter/material.dart';

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
    return Center(
      child: ElevatedButton(
          onPressed: () => widget.onNext(), child: const Text("Continuar2")),
    );
  }
}

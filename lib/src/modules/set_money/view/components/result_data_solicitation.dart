import 'package:flutter/material.dart';

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
    return Center(
      child: ElevatedButton(
          onPressed: () => widget.onNext(), child: const Text("Continuar3")),
    );
  }
}

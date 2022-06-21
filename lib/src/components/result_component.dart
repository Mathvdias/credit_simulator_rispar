import 'package:flutter/material.dart';

import 'app_rispar.dart';

class ComponentResult extends StatelessWidget {
  final String text;
  final String result;
  const ComponentResult({
    Key? key,
    required this.text,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text(result)
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}

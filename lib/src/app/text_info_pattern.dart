import 'package:flutter/material.dart';

import '../components/app_rispar.dart';

class TextInfoPattern extends StatelessWidget {
  final String title;
  final String titleExtension;
  const TextInfoPattern({
    Key? key,
    required this.title,
    required this.titleExtension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: RichText(
        text: TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            children: <TextSpan>[
              TextSpan(
                text: titleExtension,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
    );
  }
}

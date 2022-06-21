import 'package:flutter/material.dart';

import '../components/app_rispar.dart';

class TextInfoPattern extends StatelessWidget {
  final String? title;
  final String? titleExtension;
  final double? fontSize;
  const TextInfoPattern({
    Key? key,
    this.title,
    this.titleExtension,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: RichText(
        text: TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
            ),
            children: <TextSpan>[
              TextSpan(
                text: titleExtension,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
    );
  }
}

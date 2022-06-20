import 'package:flutter/material.dart';

import '../../../../components/app_rispar.dart';

class TextSimulatorHome extends StatelessWidget {
  const TextSimulatorHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
                text: 'Simule',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: ' agora',
                    style: TextStyle(
                        color: Color(0xff559597),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Crédito rápido, fácil e seguro! :)",
            style: TextStyle(color: Colors.black, fontSize: 15),
          )
        ],
      ),
    );
  }
}

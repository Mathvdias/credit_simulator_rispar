import 'package:credit_simulator/src/app/themes/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Container(
                width: double.maxFinite,
                color: const Color(0xffcee9e7),
                child: SvgPicture.asset(mainCrypto)),
          ),
          Flexible(
            child: Column(
              children: [
                RichText(
                  text: const TextSpan(
                      text: 'Simule',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' agora',
                          style: TextStyle(
                            color: Color(0xff559597),
                            fontSize: 25,
                          ),
                        )
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

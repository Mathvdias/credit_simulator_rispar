import 'package:flutter/material.dart';

import '../app/themes/app_colors.dart';
import '../modules/home/home_page.dart';


class AppRispar extends StatelessWidget {
  const AppRispar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff559597, colorGreen),
      ),
      home: const HomePage(),
    );
  }
}

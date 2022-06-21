import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/themes/app_colors.dart';
import '../modules/home/controller/home_controller.dart';
import '../modules/home/view/home_page.dart';
import '../modules/set_money/controller/set_money_controller.dart';

class AppRispar extends StatelessWidget {
  const AppRispar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SetMoneyController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: MaterialColor(0xff559597, colorGreen),
        ),
        home: const HomePage(),
      ),
    );
  }
}

const double kPadding = 32;

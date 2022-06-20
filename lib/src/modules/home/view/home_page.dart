import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/images.dart';
import '../../../app/input_text_form_field_pattern.dart';
import '../../../app/text_info_pattern.dart';
import '../../../components/app_rispar.dart';
import '../../set_money/view/set_money_view.dart';
import '../controller/home_controller.dart';
import 'components/text_simulator_component_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    controller.email;
    controller.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keyBoardIsHide = MediaQuery.of(context).viewInsets.bottom == 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Visibility(
              visible: keyBoardIsHide,
              child: _logoMainCryptoSimulator(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: !keyBoardIsHide,
                  child: const SizedBox(
                    height: 100,
                  ),
                ),
                const TextSimulatorHome(),
                _inputComponentUser(),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kPadding, vertical: 50),
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SetMoneyView()),
                            );
                          },
                          child: const Text(
                            "Continuar",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _logoMainCryptoSimulator(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height * .4,
        child: Stack(
          children: [
            Container(
              color: const Color(0xffcee9e7).withOpacity(.4),
            ),
            Center(
              child: SvgPicture.asset(
                mainCrypto,
                height: 250,
              ),
            ),
          ],
        ));
  }

  _inputComponentUser() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TextInfoPattern(title: 'Qual seu ', titleExtension: 'nome completo?'),
        InputTextFormField(
          inputText: 'Nome completo',
        ),
        SizedBox(height: 20),
        TextInfoPattern(title: 'E seu ', titleExtension: 'e-mail?'),
        InputTextFormField(
          inputText: 'seuemail@email.com',
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

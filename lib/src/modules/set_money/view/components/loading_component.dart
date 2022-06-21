import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingComponent extends StatefulWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  @override
  State<LoadingComponent> createState() => _LoadingComponentState();
}

class _LoadingComponentState extends State<LoadingComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Transform.scale(
            scale: 1.5,
            child: const CupertinoActivityIndicator(
              color: Color(0xff559597),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: const [
              Text('Aguarde um momento',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text('Estamos simulando seu pedido de',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              Text(' crédito Rispar...',
                  style: TextStyle(
                    color: Colors.black,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> colorGreen = {
  50:  const Color.fromRGBO(85, 149, 151, .1),
  100: const Color.fromRGBO(85, 149, 151, .2),
  200: const Color.fromRGBO(85, 149, 151, .3),
  300: const Color.fromRGBO(85, 149, 151, .4),
  400: const Color.fromRGBO(85, 149, 151, .5),
  500: const Color.fromRGBO(85, 149, 151, .6),
  600: const Color.fromRGBO(85, 149, 151, .7),
  700: const Color.fromRGBO(85, 149, 151, .8),
  800: const Color.fromRGBO(85, 149, 151, .9),
  900: const Color.fromRGBO(85, 149, 151, 1),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff559597, colorGreen),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
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

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mainScreen),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${S.of(context).language}: ", style: TextStyle(fontSize: 15),),
              DropdownButton<String>(
                  value: Intl.getCurrentLocale(),
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text("${S.of(context).english}"),
                    ),
                    DropdownMenuItem(
                      value: 'ru_RU',
                      child: Text("${S.of(context).russian}"),
                    )
                  ],
                  onChanged: (value) async {
                    if (value == 'ru_RU') {
                      await S.load(const Locale('ru', 'RU'));
                      setState(() {});
                    } else if (value == 'en') {
                      await S.load(const Locale('en'));
                      setState(() {});
                    }
                  })
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("${S.of(context).counter}"),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _decrementCounter();
                  },
                  child: Text("-")),
              ElevatedButton(
                  onPressed: () {
                    _incrementCounter();
                  },
                  child: Text("+"))
            ],
          )
        ],
      ),
    );
  }
}

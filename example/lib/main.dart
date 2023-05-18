import 'package:flutter/material.dart';
import 'package:flutter_budpay/flutter_budpay.dart';

void main() async {
  await BudpayPlugin.initialize(
    publicKey: "PUBLIC_KEY",
    secretKey: "SECRET_KEY",
  ).then(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final budPay = BudpayPlugin();

  void _tester() {
    budPay.checkOut({
      "email": "customer@email.com",
      "amount": "20000",
      "currency": "NGN", //NGN, USD or GBP
      "callback": "youcallbackurl"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Testing BudPay"),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: _tester,
        tooltip: 'test',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

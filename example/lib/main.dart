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
      home: const MyHomePage(title: 'Budpay Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final budPay = BudpayPlugin();

  void _checkOut() {
    // checkout payment with card
    budPay
        .checkOut(
          payloads: CheckOut(
            email: "customer@gmail.com", // user email
            firstName: "firstName", // user first name
            lastName: "lastName", // user last name
            currency: "currency", // currency code e.g [NGN, GHS, USD]
            reference: "", // reference code []
            amount: "amount", // amount
          ),
        )
        .then((response) => print(response));
  }

  void _verifyTransaction() {
    // verifyTransaction : check if a transaction is successful or failed.
    budPay
        .verifyTransaction(reference: "BUD_pay2023")
        .then((response) => print(response));
  }

  void _getAllTransaction() {
    // get all available Transaction.
    budPay.getAllTransaction().then((response) => print(response));
  }

  void _getSingleTransaction() {
    // get single Transaction.
    budPay.getSingleTransaction(tnxID: "").then((response) => print(response));
  }

  void _payWithBankTransfer() {
    // pay with bank transfer
    budPay
        .payWithBankTransfer(
          payloads: BankTransfer(
            email: "customer@gmail.com",
            fullName: "white coode",
            currency: "currency", // currency code e.g [NGN, GHS, USD]
            amount: "",
          ),
        )
        .then((response) => print(response));
  }

  void _requestPayment() {
    // Request Payment
    budPay
        .requestPayment(
          payloads: RequestPayment(
            description: "", // description for the bank transfer
            recipient: "",
            currency: "currency", // currency code e.g [NGN, GHS, USD]
            amount: "",
          ),
        )
        .then((response) => print(response));
  }

  void _createPaymentLink() {
    // create Payment Link
    budPay
        .createPaymentLink(
          payloads: CreatePaymentLink(
            description: "", // description for the payment
            name: "", // Customer's fullname name
            redirectURL: "", // 	redirect url
            currency: "currency", // currency code e.g [NGN, GHS, USD]
            amount: "",
          ),
        )
        .then((response) => print(response));
  }

  void _createCustomer() {
    // create Payment Link
    budPay
        .createCustomer(
          payloads: Customer(
            email: "", // customer email
            firstName: "", // customer firstName
            lastName: "", // customer lastName
            phoneNumber: "", // customer phoneNumber
          ),
        )
        .then((response) => print(response));
  }

  void _createVirtualAccount() {
    // create Payment Link
    budPay
        .createVirtualAccount(
          payloads: Customer(
            customer: "", // customer code
            email: "", // customer email [OPTIONAL]
            firstName: "", // customer firstName [OPTIONAL]
            lastName: "", // customer lastName [OPTIONAL]
            phoneNumber: "", // customer phoneNumber [OPTIONAL]
          ),
        )
        .then((response) => print(response));
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
        onPressed: _checkOut,
        tooltip: 'test',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

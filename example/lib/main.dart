import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:flutter/material.dart';
import '_screens.dart';

void main() async {
  await BudpayPlugin.initialize(
          publicKey: "pk_test_jv8yueg1ycwkowviqw91swbewglvziwde9idpd",
          secretKey: "sk_test_3xd7ybrhumna6sn9kumn3eqljal6lghshb3uiu9",
          signatureKey: "")
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budpay Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
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
  // BudpayPlugin constructor
  final budPay = BudpayPlugin();

  // creating reference variable: [OPTIONAL]
  String reference = DateTime.now().millisecondsSinceEpoch.toString();
  void _standardCheckout() {
    // standardCheckout payment with card
    budPay
        .standardCheckout(
          payloads: CheckOut(
            email: "customer@gmail.com", // user email
            currency: "NGN", // currency code e.g [NGN, GHS, USD]
            reference: reference, // reference code [OPTIONAL]
            callBackURL: "", // reference code [OPTIONAL]`
            amount: "20000", // amount
          ),
        )
        .then((response) => print(response));
  }

  void _verifyTransaction() {
    // verifyTransaction : check if a transaction is successful or failed.
    budPay
        .verifyTransaction(reference: ":reference")
        .then((response) => print(response))
        .catchError((err) => print(err));
  }

  void _getAllTransaction() {
    // get all available Transaction.
    budPay.getAllTransaction().then((response) => print(response));
  }

  void _getSingleTransaction() {
    // get single Transaction.
    budPay.getSingleTransaction(tnxID: "4").then((response) => print(response));
  }

  void _payWithBankTransfer() {
    // pay with bank transfer
    budPay
        .payWithBankTransfer(
          payloads: BankTransfer(
            email: "test@test.com",
            fullName: "white coode",
            currency: "NGN", // currency code e.g [NGN, GHS, USD]
            amount: "100",
            reference: reference,
          ),
        )
        .then((response) => print(response)); // TODO Work
  }

  void _requestPayment() {
    // Request Payment
    budPay
        .requestPayment(
          payloads: RequestPayment(
            description:
                "testing payment request", // description for the bank transfer
            recipient:
                "toluxsys@yahoo.ca,07036218209,sam@bud.africa,08161112404",
            currency: "NGN", // currency code e.g [NGN, GHS, USD]
            amount: "200",
          ),
        )
        .then((response) => print(response));
  }

  void _createPaymentLink() {
    // create Payment Link
    budPay
        .createPaymentLink(
          payloads: CreatePaymentLink(
            description: "description", // description for the payment
            name: "Coode Ridwanullahi", // Customer's fullname name
            redirectURL: "https://your_redirect_link", // 	redirect url
            currency: "NGN", // currency code e.g [NGN, GHS, USD]
            amount: "2500",
          ),
        )
        .then((response) => print(response));
  }

  void _createCustomer() {
    // create Payment Link
    budPay
        .createCustomer(
          payloads: Customer(
            email: "zero@budpay.com", // customer email
            firstName: "Zero", // customer firstName
            lastName: "sum", // customer lastName
            phoneNumber: "+2348123456789", // customer phoneNumber
          ),
        )
        .then((response) => print(response));
  }

  void _createVirtualAccount() {
    // create Payment Link
    budPay
        .createVirtualAccount(
          payloads: Customer(
            customer: "CUS_3hqlcizuoffygev", // customer code
            email: "", // customer email [OPTIONAL]
            firstName: "", // customer firstName [OPTIONAL]
            lastName: "", // customer lastName [OPTIONAL]
            phoneNumber: "", // customer phoneNumber [OPTIONAL]
          ),
        )
        .then((response) => print(response)); // TODO Worked
  }

  void _getVirtualAccount() {
    budPay.getVirtualAccounts().then((response) => print(response));
  }

  void _createRefund() {
    budPay
        .createRefund(payloads: Refund(reference: "BUD_4503320239329292929"))
        .then((response) => print(response));
  }

  void _getRefunds() {
    budPay.getRefunds().then((response) => print(response));
  }

  void _getRefund() {
    budPay
        .getRefund(reference: "RF_shpfemttkvpvcoc")
        .then((response) => print(response));
  }

  void _bankList() {
    budPay.bankList().then((response) => print(response));
  }

  void _bankListWithSpecificCurrency() {
    budPay
        .bankListWithSpecificCurrency(currency: "KES")
        .then((response) => print(response));
  }

  void _accountNameValidation() {
    budPay
        .accountNameValidation(
          payloads: Account(
            accountNumber: "0050883605",
            bankCode: "000013",
          ),
        )
        .then((response) => print(response));
  }

  void _singlePayout() {
    budPay
        .singlePayout(
          payloads: SingleTransfer(
            accountNumber: "0050883605",
            bankCode: "000013",
            amount: "2000",
            narration: "Test transfer",
            bankName: "GUARANTY TRUST BANK",
            paymentMode: "momo",
            currency: "NGN",
          ),
        )
        .then((response) => print(response));
  }

  void _bulkPayout() {
    budPay
        .bulkPayout(
          payloads: BulkTransfer.fromJson({
            "currency": "NGN",
            "transfers": [
              {
                "amount": "200",
                "bank_code": "000013",
                "bank_name": "GUARANTY TRUST BANK",
                "account_number": "0050883605",
                "narration": "January Salary"
              },
              {
                "amount": "100",
                "bank_code": "000013",
                "bank_name": "GUARANTY TRUST BANK",
                "account_number": "0050883605",
                "narration": "February  Salary"
              },
              {
                "amount": "100",
                "bank_code": "000013",
                "bank_name": "GUARANTY TRUST BANK",
                "account_number": "0050883605",
                "narration": "March  Salary"
              }
            ]
          }),
        )
        .then((response) => print(response));
  }

  void _verifyPayout() {
    budPay
        .verifyPayout(reference: "trf_11044f068j1604")
        .then((response) => print(response));
  }

  void _getListAllPayout() {
    budPay.getListAllPayout().then((response) => print(response));
  }

  void _payoutFee() {
    budPay.payoutFee().then((response) => print(response));
  }

  void _walletBalance() {
    budPay.walletBalance(currency: "NGN").then((response) => print(response));
  }

  void _walletTransaction() {
    budPay
        .walletTransaction(currency: "NGN")
        .then((response) => print(response));
  }

  void _airtimeProviders() {
    budPay.airtimeProviders().then((response) => print(response));
  }

  void _airtimeTopUp() {
    budPay
        .airtimeTopUp(
          payload: Airtime(
            provider: "MTN",
            number: "07036218209",
            amount: "100",
            reference: reference,
          ),
        )
        .then((response) => print(response));
  }

  void _getInternetProviders() {
    budPay.getInternetProviders().then((response) => print(response));
  }

  void _getAllInternetDataPlans() {
    budPay
        .getAllInternetDataPlans(provider: "MTN")
        .then((response) => print(response));
  }

  void _internetTopUp() {
    budPay
        .internetTopUp(
          payloads: Internet(
            provider: "MTN",
            number: "07036218209",
            planID: "238",
            reference: reference,
          ),
        )
        .then((response) => print(response));
  }

  void _getTvs() {
    budPay.getTvs().then((response) => print(response));
  }

  void _getTvPackages() {
    budPay.getTvPackages(provider: "GOTV").then((response) => print(response));
  }

  void _tvValidate() {
    budPay
        .tvValidate(
            payloads: TvProvider(provider: "GOTV", number: "2019505346"))
        .then((response) => print(response));
  }

  void _payTv() {
    budPay
        .payTv(
          payloads: TvProvider(
            provider: "GOTV",
            number: "2019505346",
            planID: "gotv-max",
            reference: reference,
          ),
        )
        .then((response) => print(response));
  }

  void _getElectricity() {
    budPay.getElectricity().then((response) => print(response));
  }

  void _validateElectricity() {
    budPay
        .validateElectricity(
          payloads: ElectricityProvider(
            provider: "IBEDC",
            number: "1111111111111",
            type: "prepaid",
          ),
        )
        .then((response) => print(response));
  }

  void _electricityRecharge() {
    budPay
        .electricityRecharge(
          payloads: ElectricityProvider(
            provider: "IKEDC",
            number: "1111111111111",
            type: "prepaid",
            amount: "1000",
            reference: reference,
          ),
        )
        .then((response) => print(response));
  }

  void _verifyAccountNumber() {
    budPay
        .verifyAccountNumber(
          payloads: Account(bankCode: "000013", accountNumber: "0050883605"),
        )
        .then((response) => print(response));
  }

  void _verifyBVN() {
    budPay
        .verifyBVN(
          payloads: BVN(
            bvnNumber: "00000000000",
            callbackUrl: "http://your_webhook_url",
            firstName: "Tolulope",
            lastName: "Samuel",
            phoneNumber: "08011111111",
            dob: "1972-12-03",
            gender: "Male",
            reference: "20220540300003938",
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
        onPressed: _getAllTransaction,
        tooltip: 'test',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

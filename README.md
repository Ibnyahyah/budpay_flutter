<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
budpay_flutter allow you to utilize all budpay API utilities in budpay_flutter SDK. This package can be used to payment integration, bills payments, fast and automated transfers, and lot more in more than 198 countries. Budpay is fast and secure.

## Features

This package can be used to payment integration, bills payments, fast and automated transfers, and lot more. You can also generate virtual banks accounts, send money to your friends and families via bank transfer. It's also include a checkout payment system.

## Getting started

To get started, run the following command in your project directory terminal:
```flutter pub add budpay_flutter```

This will add `budpay_flutter` to your project.
## Usage

Setup your `projectName/main.dart` as follow
```dart
void main() async {
  await BudpayPlugin.initialize(
    publicKey: "pk_test_jv8yueg1ycwkowviqw91swbewglvziwde9idpd",
    secretKey: "sk_test_3xd7ybrhumna6sn9kumn3eqljal6lghshb3uiu9",
    signatureKey: ""
  ).then((_) {
    runApp(const MyApp());
  });
}
```
In the above code block you initalize `budpay_flutter` in you main function.

```dart
// BudpayPlugin constructor
final budPay = BudpayPlugin();

// creating reference variable: [OPTIONAL]
String reference = DateTime.now().millisecondsSinceEpoch.toString();
void _checkOut() {
// checkout payment with card
budPay
    .checkOut(
        payloads: CheckOut(
        email: "customer@gmail.com", // user email
        currency: "NGN", // currency code e.g [NGN, GHS, USD]
        reference: reference, // reference code [OPTIONAL]
        callBackURL: "", // reference code [OPTIONAL]
        amount: "20000", // amount
        ),
    )
    .then((response) => print(response)); // TODO worked
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
// Airtime topup
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

```

For more example, check out the [example Folder]("https://github.com/Ibnyahyah/budpay_flutter/tree/master/example").



## Additional information
This library is create by [Whitecoode]("https://twitter.com/whitecoode"), for more information contact via [Gmail at yahyahridwan665@gmail.com]("mailto:yahyahridwan665@gmail.com").

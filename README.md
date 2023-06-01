# Budpay Flutter
[Budpay](http://budpay.com) is a payment gateway, [budpay_flutter](https://pub.dev/packages/budpay_flutter) make is of Budpay API for easy use of [Budpay](http://budpay.com). It's allow flutter developers to make quick call to [Budpay](http://budpay.com) in no time. [budpay_flutter](https://pub.dev/packages/budpay_flutter) contain payment integration, bills payments, fast and automated transfers, and lot more in more than 198 countries. [Budpay](http://budpay.com) is fast and secure.

### NOTE - you must pass the parameters correctly and accordingly. hover over the method name for detailed information.
# Features
This package can be used to payment integration, bills payments, fast and automated transfers, and lot more. You can also generate virtual banks accounts, send money to your friends and families via bank transfer. It's also include a standardCheckout payment system.

# Getting started
To get started, run the following command in your project directory terminal:
```flutter pub add budpay_flutter```

This will add `budpay_flutter` to your project.
# Usage

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

### - Accept Payment 
```dart
// Initialize BudpayPlugin constructor
final budPay = BudpayPlugin();
```
```dart
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
        callBackURL: "", // reference code [OPTIONAL]
        amount: "20000", // amount
        ),
    )
    .then((response) => print(response)); // TODO worked
}
```
Others functions for accept payment includes

```dart
budpay.verifyTransaction();
budpay.getAllTransaction();
budpay.getSingleTransaction();
budpay.payWithBankTransfer();
```
### - Payment Features
```dart
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
  ```
Others functions for payment features includes

```dart
budpay.createPaymentLink();
budpay.createCustomer();
budpay.createVirtualAccount();
budpay.getVirtualAccounts();
budpay.createRefund();
budpay.getRefund();
budpay.getRefunds();
```

###  - Payouts
```dart
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
```
Others functions for payout includes

```dart
budpay.bankList();
budpay.bankListWithSpecificCurrency();
budpay.accountNameValidation();
budpay.bulkPayout();
budpay.verifyPayout();
budpay.getListAllPayout();
budpay.payoutFee();
budpay.walletBalance();
budpay.walletTransaction();
```

### - Bills Payment
This allow you you pay your bills, example airtime purchase, internet purchases, television subscriptions and more.
```dart
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
Others functions for bill payment includes

```dart
budpay.airtimeProviders();
budpay.getInternetProviders();
budpay.getAllInternetDataPlans();
budpay.internetTopUp();
budpay.getTvs();
budpay.getTvPackages();
budpay.tvValidate();
budpay.payTv();
budpay.getElectricity();
budpay.validateElectricity();
budpay.electricityRecharge();
```


For more example, check out the [example Folder](https://github.com/Ibnyahyah/budpay_flutter/tree/master/example).

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Author information
This library is create by [Whitecoode](https://twitter.com/whitecoode), for more information contact via [Gmail at yahyahridwan665@gmail.com](mailto:yahyahridwan665@gmail.com).Follow on Github [Ibnyahyah](http://github.com/ibnyahyah) and Twitter [Whitecoode](https://twitter.com/whitecoode)

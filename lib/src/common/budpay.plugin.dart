import 'package:budpay_flutter/budpay_flutter.dart';
import 'package:flutter/material.dart';

import '../models/_models.dart';

import 'services.sender.dart';

class BudpayPlugin {
  static bool _sdkInitialized = false;
  static String _secret_Key = "";
  static String _signatureKEY = "";
  static String _public_key = "";
  // Initializing the budpay object with the appID and the apiKey that are required for API
  static initialize(
      {required String publicKey,
      required String secretKey,
      String? signatureKey}) async {
    assert(() {
      if (secretKey.isEmpty) {
        throw Exception('secret-key cannot be null or empty');
      }
      if (publicKey.isEmpty) {
        throw Exception('public cannot be null or empty');
      }
      return true;
    }());
    if (_sdkInitialized) return;
    try {
      _sdkInitialized = true;
      _secret_Key = secretKey;
      _public_key = publicKey;
      _signatureKEY = signatureKey ?? '';
    } catch (e) {
      throw e;
    }
  }

  // getting sdkInitializer value
  bool get sdkInitialized => _sdkInitialized;

  String get secret_key {
    // validating sdkInitializer is initialized
    _validateSdkInitialized();
    return _secret_Key;
  }

  String get public_id {
    // validating sdkInitializer is initialized
    _validateSdkInitialized();
    return _public_key;
  }

  String get signatureKEY {
    // validating sdkInitializer is initialized
    _validateSdkInitialized();
    return _signatureKEY;
  }

  _print() {
    if (sdkInitialized) {
      print({sdkInitialized, public_id, secret_key});
    }
  }

  // checking performance
  void _performance() {
    _print();
    // Validate SDK that have been initialize
    _validateSdkInitialized();

    // checking for null and empty value
    if (_secret_Key.isEmpty || _public_key.isEmpty) {
      throw Exception(
          "budpay_flutter not initialized, required your secret-key and public-key.");
    }
    if (_public_key.length < 30 || !_public_key.contains('_')) {
      throw Exception("budpay_flutter public key is too short and Invalid.");
    }
    if (_secret_Key.length < 40 || !_secret_Key.startsWith('sk_')) {
      throw Exception("budpay_flutter secret key is too short and Invalid.");
    }
  }

  // initialize validator
  _validateSdkInitialized() {
    if (!sdkInitialized) {
      throw Exception('BudPay SDK has not been initialized. The SDK has'
          ' to be initialized before use');
    }
  }

  // standardCheckout
  Future<dynamic> standardCheckout(
      {required CheckOut payloads, required BuildContext context}) async {
    _performance();
    try {
      var response = await Sender(secret_key, signatureKEY)
          .standardCheckout(payloads: payloads);
      if (response['status'] == true) {
        // ignore: use_build_context_synchronously
        CheckoutModal(
                context: context,
                authorizationUrl: response["data"]["authorization_url"])
            .pay();
      }
      return response;
    } catch (err) {
      throw Exception("Unknown error: $err");
    }
  }

  // Verify Transaction
  Future<dynamic> verifyTransaction({required String reference}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .verifyTransaction(reference: reference);
  }

  // Get all Transaction
  Future<dynamic> getAllTransaction() async {
    _performance();
    return await Sender(secret_key, signatureKEY).getAllTransaction();
  }

  // Get single Transaction
  Future<dynamic> getSingleTransaction({required String tnxID}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .getSingleTransaction(tnxID: tnxID);
  }

  // Pay with bank transfer
  Future<dynamic> payWithBankTransfer({required BankTransfer payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .payWithBankTransfer(payloads: payloads);
  }

  // Payment Features
  // Request Payment
  Future<dynamic> requestPayment({required RequestPayment payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .requestPayment(payloads: payloads);
  }

  // Create Payment Link
  Future<dynamic> createPaymentLink(
      {required CreatePaymentLink payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .createPaymentLink(payloads: payloads);
  }

  // Create Customer
  Future<dynamic> createCustomer({required Customer payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .createCustomer(payloads: payloads);
  }

  // Virtual Account
  // Create Dedicated Virtual Account
  Future<dynamic> createVirtualAccount({required Customer payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .createVirtualAccount(payloads: payloads);
  }

  // Get Virtual Account
  Future<dynamic> getVirtualAccounts() async {
    _performance();
    return await Sender(secret_key, signatureKEY).getVirtualAccounts();
  }

  // Refunds
  // Create refund
  Future<dynamic> createRefund({required Refund payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .createRefund(payloads: payloads);
  }

  // Get refunds
  Future<dynamic> getRefunds() async {
    _performance();
    return await Sender(secret_key, signatureKEY).getRefunds();
  }

  // Get refund
  Future<dynamic> getRefund({required String reference}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .getRefund(reference: reference);
  }

  // Payout
  // Bank list
  Future<dynamic> bankList() async {
    _performance();
    return await Sender(secret_key, signatureKEY).bankList();
  }

  // Bank List [get all bank list for a country with currency specified]
  Future<dynamic> bankListWithSpecificCurrency(
      {required String currency}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .bankListWithSpecificCurrency(currency: currency);
  }

  // Account Name Validation
  Future<dynamic> accountNameValidation({required Account payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .accountNameValidation(payloads: payloads);
  }

  // Single Payout
  Future<dynamic> singlePayout({required SingleTransfer payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .singlePayout(payloads: payloads);
  }

  // Bulk Payout
  Future<dynamic> bulkPayout({required BulkTransfer payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .bulkPayout(payloads: payloads);
  }

  // Verify Payout
  Future<dynamic> verifyPayout({required String reference}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .verifyPayout(reference: reference);
  }

  // List Payout or Transfer
  Future<dynamic> getListAllPayout() async {
    _performance();
    return await Sender(secret_key, signatureKEY).getListAllPayout();
  }

  // Payout Fee
  Future<dynamic> payoutFee() async {
    _performance();
    return await Sender(secret_key, signatureKEY).payoutFee();
  }

  // Wallet Balance
  Future<dynamic> walletBalance({required String currency}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .walletBalance(currency: currency);
  }

  // Wallet Transactions
  Future<dynamic> walletTransaction({required String currency}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .walletTransaction(currency: currency);
  }

  // Bills
  // Airtime providers
  Future<dynamic> airtimeProviders() async {
    _performance();
    return await Sender(secret_key, signatureKEY).airtimeProviders();
  }

  // Airtime Top up
  Future<dynamic> airtimeTopUp({required Airtime payload}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .airtimeTopUp(payload: payload);
  }

  // Internet Providers
  // Internet
  Future<dynamic> getInternetProviders() async {
    _performance();
    return await Sender(secret_key, signatureKEY).getInternetProviders();
  }

  // Internet Data Plans
  Future<dynamic> getAllInternetDataPlans({required String provider}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .getAllInternetDataPlans(provider: provider);
  }

  // Top up Internet Data
  Future<dynamic> internetTopUp({required Internet payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .internetTopUp(payloads: payloads);
  }

  // Tv Subscription
  // tv
  Future<dynamic> getTvs() async {
    _performance();
    return await Sender(secret_key, signatureKEY).getTvs();
  }

  // Get Tv Packages
  Future<dynamic> getTvPackages({required String provider}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .getTvPackages(provider: provider);
  }

  // Tv Validate
  Future<dynamic> tvValidate({required TvProvider payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .tvValidate(payloads: payloads);
  }

  // Pay Tv
  Future<dynamic> payTv({required TvProvider payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY).payTv(payloads: payloads);
  }

  // Electricity
  // Get Electricity
  Future<dynamic> getElectricity() async {
    _performance();
    return await Sender(secret_key, signatureKEY).getElectricity();
  }

  // Validate Electricity
  Future<dynamic> validateElectricity({
    required ElectricityProvider payloads,
  }) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .validateElectricity(payloads: payloads);
  }

  // Electricity Recharge
  Future<dynamic> electricityRecharge({
    required ElectricityProvider payloads,
  }) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .electricityRecharge(payloads: payloads);
  }

  // IdentityVerification
  // Verify Account Number
  Future<dynamic> verifyAccountNumber({required Account payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY)
        .verifyAccountNumber(payloads: payloads);
  }

  // Verify BVN Number
  Future<dynamic> verifyBVN({required BVN payloads}) async {
    _performance();
    return await Sender(secret_key, signatureKEY).verifyBVN(payloads: payloads);
  }
}

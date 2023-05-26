import '../models/_models.dart';

import 'services.sender.dart';

class BudpayPlugin {
  static bool _sdkInitialized = false;
  static String _secret_Key = "";
  static String _public_key = "";
  // Initializing the budpay object with the appID and the apiKey that are required for API
  static initialize(
      {required String publicKey, required String secretKey}) async {
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
          "flutter_budpay not initialized, required your secret-key and public-key.");
    }
    if (_public_key.length < 30 || !_public_key.contains('_')) {
      throw Exception("flutter_budpay public key is too short and Invalid.");
    }
    if (_secret_Key.length < 40 || !_secret_Key.startsWith('sk_')) {
      throw Exception("flutter_budpay secret key is too short and Invalid.");
    }
  }

  // initialize validator
  _validateSdkInitialized() {
    if (!sdkInitialized) {
      throw Exception('BudPay SDK has not been initialized. The SDK has'
          ' to be initialized before use');
    }
  }

  // Checkout
  Future<dynamic> checkOut({required CheckOut payloads}) async {
    _performance();
    return await Sender(secret_key).checkOut(payloads: payloads);
  }

  // Verify Transaction
  Future<dynamic> verifyTransaction({required String reference}) async {
    _performance();
    return await Sender(secret_key).verifyTransaction(reference: reference);
  }

  // Get all Transaction
  Future<dynamic> getAllTransaction() async {
    _performance();
    return await Sender(secret_key).getAllTransaction();
  }

  // Get single Transaction
  Future<dynamic> getSingleTransaction({required String tnxID}) async {
    _performance();
    return await Sender(secret_key).getSingleTransaction(tnxID: tnxID);
  }

  // Pay with bank transfer
  Future<dynamic> payWithBankTransfer({required BankTransfer payloads}) async {
    _performance();
    return await Sender(secret_key).payWithBankTransfer(payloads: payloads);
  }

  // Payment Features
  // Request Payment
  Future<dynamic> requestPayment({required RequestPayment payloads}) async {
    _performance();
    return await Sender(secret_key).requestPayment(payloads: payloads);
  }

  // Create Payment Link
  Future<dynamic> createPaymentLink(
      {required CreatePaymentLink payloads}) async {
    _performance();
    return await Sender(secret_key).createPaymentLink(payloads: payloads);
  }

  // Create Customer
  Future<dynamic> createCustomer({required Customer payloads}) async {
    _performance();
    return await Sender(secret_key).createCustomer(payloads: payloads);
  }

  // Virtual Account
  // Create Dedicated Virtual Account
  Future<dynamic> createVirtualAccount({required Customer payloads}) async {
    _performance();
    return await Sender(secret_key).createVirtualAccount(payloads: payloads);
  }

  // Get Virtual Account
  Future<dynamic> getVirtualAccounts() async {
    _performance();
    return await Sender(secret_key).getVirtualAccounts();
  }

  // Refunds
  // Create refund
  Future<dynamic> createRefund({required Refund payloads}) async {
    _performance();
    return await Sender(secret_key).createRefund(payloads: payloads);
  }

  // Get refunds
  Future<dynamic> getRefunds() async {
    _performance();
    return await Sender(secret_key).getRefunds();
  }

  // Get refund
  Future<dynamic> getRefund({required String reference}) async {
    _performance();
    return await Sender(secret_key).getRefund(reference: reference);
  }

  // Payout
  // Bank list
  Future<dynamic> bankList() async {
    _performance();
    return await Sender(secret_key).bankList();
  }

  // Bank List [get all bank list for a country with currency specified]
  Future<dynamic> bankListWithSpecificCurrency(
      {required String currency}) async {
    _performance();
    return await Sender(secret_key)
        .bankListWithSpecificCurrency(currency: currency);
  }

  // Account Name Validation
  Future<dynamic> accountNameValidation({required Account payloads}) async {
    _performance();
    return await Sender(secret_key).accountNameValidation(payloads: payloads);
  }

  // Single Payout
  Future<dynamic> singlePayout({required SingleTransfer payloads}) async {
    _performance();
    return await Sender(secret_key).singlePayout(payloads: payloads);
  }

  // Bulk Payout
  Future<dynamic> bulkPayout({required BulkTransfer payloads}) async {
    _performance();
    return await Sender(secret_key).bulkPayout(payloads: payloads);
  }

  // Verify Payout
  Future<dynamic> verifyPayout({required String reference}) async {
    _performance();
    return await Sender(secret_key).verifyPayout(reference: reference);
  }

  // List Payout or Transfer
  Future<dynamic> getListAllPayout({required String reference}) async {
    _performance();
    return await Sender(secret_key).getListAllPayout(reference: reference);
  }

  // Payout Fee
  Future<dynamic> payoutFee() async {
    _performance();
    return await Sender(secret_key).payoutFee();
  }

  // Wallet Balance
  Future<dynamic> walletBalance({required String currency}) async {
    _performance();
    return await Sender(secret_key).walletBalance(currency: currency);
  }

  // Wallet Transactions
  Future<dynamic> walletTransaction({required String currency}) async {
    _performance();
    return await Sender(secret_key).walletTransaction(currency: currency);
  }
}

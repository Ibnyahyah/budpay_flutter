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
    if (_public_key.length < 30 || !_public_key.contains('-')) {
      throw Exception("flutter_budpay public key is too short and Invalid.");
    }
    if (_secret_Key.length < 40 || !_secret_Key.startsWith('test_')) {
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
    return await Sender(secret_key).checkOut(payloads: payloads);
  }

  // Verify Transaction
  Future<dynamic> verifyTransaction({required String reference}) async {
    return await Sender(secret_key).verifyTransaction(reference: reference);
  }

  // Get all Transaction
  Future<dynamic> getAllTransaction() async {
    return await Sender(secret_key).getAllTransaction();
  }

  // Get single Transaction
  Future<dynamic> getSingleTransaction({required String tnxID}) async {
    return await Sender(secret_key).getSingleTransaction(tnxID: tnxID);
  }

  // Pay with bank transfer
  Future<dynamic> payWithBankTransfer({required BankTransfer payloads}) async {
    return await Sender(secret_key).payWithBankTransfer(payloads: payloads);
  }

  // Payment Features
  // Request Payment
  Future<dynamic> requestPayment({required RequestPayment payloads}) async {
    return await Sender(secret_key).requestPayment(payloads: payloads);
  }

  // Create Payment Link
  Future<dynamic> createPaymentLink(
      {required CreatePaymentLink payloads}) async {
    await Sender(secret_key).createPaymentLink(payloads: payloads);
  }

  // Create Customer
  Future<dynamic> createCustomer({required Customer payloads}) async {
    return await Sender(secret_key).createCustomer(payloads: payloads);
  }

  // Virtual Account
  // Create Dedicated Virtual Account
  Future<dynamic> createVirtualAccount({required Customer payloads}) async {
    return await Sender(secret_key).createVirtualAccount(payloads: payloads);
  }

  // Get Virtual Account
  Future<dynamic> getVirtualAccounts() async {
    return await Sender(secret_key).getVirtualAccounts();
  }

  // Refunds
  // Create refund
  Future<dynamic> createRefund({required Refund payloads}) async {
    return await Sender(secret_key).createRefund(payloads: payloads);
  }

  // Get refunds
  Future<dynamic> getRefunds() async {
    return await Sender(secret_key).getRefunds();
  }

  // Get refund
  Future<dynamic> getRefund({required String reference}) async {
    return await Sender(secret_key).getRefund(reference: reference);
  }
}

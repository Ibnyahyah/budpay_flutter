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

  Future<void> checkOut(Map<String, String>? payloads) async {
    await Sender(secret_key).checkOut(payloads: payloads);
  }
}

import '../_api.dart';
import '/src/models/_models.dart';

class PayoutFeatures {
  // Payout
  // Bank List [get all bank list for a country]
  static Future<void> bankList({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/bank_list',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Bank List [get all bank list for a country with currency specified]
  static Future<void> bankListWithSpecificCurrency({
    required Map<String, String>? headers,
    required String? currency,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/bank_list/$currency',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Account Name Validation
  static Future<void> accountNameValidation({
    required Map<String, String>? headers,
    required Account payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/account_name_verify',
        headers: headers,
        payloads: {
          "account_number": payloads.accountNumber,
          "bank_code": payloads.bankCode,
          "currency": payloads.currency,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Single Payout
  static Future<void> singlePayout({
    required Map<String, String>? headers,
    required SingleTransfer payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/bank_transfer',
        headers: headers,
        payloads: {
          "account_number": payloads.accountNumber,
          "bank_code": payloads.bankCode,
          "currency": payloads.currency,
          "amount": payloads.amount,
          "bank_name": payloads.bankName,
          "narration": payloads.narration,
          "paymentMode": payloads.paymentMode,
          "reference": payloads.reference,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Bulk Payout
  static Future<void> bulkPayout({
    required Map<String, String>? headers,
    required Map<String, dynamic> payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/bulk_bank_transfer',
        headers: headers,
        payloads: payloads,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Verify Payout
  static Future<void> verifyPayout({
    required Map<String, String>? headers,
    required String reference,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/payout/:$reference',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // List Payout or Transfer
  static Future<void> getListAllPayout({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/list_transfers',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Payout Fee
  static Future<void> payoutFee({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/payout_fee',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Wallet Balance
  static Future<void> walletBalance({
    required Map<String, String>? headers,
    required String currency,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/wallet_balance/$currency',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Wallet Transactions
  static Future<void> walletTransaction({
    required Map<String, String>? headers,
    required String currency,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/wallet_transactions/$currency',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

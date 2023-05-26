import 'package:flutter_budpay/src/models/_models.dart';

import '../_api.dart';

class AcceptPayment {
  // CheckOut : payment check out with card
  static Future<void> checkOut({
    required Map<String, String>? headers,
    required CheckOut payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/transaction/initialize',
        headers: headers,
        payloads: {
          "email": payloads.email,
          "currency": payloads.currency,
          "reference": payloads.reference,
          "amount": payloads.amount,
        },
      );
      return response;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  // Verify Transaction
  static Future<void> verifyTransaction({
    required Map<String, String>? headers,
    required String reference,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/transaction/verify/$reference',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Fetching all transaction
  static Future<void> getTransactions({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/transaction',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Fetching Single transaction
  static Future<void> getSingleTransaction(
      {required Map<String, String>? headers,
      required String
          tnxID // Transaction id [can be obtain from all transactions]
      }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/transaction/$tnxID',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Pay with Bank transfer
  //{ "email": "test@test.com", "amount": "100", "currency" :"NGN", "reference": "1253627873656276350", "name": "Business Name / Firstname lastname" }
  static Future<void> payWithBankTransfer({
    required Map<String, String>? headers,
    required BankTransfer payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/banktransfer/initialize',
        v2: true,
        headers: headers,
        payloads: {
          "amount": payloads.amount,
          "name": payloads.fullName,
          "email": payloads.email,
          "currency": payloads.currency,
          "reference": payloads.reference,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

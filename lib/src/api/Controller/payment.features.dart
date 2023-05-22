import 'package:flutter_budpay/src/models/_models.dart';

import '../_api.dart';

class PaymentFeatures {
  // Request Payment
  /**
     * {
        "recipient":"toluxsys@yahoo.ca,07036218209,sam@bud.africa,08161112404", // TODO implement the recipient
    }
     */
  static Future<void> requestPayment({
    required Map<String, String>? headers,
    required RequestPayment payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/request_payment',
        headers: headers,
        payloads: {
          "recipient": payloads.recipient,
          "amount": payloads.amount,
          "currency": payloads.currency,
          "description": payloads.description,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // create_payment_link
  static Future<void> createPaymentLink({
    required Map<String, String>? headers,
    required CreatePaymentLink payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/request_payment',
        headers: headers,
        payloads: {
          "redirect": payloads.redirectURL,
          "name": payloads.name,
          "amount": payloads.amount,
          "currency": payloads.currency,
          "description": payloads.description,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // create a Customer
  static Future<void> createCustomer({
    required Map<String, String>? headers,
    required Customer payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/customer',
        headers: headers,
        payloads: {
          "first_name": payloads.firstName,
          "last_name": payloads.lastName,
          "email": payloads.email,
          "phone": payloads.phoneNumber,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Virtual Account
  // Create Dedicated Virtual Account
  static Future<void> createVirtualAccount({
    required Map<String, String>? headers,
    required Customer payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/dedicated_virtual_account',
        headers: headers,
        payloads: {
          "customer": payloads.customer,
          "first_name": payloads.firstName,
          "last_name": payloads.lastName,
          "email": payloads.email,
          "phone": payloads.phoneNumber,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Get Virtual Account
  static Future<void> getVirtualAccounts({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/list_dedicated_accounts',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Refunds
  // Create refund
  static Future<void> createRefund({
    required Map<String, String>? headers,
    required Refund payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/refund',
        headers: headers,
        payloads: {
          "reference": payloads.reference,
          "merchant_note": payloads.merchantNote,
          "customer_note": payloads.customerNote,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Get refunds
  static Future<void> getRefunds({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/refund',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Get single refund
  static Future<void> getRefund({
    required Map<String, String>? headers,
    required String reference,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/refund/$reference',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

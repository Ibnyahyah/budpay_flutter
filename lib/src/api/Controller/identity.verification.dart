import '../_api.dart';
import '/src/models/_models.dart';

class IdentityVerification {
  // Verify Account Number
  static Future<void> verifyAccountNumber({
    required Map<String, String>? headers,
    required Account payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/account_name_verify',
        headers: headers,
        payloads: {
          "bank_code": payloads.bankCode,
          "account_number": payloads.accountNumber,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Verify BVN
  static Future<void> verifyBVN({
    required Map<String, String>? headers,
    required BVN payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/bvn/verify',
        headers: headers,
        payloads: {
          "bvn": payloads.bvnNumber,
          "callback_url": payloads.callbackUrl,
          "first_name": payloads.firstName,
          "middle_name": payloads.middleName,
          "last_name": payloads.lastName,
          "phone_number": payloads.phoneNumber,
          "dob": payloads.dob,
          "gender": payloads.gender,
          "reference": payloads.reference,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

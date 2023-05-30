import '../_api.dart';
import '/src/models/_models.dart';

class BillsFeatures {
  // Bills
  // Airtime Providers
  static Future<void> airtimeProviders({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/airtime',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Airtime Top up
  static Future<void> airtimeTopUp({
    required Map<String, String>? headers,
    required Airtime payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/airtime/topup',
        headers: headers,
        payloads: {
          "amount": payloads.amount,
          "provider": payloads.provider,
          "number": payloads.number,
          "reference": payloads.reference,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Internet Providers
  // Internet
  static Future<void> getInternetProviders({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/internet',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Internet Data Plans
  static Future<void> getAllInternetDataPlans({
    required Map<String, String>? headers,
    required String provider,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/internet/plans/$provider',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Top up Internet Data
  static Future<void> internetTopUp({
    required Map<String, String>? headers,
    required Internet payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/internet/data',
        headers: headers,
        payloads: {
          "plan_id": payloads.planID,
          "provider": payloads.provider,
          "number": payloads.number,
          "reference": payloads.reference,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Tv Subscription
  // tv
  static Future<void> getTvs({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/tv',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Get Tv Packages
  static Future<void> getTvPackages({
    required Map<String, String>? headers,
    required String provider,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/tv/packages/$provider',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Tv Validate
  static Future<void> tvValidate({
    required Map<String, String>? headers,
    required TvProvider payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/tv/validate',
        headers: headers,
        payloads: {
          "provider": payloads.provider,
          "number": payloads.number,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Pay Tv
  static Future<void> payTv({
    required Map<String, String>? headers,
    required TvProvider payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/tv/pay',
        headers: headers,
        payloads: {
          "plan_id": payloads.planID,
          "provider": payloads.provider,
          "number": payloads.number,
          "reference": payloads.reference,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Electricity
  // Get Electricity
  static Future<void> getElectricity({
    required Map<String, String>? headers,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.get,
        path: '/electricity',
        headers: headers,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Validate Electricity
  static Future<void> validateElectricity({
    required Map<String, String>? headers,
    required ElectricityProvider payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
          method: Method.post,
          path: '/electricity/validate',
          headers: headers,
          payloads: {
            "provider": payloads.provider,
            "number": payloads.number,
            "type": payloads.type,
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Electricity Recharge
  static Future<void> electricityRecharge({
    required Map<String, String>? headers,
    required ElectricityProvider payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
          method: Method.post,
          path: '/electricity/recharge',
          headers: headers,
          payloads: {
            "provider": payloads.provider,
            "number": payloads.number,
            "type": payloads.type,
            "amount": payloads.amount,
            "reference": payloads.reference,
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

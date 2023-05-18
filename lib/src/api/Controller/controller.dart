import '../_api.dart';

class Controller {
  static Future<void> checkOut({
    required Map<String, String>? headers,
    required Map<String, String>? payloads,
  }) async {
    try {
      var response = await Fetcher.fetch(
        method: Method.post,
        path: '/transaction/initialize',
        headers: headers,
        payloads: payloads,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

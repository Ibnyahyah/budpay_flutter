part of '_api.dart';

enum Method { get, post }

class Fetcher {
  static Future<void> fetch({
    required Method method,
    required String path,
    Map<String, String>? headers,
    Map<String, String>? payloads,
  }) async {
    var url = Uri.parse('${Constants.BASE_URL}$path');
    try {
      dynamic request = await http.get(url);
      switch (method) {
        case Method.get:
          request = await http.get(url);
          break;
        case Method.post:
          request = await http.post(
            url,
            headers: headers,
            body: json.encode(payloads),
          );
          break;
      }
      var response = request;
      return json.decode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}

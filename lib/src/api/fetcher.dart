part of '_api.dart';

enum Method { get, post }

class Fetcher {
  static Future<void> fetch({
    required Method method,
    required String path,
    bool? v2,
    Map<String, String>? headers,
    Map<String, String>? payloads,
  }) async {
    var url = Uri.parse(
        '${v2 != null && v2 == true ? Constants.BASE_URL_S2S : Constants.BASE_URL}$path');
    try {
      print("###Request stated: Requesting.........................");
      var response;
      if (method == Method.get) {
        response = await http.get(url);
        print({method == Method.get, response.body, payloads, url, headers});
      } else if (method == Method.post) {
        response = await http.post(
          url,
          headers: headers,
          body: json.encode(payloads),
        );
        print({method == Method.get, response.body, payloads, url, headers});
      } else {
        throw Exception("Unknown Method! supported [get and post]");
      }
      return json.decode(response.body);
    } catch (e) {
      print({e});
      throw Exception(e);
    }
  }
}

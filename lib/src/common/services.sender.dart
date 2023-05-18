import 'package:flutter_budpay/src/api/Controller/controller.dart';

class Sender {
  Sender(this.secretKay);

  final String secretKay;

  Future<void> checkOut({
    required Map<String, String>? payloads,
  }) async {
    return await Controller.checkOut(headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $secretKay",
    }, payloads: payloads);
  }
}

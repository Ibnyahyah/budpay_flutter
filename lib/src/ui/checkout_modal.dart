import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutModal {
  CheckoutModal({
    required this.context,
    required this.authorizationUrl,
    this.onModalClose,
  });
  final BuildContext context;
  final String authorizationUrl;
  final Function()? onModalClose;

  void pay() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(0),
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * .80,
              width: MediaQuery.of(context).size.width - 10,
              constraints: const BoxConstraints(
                maxWidth: 400,
                minWidth: 350,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Flexible(
                      child: WebView(
                        initialUrl: authorizationUrl,
                        javascriptMode: JavascriptMode.unrestricted,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        onModalClose!();
                      },
                      child: const Text("Close Payment"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

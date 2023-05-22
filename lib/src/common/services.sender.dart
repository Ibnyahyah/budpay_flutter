import '../api/Controller/_controller.dart';
import '../models/_models.dart';

class Sender {
  Sender(this.secretKay);

  final String secretKay;

  // Accept Payment
  // Payment checkout with card
  Future<void> checkOut({required CheckOut payloads}) async {
    return await AcceptPayment.checkOut(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      payloads: payloads,
    );
  }

  // Verify Transaction
  Future<void> verifyTransaction({required String reference}) async {
    return await AcceptPayment.verifyTransaction(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      reference: reference,
    );
  }

  // Get all Transaction
  Future<void> getAllTransaction() async {
    return await AcceptPayment.getTransactions(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
    );
  }

  // Get single Transaction
  Future<void> getSingleTransaction({required String tnxID}) async {
    return await AcceptPayment.getSingleTransaction(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      tnxID: tnxID,
    );
  }

  // Pay with bank transfer
  Future<void> payWithBankTransfer({required BankTransfer payloads}) async {
    return await AcceptPayment.payWithBankTransfer(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      payloads: payloads,
    );
  }

  // Payment Features
  // Request Payment
  Future<void> requestPayment({required RequestPayment payloads}) async {
    return await PaymentFeatures.requestPayment(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      payloads: payloads,
    );
  }

  // Create Payment Link
  Future<void> createPaymentLink({required CreatePaymentLink payloads}) async {
    return await PaymentFeatures.createPaymentLink(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      payloads: payloads,
    );
  }

  // Create Customer
  Future<void> createCustomer({required Customer payloads}) async {
    return await PaymentFeatures.createCustomer(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      payloads: payloads,
    );
  }

  // Virtual Account
  // Create Dedicated Virtual Account
  Future<void> createVirtualAccount({required Customer payloads}) async {
    return await PaymentFeatures.createVirtualAccount(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      payloads: payloads,
    );
  }

  // Get Virtual Account
  Future<void> getVirtualAccounts() async {
    return await PaymentFeatures.getVirtualAccounts(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
    );
  }

  // Refunds
  // Create refund
  Future<void> createRefund({required Refund payloads}) async {
    return await PaymentFeatures.createRefund(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      payloads: payloads,
    );
  }

  // Get refunds
  Future<void> getRefunds() async {
    return await PaymentFeatures.getRefunds(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
    );
  }

  // Get Single refund
  Future<void> getRefund({required String reference}) async {
    return await PaymentFeatures.getRefund(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKay",
      },
      reference: reference,
    );
  }
}

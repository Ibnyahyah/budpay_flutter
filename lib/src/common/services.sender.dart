import '../api/Controller/_controller.dart';
import '../models/_models.dart';

class Sender {
  Sender(this.secretKEY, this.signatureKEY);

  final String secretKEY;
  final String signatureKEY;

  // Accept Payment
  // Payment standardCheckout with card
  Future<void> standardCheckout({required CheckOut payloads}) async {
    return await AcceptPayment.standardCheckout(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }

  // Verify Transaction
  Future<void> verifyTransaction({required String reference}) async {
    return await AcceptPayment.verifyTransaction(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      reference: reference,
    );
  }

  // Get all Transaction
  Future<void> getAllTransaction() async {
    return await AcceptPayment.getTransactions(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Get single Transaction
  Future<void> getSingleTransaction({required String tnxID}) async {
    return await AcceptPayment.getSingleTransaction(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      tnxID: tnxID,
    );
  }

  // Pay with bank transfer
  Future<void> payWithBankTransfer({required BankTransfer payloads}) async {
    return await AcceptPayment.payWithBankTransfer(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
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
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }

  // Create Payment Link
  Future<void> createPaymentLink({required CreatePaymentLink payloads}) async {
    return await PaymentFeatures.createPaymentLink(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }

  // Create Customer
  Future<void> createCustomer({required Customer payloads}) async {
    return await PaymentFeatures.createCustomer(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
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
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }

  // Get Virtual Account
  Future<void> getVirtualAccounts() async {
    return await PaymentFeatures.getVirtualAccounts(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Refunds
  // Create refund
  Future<void> createRefund({required Refund payloads}) async {
    return await PaymentFeatures.createRefund(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }

  // Get refunds
  Future<void> getRefunds() async {
    return await PaymentFeatures.getRefunds(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Get Single refund
  Future<void> getRefund({required String reference}) async {
    return await PaymentFeatures.getRefund(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      reference: reference,
    );
  }

  // Payout
  // Bank List [get all bank list for a country]
  Future<void> bankList() async {
    return await PayoutFeatures.bankList(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Bank List [get all bank list for a country with currency specified]
  Future<void> bankListWithSpecificCurrency({required String currency}) async {
    return await PayoutFeatures.bankListWithSpecificCurrency(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      currency: currency,
    );
  }

  // Account Name Validation
  Future<void> accountNameValidation({required Account payloads}) async {
    return await PayoutFeatures.accountNameValidation(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }

  // Single Payout
  Future<void> singlePayout({required SingleTransfer payloads}) async {
    return await PayoutFeatures.singlePayout(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
        "Encryption": signatureKEY,
      },
      payloads: payloads,
    );
  }

  // Bulk Payout
  Future<void> bulkPayout({required BulkTransfer payloads}) async {
    return await PayoutFeatures.bulkPayout(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
        "Encryption": signatureKEY,
      },
      payloads: payloads.toJson(),
    );
  }

  // Verify Payout
  Future<void> verifyPayout({required String reference}) async {
    return await PayoutFeatures.verifyPayout(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      reference: reference,
    );
  }

  // List Payout or Transfer
  Future<void> getListAllPayout() async {
    return await PayoutFeatures.getListAllPayout(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Payout Fee
  Future<void> payoutFee() async {
    return await PayoutFeatures.payoutFee(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Wallet Balance
  Future<void> walletBalance({required String currency}) async {
    return await PayoutFeatures.walletBalance(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      currency: currency,
    );
  }

  // Wallet Transactions
  Future<void> walletTransaction({required String currency}) async {
    return await PayoutFeatures.walletTransaction(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      currency: currency,
    );
  }

  // Bills
  // Airtime Providers
  Future<void> airtimeProviders() async {
    return await BillsFeatures.airtimeProviders(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Airtime Top up
  Future<void> airtimeTopUp({required Airtime payload}) async {
    return await BillsFeatures.airtimeTopUp(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
        "Encryption": signatureKEY,
      },
      payloads: payload,
    );
  }

  // Internet Providers
  // Internet
  Future<void> getInternetProviders() async {
    return await BillsFeatures.getInternetProviders(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Internet Data Plans
  Future<void> getAllInternetDataPlans({required String provider}) async {
    return await BillsFeatures.getAllInternetDataPlans(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      provider: provider,
    );
  }

  // Top up Internet Data
  Future<void> internetTopUp({required Internet payloads}) async {
    return await BillsFeatures.internetTopUp(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
        "Encryption": signatureKEY,
      },
      payloads: payloads,
    );
  }

  // Tv Subscription
  // tv
  Future<void> getTvs() async {
    return await BillsFeatures.getTvs(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Get Tv Packages
  Future<void> getTvPackages({required String provider}) async {
    return await BillsFeatures.getTvPackages(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      provider: provider,
    );
  }

  // Tv Validate
  Future<void> tvValidate({required TvProvider payloads}) async {
    return await BillsFeatures.tvValidate(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }

  // Pay Tv
  Future<void> payTv({required TvProvider payloads}) async {
    return await BillsFeatures.payTv(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
        "Encryption": signatureKEY,
      },
      payloads: payloads,
    );
  }

  // Electricity
  // Get Electricity
  Future<void> getElectricity() async {
    return await BillsFeatures.getElectricity(
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
    );
  }

  // Validate Electricity
  Future<void> validateElectricity({
    required ElectricityProvider payloads,
  }) async {
    return await BillsFeatures.validateElectricity(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }

  // Electricity Recharge
  Future<void> electricityRecharge({
    required ElectricityProvider payloads,
  }) async {
    return await BillsFeatures.electricityRecharge(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
        "Encryption": signatureKEY,
      },
      payloads: payloads,
    );
  }

  // IdentityVerification
  // Verify Account Number
  Future<void> verifyAccountNumber({required Account payloads}) async {
    return await IdentityVerification.verifyAccountNumber(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }

  // Verify BVN Number
  Future<void> verifyBVN({
    required BVN payloads,
  }) async {
    return await IdentityVerification.verifyBVN(
      headers: {
        "Content-type": "application/json",
        "Authorization": "Bearer $secretKEY",
      },
      payloads: payloads,
    );
  }
}

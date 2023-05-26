class SingleTransfer {
  final String bankCode;
  final String accountNumber;
  final String currency;
  final String amount;
  final String bankName;
  final String narration;
  final String paymentMode;
  final String reference;

  SingleTransfer({
    required this.accountNumber,
    required this.bankCode,
    required this.amount,
    required this.bankName,
    required this.narration,
    required this.paymentMode,
    required this.currency,
    this.reference = "",
  }) : super();
}

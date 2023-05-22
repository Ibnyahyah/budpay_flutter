class BankTransfer {
  final String email;
  final String amount;
  final String fullName;
  final String currency; // Use GHS for Ghana Cedis or USD for US Dollars
  final String reference;

  BankTransfer({
    required this.email,
    required this.fullName,
    required this.currency,
    this.reference = "",
    required this.amount,
  }) : super();
}

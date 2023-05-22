class RequestPayment {
  final String amount;
  final String description;
  final String currency; // Use GHS for Ghana Cedis or USD for US Dollars
  final String recipient;

  RequestPayment({
    required this.description,
    required this.currency,
    this.recipient = "",
    required this.amount,
  }) : super();
}

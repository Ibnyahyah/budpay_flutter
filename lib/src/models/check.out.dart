class CheckOut {
  final String email;
  final String amount;
  final String currency; // Use GHS for Ghana Cedis or USD for US Dollars
  final String reference;
  final String callBackURL;

  CheckOut({
    required this.email,
    required this.currency,
    this.reference = "",
    this.callBackURL = "",
    required this.amount,
  }) : super();
}

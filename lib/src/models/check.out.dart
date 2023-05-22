class CheckOut {
  final String email;
  final String amount;
  final String firstName;
  final String lastName;
  final String currency; // Use GHS for Ghana Cedis or USD for US Dollars
  final String reference;

  CheckOut({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.currency,
    this.reference = "",
    required this.amount,
  }) : super();
}

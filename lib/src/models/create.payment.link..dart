class CreatePaymentLink {
  final String redirectURL; // payment redirect url (http://example.com)
  final String amount;
  final String name;
  final String currency; // Use GHS for Ghana Cedis or USD for US Dollars
  final String description;

  CreatePaymentLink({
    required this.redirectURL,
    required this.name,
    required this.currency,
    required this.description,
    required this.amount,
  }) : super();
}

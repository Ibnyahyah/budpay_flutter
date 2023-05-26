class Account {
  final String bankCode;
  final String accountNumber;
  final String currency;

  Account({
    required this.accountNumber,
    required this.bankCode,
    this.currency = "",
  }) : super();
}

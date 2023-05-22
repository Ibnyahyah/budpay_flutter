class Refund {
  final String merchantNote;
  final String customerNote;
  final String reference;

  Refund({
    this.customerNote = "",
    this.merchantNote = "",
    required this.reference,
  }) : super();
}

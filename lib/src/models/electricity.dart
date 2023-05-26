class ElectricityProvider {
  final String provider;
  final String number;
  final String type;
  final String amount;
  final String reference;

  ElectricityProvider({
    required this.provider,
    required this.number,
    this.type = "",
    this.amount = "",
    this.reference = "",
  }) : super();
}

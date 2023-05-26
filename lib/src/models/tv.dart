class TvProvider {
  final String provider;
  final String number;
  final String planID;
  final String reference;

  TvProvider({
    required this.provider,
    required this.number,
    this.planID = "",
    this.reference = "",
  }) : super();
}

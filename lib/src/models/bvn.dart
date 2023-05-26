class BVN {
  final String bvnNumber;
  final String callbackUrl;
  final String firstName;
  final String lastName;
  final String middleName;
  final String phoneNumber;
  final String DOB;
  final String gender;
  final String reference;

  BVN({
    required this.bvnNumber,
    required this.callbackUrl,
    this.firstName = "",
    this.lastName = "",
    this.middleName = "",
    this.phoneNumber = "",
    this.DOB = "",
    this.gender = "",
    this.reference = "",
  }) : super();
}

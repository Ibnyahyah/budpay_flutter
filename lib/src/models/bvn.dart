class BVN {
  final String bvnNumber;
  final String callbackUrl;
  final String firstName;
  final String lastName;
  final String middleName;
  final String phoneNumber;
  final String dob;
  final String gender;
  final String reference;

  BVN({
    required this.bvnNumber,
    required this.callbackUrl,
    this.firstName = "",
    this.lastName = "",
    this.middleName = "",
    this.phoneNumber = "",
    this.dob = "",
    this.gender = "",
    this.reference = "",
  }) : super();
}

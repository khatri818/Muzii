class UserModel {
  late String uid;
  late String phoneCountryCode;
  late String phoneNumber;
  late String name;
  late String emailAddress;
  late String gender;
  late String dob;
  late int countryId;
  late String token;

  UserModel({
    required this.uid,
    required this.phoneCountryCode,
    required this.phoneNumber,
    required this.name,
    required this.emailAddress,
    required this.gender,
    required this.dob,
    required this.countryId,
    required this.token,
  });

  // Convert an UserModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phoneCountryCode': phoneCountryCode,
      'phoneNumber': phoneNumber,
      'name': name,
      'emailAddress': emailAddress,
      'gender': gender,
      'dob': dob,
      'countryId': countryId,
      'token': token,
    };
  }

  // Create an UserModel object from a map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      phoneCountryCode: map['phoneCountryCode'],
      phoneNumber: map['phoneNumber'],
      name: map['name'],
      emailAddress: map['emailAddress'],
      gender: map['gender'],
      dob: map['dob'],
      countryId: map['countryId'],
      token: map['token'],
    );
  }
}

class SignUpModel {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final bool phoneVerifiction;
  final bool emailVerifiction;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.phoneVerifiction,
    required this.emailVerifiction,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> data) {
    return SignUpModel(
      name: data['name'],
      email: data['email'],
      password: data['password'],
      phoneNumber: data['phone'],
      phoneVerifiction: data['phoneVerification'],
      emailVerifiction: data['emailVerification'],
    );
  }
}

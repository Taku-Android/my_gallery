class LoginData {
  String email;
  String password;

  LoginData({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      email: map['email'],
      password: map['password'],
    );
  }
}
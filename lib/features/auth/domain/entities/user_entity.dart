class User {
  dynamic id;
  String fullName;
  String phoneNumber;
  final String token;
  final String refreshToken;

  User(
      {required this.id,
      required this.fullName,
      required this.phoneNumber,
      required this.token,
      required this.refreshToken});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        fullName: json['name'],
        phoneNumber: json['phone'],
    token: json['access_token'],
    refreshToken: json['refresh_token']
      );
}

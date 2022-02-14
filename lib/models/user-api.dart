import 'dart:math';

class UserAPI {
  String fullName;
  String phone;
  String email;
  String password;

  UserAPI({
    this.fullName,
    this.phone,
    this.email,
    this.password,
  });

  factory UserAPI.fromJson(Map<String, dynamic> json) {
    return UserAPI(
      fullName: json['fullName'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['fullName'] = this.fullName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.password,
    this.addressId,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.address,
  });

  String id;
  String fullName;
  String phone;
  String email;
  String password;
  String addressId;
  String rememberToken;
  dynamic createdAt;
  dynamic updatedAt;
  int status;
  List<Address> address;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["fullName"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        addressId: json["addressID"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        status: json["status"],
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "phone": phone,
        "email": email,
        "password": password,
        "addressID": addressId,
        "remember_token": rememberToken,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "status": status,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.reciver,
  });

  String reciver;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        reciver: json["reciver"],
      );

  Map<String, dynamic> toJson() => {
        "reciver": reciver,
      };
}

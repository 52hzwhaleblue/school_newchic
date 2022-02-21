// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    this.id,
    this.userId,
    this.reciver,
    this.phone,
    this.street,
    this.city,
    this.disctrict,
    this.ward,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String userId;
  String reciver;
  int phone;
  String street;
  String city;
  String disctrict;
  String ward;
  int status;
  dynamic createdAt;
  dynamic updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        userId: json["userID"],
        reciver: json["reciver"],
        phone: json["phone"],
        street: json["street"],
        city: json["city"],
        disctrict: json["disctrict"],
        ward: json["ward"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userID": userId,
        "reciver": reciver,
        "phone": phone,
        "street": street,
        "city": city,
        "disctrict": disctrict,
        "ward": ward,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboarding_demo/models/address-api.dart';
import 'package:onboarding_demo/models/api-product/productArmy.dart';
import 'package:onboarding_demo/models/api-product/productMen.dart';
import 'package:onboarding_demo/models/api-product/productWomen.dart';
import 'package:onboarding_demo/views/constants.dart';
import 'package:onboarding_demo/views/dang-nhap/constants.dart';

class AddressRequest {
  // lấy userID từ userEmail
  static String addressURL = 'http://192.168.1.220:9000/api/address/$userID';

  static List<Address> parseAddress(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Address> posts = list.map((model) => Address.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Address>> fetchAddress({int page = 1}) async {
    final response = await http.get(Uri.parse('$addressURL'));
    if (response.statusCode == 200) {
      return compute(parseAddress, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get address');
    }
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:onboarding_demo/models/api-product-dedtails.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding_demo/models/user-api.dart';
import 'package:onboarding_demo/views/dang-nhap/constants.dart';

import 'package:onboarding_demo/views/trang-san-pham-chi-tiet/product_details_constants.dart';

// ignore: camel_case_types
class getUserID {
  static String url = "http://192.168.1.220:9000/api/getUserID/$userEmail";

  static List<User> parseUserID(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<User> posts = list.map((model) => User.fromJson(model)).toList();
    return posts;
  }

  static Future<List<User>> fetchUserID({int page = 1}) async {
    final response = await http.get(Uri.parse('$url'));
    if (response.statusCode == 200) {
      return compute(parseUserID, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get product details');
    }
  }
}

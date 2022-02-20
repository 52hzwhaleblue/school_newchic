import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:onboarding_demo/models/cart_api.dart';

class CartRequest {
  static const String urlCart = 'http://192.168.1.220:9000/api/users';
  // men
  static List<Cart_API> parsecart(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Cart_API> posts =
        list.map((model) => Cart_API.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Cart_API>> fetchCart({int page = 1}) async {
    final response = await http.get(Uri.parse('$urlCart'));
    if (response.statusCode == 200) {
      return compute(parsecart, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get cart');
    }
  }
}

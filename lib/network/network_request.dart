import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboarding_demo/models/api-product/productMen.dart';

class NetworkRequest {
  static const String url = "http://192.168.1.220:3000/products";

  static List<api_productMen> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<api_productMen> posts =
        list.map((model) => api_productMen.fromJson(model)).toList();
    return posts;
  }

  static Future<List<api_productMen>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse('$url'));
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get post');
    }
  }
}

import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboarding_demo/models/api-product/productArmy.dart';
import 'package:onboarding_demo/models/api-product/productMen.dart';
import 'package:onboarding_demo/models/api-product/productWomen.dart';

class NetworkRequest {
  static const String urlProductMen = "http://172.22.128.1:3000/productsMen";
  static const String urlProductWomen =
      "http://172.22.128.1:3000/productsWomen";
  static const String urlProductArmy = "http://172.22.128.1:3000/productsArmy";

// men
  static List<api_productMen> parseProductMen(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<api_productMen> posts =
        list.map((model) => api_productMen.fromJson(model)).toList();
    return posts;
  }

  static Future<List<api_productMen>> fetchProductMen({int page = 1}) async {
    final response = await http.get(Uri.parse('$urlProductMen'));
    if (response.statusCode == 200) {
      return compute(parseProductMen, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get post');
    }
  }

// women
  static List<api_productWomen> parseProductWomen(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<api_productWomen> postss =
        list.map((model) => api_productWomen.fromJson(model)).toList();
    return postss;
  }

  static Future<List<api_productWomen>> fetchProductWomen(
      {int page = 1}) async {
    final response = await http.get(Uri.parse('$urlProductWomen'));
    if (response.statusCode == 200) {
      return compute(parseProductWomen, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get post');
    }
  }

// army
  static List<api_productArmy> parseProductArmy(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<api_productArmy> posts =
        list.map((model) => api_productArmy.fromJson(model)).toList();
    return posts;
  }

  static Future<List<api_productArmy>> fetchProductArmy({int page = 1}) async {
    final response = await http.get(Uri.parse('$urlProductArmy'));
    if (response.statusCode == 200) {
      return compute(parseProductArmy, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get post');
    }
  }
}

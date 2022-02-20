import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onboarding_demo/models/user-api.dart';

class RegisterCallAPI {
  String _url = 'http://192.168.1.220:9000/api/register';

  _setHeader() =>
      {'Content-type': 'application/json', 'Accept': 'application/json'};

  postData(data) async {
    var response = await http.post(
      Uri.parse(_url),
      headers: _setHeader(),
      body: jsonEncode(data),
    );
    int statusCode = response.statusCode;
    String responseBody = response.body;
    print(responseBody);
    return responseBody;
  }
}

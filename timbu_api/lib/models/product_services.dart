import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


class ProductServices {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<List?> getPruducts() async {
    try {
      final response = await http.get(Uri.parse(dotenv.env['URL_PRODUCT']!),
          headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['items'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

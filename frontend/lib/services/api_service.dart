import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://localhost:5000'; // change if deployed

  static Future<String> pingServer() async {
    final response = await http.get(Uri.parse('$baseUrl/ping'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      throw Exception('Failed to connect to server');
    }
  }
}

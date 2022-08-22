import 'dart:async';
import 'package:http/http.dart' as http;

class PersonagensAPI {
  static Future getPersonagens() {
    Uri url = Uri.parse("https://thronesapi.com/api/v2/characters");
    return http.get(url);
  }
}
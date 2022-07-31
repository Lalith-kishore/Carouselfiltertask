import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:searchfilter/modal.dart';

class FilterService {
  static final http.Client httpClient = http.Client();

  static Future<JsonParser?> getFaqJsonData() async {
    Future<dynamic> retValue;

    final response = await httpClient.get(
      Uri.parse('https://demo.athemes.com/wp-json/wp/v2/posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    final json = jsonDecode(response.body);
    print(
        'string test 1111111111111111111111111111111111111111111111111111111111111111111111111111111111: ' +
            json.toString());

    if (json != null && json.toString().length > 0) {
      JsonParser faqData = JsonParser.fromJson(json);

      return faqData;
    } else {
      return null;
    }
  }
}

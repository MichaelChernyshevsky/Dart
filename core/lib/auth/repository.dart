import 'package:http/http.dart' as http;

import 'package:http/http.dart';

const String token = 'pat98ZQynlXtheuMI.51723a828386daecdb80931e42b162443b999ff58849b516541648ee3f72f5a9';

class AuthRepository {
  Future<Response> fetchRecords({
    required String baseUrl,
    required String key,
  }) async {
    final url = Uri.parse('$baseUrl?filterByFormula=SEARCH("$key", {key})');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}

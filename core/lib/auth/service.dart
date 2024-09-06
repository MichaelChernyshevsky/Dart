import 'dart:convert';

import 'package:core/auth/repository.dart';
import 'package:core/helper/response.dart';

class AuthService {
  final AuthRepository repository = AuthRepository();
  Future<ResponseCore> isAuthed({required String key}) async {
    final response = await repository.fetchRecords(baseUrl: 'https://api.airtable.com/v0/app1p8WpwALri4Nsp/users', key: key);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body['records'].length > 0) {
        DateTime now = DateTime.now();
        DateTime dateFromString = DateTime.parse(body['records'][0]['fields']['to']);
        if (dateFromString.isAfter(now)) {
          return ResponseCore(authed: true, message: '');
        } else {
          return ResponseCore(authed: false, message: 'Not subscribed');
        }
      } else {
        return ResponseCore(authed: false, message: 'Uncontain key');
      }
    } else {
      return ResponseCore(authed: false, message: response.statusCode.toString());
    }
  }
}

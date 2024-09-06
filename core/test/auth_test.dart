import 'package:core/auth/service.dart';
import 'package:test/test.dart';

void main() {
  late AuthService service;
  setUpAll(() {
    service = AuthService();
  });

  test('- auth key true', () async {
    final resp = await service.isAuthed(key: '000000000');
    expect(resp.authed, true);
  });
  test('- auth key uncontain user', () async {
    final resp = await service.isAuthed(key: '91823131');
    expect(resp.message, 'Uncontain key');
  });
  test('- auth key not subscribed', () async {
    final resp = await service.isAuthed(key: '000000001');
    expect(resp.message, 'Not subscribed');
  });
}

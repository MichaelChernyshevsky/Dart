// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseCore {
  final bool authed;
  final String? message;

  ResponseCore({
    required this.authed,
    this.message,
  });

  ResponseCore copyWith({
    bool? authed,
    String? message,
  }) {
    return ResponseCore(
      authed: authed ?? this.authed,
      message: message ?? this.message,
    );
  }
}

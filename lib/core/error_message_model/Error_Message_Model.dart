import 'package:equatable/equatable.dart';

class ErrorMessage extends Equatable {
  final String statusMessage;
  final int statusCode;
  final bool status;

  ErrorMessage({
    required this.statusMessage,
    required this.statusCode,
    required this.status,
  });

  factory ErrorMessage.fromJson(Map<String, dynamic> json) {
    return ErrorMessage(
      statusMessage: json["status_message"],
      statusCode:json[" status_code"],
      status: json["status"],
    );
  }

  @override
  List<Object> get props => [status , statusCode , statusMessage];
}

import 'package:movie_app/core/error_message_model/Error_Message_Model.dart';

class ServiceExceptions implements Exception{
  final ErrorMessage errorMessage;

  const ServiceExceptions({ required this.errorMessage});
}
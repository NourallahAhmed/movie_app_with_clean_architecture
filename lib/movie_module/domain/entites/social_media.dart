import 'package:equatable/equatable.dart';

class SocialMedia extends Equatable {
  final int id;
  final String facebookId;
  final String instgramId;
  final String twitterId;


  SocialMedia({ required this.id, required this.facebookId,required this.instgramId, required this.twitterId});

  @override
  List<Object?> get props => [id, facebookId, instgramId, twitterId];
}

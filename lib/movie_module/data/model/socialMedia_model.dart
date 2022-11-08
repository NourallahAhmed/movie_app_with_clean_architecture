import 'package:movie_app/movie_module/domain/entites/social_media.dart';

class SocialMediaModel extends SocialMedia{
  SocialMediaModel({required super.id, required super.facebookId, required super.instgramId, required super.twitterId});
  factory SocialMediaModel.fromJson(Map<String, dynamic> json) {
    return SocialMediaModel(
        facebookId: json["facebook_id"] ?? "",
        instgramId: json["instagram_id"] ??  "",
        twitterId : json["twitter_id"] ?? "",
        id: json["id"]);
  }
}
import 'package:movie_app/movie_module/domain/entites/actor.dart';

class ActorModel extends Actor {
  ActorModel(
      {required super.id,
      required super.knownAs,
      required super.biography,
      required super.birthday,
      required super.placeOfBirth,
      required super.profilePath,
      required super.name});

factory ActorModel.fromJson(Map<String, dynamic> json) {
  return ActorModel(
      id: json["id"],
      biography: json["biography"] ?? "",
      birthday: json["birthday"] ?? "",
      placeOfBirth: json["place_of_birth"]??"",
      profilePath: json["profile_path"] ?? "",
      name: json["name"] ?? "",
      knownAs: List<String>.from(json["also_known_as"].map((e) => e)) );
}
}

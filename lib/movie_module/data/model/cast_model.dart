import '../../domain/entites/cast.dart';

class CastModel extends Cast {
  CastModel({required super.id, required super.department, required super.name, required super.character, required super.image, required super.creditId});

  factory CastModel.fromJson(Map<String, dynamic> json){


    print("castModel image ${json["profile_path"]}");
    return CastModel(
        id: json["id"],
        department: json["known_for_department"],
        name: json["name"],
        character: json["character"],
        image: json["profile_path"] ?? "",
        creditId: json["credit_id"]);
  }
}
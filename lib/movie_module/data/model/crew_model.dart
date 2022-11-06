import '../../domain/entites/crew.dart';

class CrewModel extends Crew{
  CrewModel({required super.id, required super.department, required super.name, required super.character, required super.image, required super.creditId, required super.job});
  factory CrewModel.fromJson(Map<String, dynamic> json){
    return CrewModel( id: json["id"],
        department: json["known_for_department"],
        name: json["name"],
        character: json["character"],
        image: json["profile_path"],
        creditId: json["credit_id"], job: json["job"]);
  }
}
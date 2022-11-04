import 'package:movie_app/movie_module/domain/entites/genres.dart';

class GenreModel extends Genres{
  GenreModel({required super.id, required super.name});
  factory GenreModel.fromJson(Map <String, dynamic> map){
    return  GenreModel(
        id: map["id"],
        name: map["name"]);
  }
}
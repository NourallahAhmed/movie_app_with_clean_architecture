import 'package:movie_app/movie_module/domain/entites/movie_recomendation.dart';

class MovieRecomendationModel extends MovieRecomendation {
  MovieRecomendationModel({required super.path, required super.id});


  factory MovieRecomendationModel.fromJson(Map<String, dynamic> json) {
    return MovieRecomendationModel( path: json["backdrop_path"] ?? "/rgZ3hdzgMgYgzvBfwNEVW01bpK1.jpg", id: json["id"]);
  }
}

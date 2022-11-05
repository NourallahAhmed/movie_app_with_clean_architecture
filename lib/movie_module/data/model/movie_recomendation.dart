import 'package:movie_app/movie_module/domain/entites/movie_recomendation.dart';

class MovieRecomendationModel extends MovieRecomendation {
  MovieRecomendationModel(
      {required super.path, required super.title, required super.id , required super.secondPath});

  factory MovieRecomendationModel.fromJson(Map<String, dynamic> json) {
    return MovieRecomendationModel(
        path: json["poster_path"] /*?? "/rgZ3hdzgMgYgzvBfwNEVW01bpK1.jpg"*/,
        title: json["title"],
        secondPath : json["backdrop_path"],
        id: json["id"]);
  }
}

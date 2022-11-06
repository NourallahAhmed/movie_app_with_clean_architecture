import 'package:movie_app/movie_module/domain/entites/movie_recomendation.dart';
import 'package:movie_app/movie_module/domain/entites/movie_similar.dart';

class SimilarMovieModel extends SimilarMovies {
  SimilarMovieModel({required super.path, required super.title, required super.id, required super.secondPath});


  factory SimilarMovieModel.fromJson(Map<String, dynamic> json) {
    return SimilarMovieModel(
        path: json["poster_path"]  ?? json["backdrop_path"]  ?? "/rgZ3hdzgMgYgzvBfwNEVW01bpK1.jpg",
        title: json["title"],
        secondPath : json["backdrop_path"] ?? json["poster_path"] ??"/rgZ3hdzgMgYgzvBfwNEVW01bpK1.jpg",
        id: json["id"]);
  }
}

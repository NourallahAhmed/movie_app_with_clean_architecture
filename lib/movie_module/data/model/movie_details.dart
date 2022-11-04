import 'package:equatable/equatable.dart';
import 'package:movie_app/movie_module/data/model/genre_Model.dart';
import 'package:movie_app/movie_module/domain/entites/movie_details.dart';

class MovieDetailsModel extends MovieDetails{
  MovieDetailsModel({required super.id, required super.posterPath, required super.title, required super.genre, required super.overview, required super.releaseDate, required super.voteAverage, required super.runTime});

  factory MovieDetailsModel.fromJson(Map <String , dynamic> map ){
    print(map);
    return MovieDetailsModel(
        id: map["id"],
        posterPath: map["poster_path"] ?? "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
        title: map["title"],
        overview: map["overview"],
        releaseDate: map["release_date"],
        voteAverage: map["vote_average"].toDouble(),
        genre: List<GenreModel>.from(map["genres"].map((e) => GenreModel.fromJson(e))),
        runTime: map["runtime"]);
  }

}
import 'package:equatable/equatable.dart';

class Movie  extends Equatable{
  int? id;
  String? posterPath;
  String?title;
  List<int?> genreIds;
  String? overview;
  String? releaseDate;
  double? voteAverage;

  Movie(
      {
        required this.id,
        required this.posterPath,
        required this.title,
        required this.genreIds,
        required this.overview,
        required this.releaseDate,
        required this.voteAverage
      });

  @override
  List<Object> get props  => [
    {
      id,
      posterPath,
      title,
      genreIds,
      overview,
      releaseDate,
      voteAverage,
    }
  ];

}

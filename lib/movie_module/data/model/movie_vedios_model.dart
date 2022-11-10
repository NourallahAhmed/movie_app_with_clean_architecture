import 'package:movie_app/movie_module/domain/entites/movie_vedios.dart';

class MovieVediosModel extends Movie_Vedios {
  MovieVediosModel(
      {required super.name, required super.key, required super.site, required super.type, required super.official, required super.id, required super.published_at});


  factory MovieVediosModel.fromJson(Map<String, dynamic> json){
    return MovieVediosModel(name: json["name"],
        key: json["key"] ,
        site: json["site"],
        type: json["type"],
        official:json["official"] ,
        id: json["id"],
        published_at: json["published_at"]);
  }


}
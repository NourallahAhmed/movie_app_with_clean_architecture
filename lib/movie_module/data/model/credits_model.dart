import 'package:movie_app/movie_module/data/model/cast_model.dart';
import 'package:movie_app/movie_module/data/model/crew_model.dart';
import 'package:movie_app/movie_module/domain/entites/credits.dart';

class CreditsModel extends Credits{
  CreditsModel({required super.cast, required super.crew});



  factory CreditsModel.fromJson(Map<String , dynamic> json) {
    return CreditsModel(

        cast: List<CastModel>.from(json["cast"].map((e) =>CastModel.fromJson(e))),
        crew: List<CrewModel>.from(json["crew"].map((e) =>CrewModel.fromJson(e)))
    );
}
}
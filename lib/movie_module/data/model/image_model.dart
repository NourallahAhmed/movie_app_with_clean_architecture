import 'package:movie_app/movie_module/domain/entites/images.dart';

class MovieImagesModel extends MovieImages {
  MovieImagesModel(
      {required super.aspectRatio,
      required super.height,
      required super.filePath,
      required super.width});

  factory MovieImagesModel.fromJson(Map<String, dynamic> json) {
    return MovieImagesModel(
        aspectRatio: json["aspect_ratio"],
        height: json["height"],
        filePath: json["file_path"],
        width: json["width"]
    );
  }
}

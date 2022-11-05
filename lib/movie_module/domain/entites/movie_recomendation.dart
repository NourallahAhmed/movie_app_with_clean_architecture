import 'package:equatable/equatable.dart';

class MovieRecomendation extends Equatable {
  String path;
  String title;
  String secondPath;
  int id;

  MovieRecomendation(
      {required this.path,
      required this.title,
      required this.id,
      required this.secondPath});

  @override
  // TODO: implement props
  List<Object?> get props => [id, path];
}

import 'package:equatable/equatable.dart';

class MovieRecomendation extends Equatable{
  String path;
  int id;

  MovieRecomendation({required this.path, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id , path];

}
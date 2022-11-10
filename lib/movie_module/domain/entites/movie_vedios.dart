import 'package:equatable/equatable.dart';

class Movie_Vedios extends Equatable {

  final String name;
  final String key;
  final String site;
  final String type;
  final bool official;
  final String id;
  final String published_at;

  Movie_Vedios({ required this.name,
    required this.key,
    required this.site,
    required this.type,
    required this.official,
    required this.id,
    required this.published_at});

  @override
  List<Object> get props =>
      [name, key, site, type, official, id, published_at,];
}
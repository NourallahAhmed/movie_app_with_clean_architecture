import 'package:equatable/equatable.dart';

class Actor extends Equatable{
    int id;
    List<String> knownAs;
    String biography;
    String birthday;
    String placeOfBirth;
    String profilePath;
    String name;

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    knownAs,
    biography,
    birthday,
    placeOfBirth,
    profilePath,
    name
  ];

    Actor(
        { required this.id,
          required this.knownAs,
          required this.biography,
          required this.birthday,
          required this.placeOfBirth,
          required this.profilePath,
          required this.name});
}
import 'package:equatable/equatable.dart';

class Crew extends Equatable{
  int? id;
  String? department;
  String? name;
  String? character;
  String? image;
  String? creditId;
  String? job;

  Crew(
      { required this.id,
        required this.department,
        required this.name,
        required this.character,
        required  this.image,
        required this.creditId,
        required this.job});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    department,
    character,
    image,
    creditId,
    name,
    job
  ];
}
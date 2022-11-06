import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  int? id;
  String? department;
  String? name;
  String? character;
  String? image;
  String? creditId;

  Cast(
      {required this.id,
      required this.department,
      required this.name,
      required this.character,
      required this.image,
      required this.creditId});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        department,
        character,
        image,
        creditId,
        name,
      ];
}

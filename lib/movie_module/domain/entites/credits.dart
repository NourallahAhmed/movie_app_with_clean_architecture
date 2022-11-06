import 'package:equatable/equatable.dart';
import 'package:movie_app/movie_module/domain/entites/crew.dart';

import 'cast.dart';

class Credits extends Equatable{
   List<Cast> cast;
   List<Crew> crew;

   Credits({ required this.cast, required this.crew});

  @override
  // TODO: implement props
  List<Object?> get props => [cast , crew];
   // factory Credits.fromJson(Map<String , dynamic> json) {
   //   return Credits(
   //     cast: json["cast"],
   //     crew : json ["crew"]
   //   );
   // }
}
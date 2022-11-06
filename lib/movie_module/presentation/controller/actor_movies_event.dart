part of 'actor_movies_bloc.dart';

@immutable
class ActorMoviesEvent extends Equatable {
  final int id;
  const ActorMoviesEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}


part of 'actor_movies_bloc.dart';

@immutable

abstract class ActorEvents extends Equatable{
  ActorEvents();

  @override
  List<Object> get props => [];
}

class ActorMoviesEvent extends ActorEvents {
  final int id;
   ActorMoviesEvent(this.id);

}
class ActorDetailsEvent extends ActorEvents {
  final int id;
   ActorDetailsEvent(this.id);

}
class ActorSocialMediaEvent extends ActorEvents {
  final int id;
  ActorSocialMediaEvent(this.id);

}


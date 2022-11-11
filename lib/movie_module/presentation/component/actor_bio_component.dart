import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movie_module/presentation/controller/actor_movies_bloc.dart';

import '../../../core/utils/app_String.dart';
import '../../../core/utils/enums.dart';
import 'package:readmore/readmore.dart';

import 'actor_social_media_component.dart';

class ActorBioComponent extends StatelessWidget {
  const ActorBioComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<ActorMoviesBloc , ActorMoviesState>

        (
          buildWhen: (prev, current) => prev.actorDetailsState != current.actorDetailsState,
          builder: (context , state){
          switch (state.actorDetailsState){

            case RequestState.loading:
              return Center(child: CircularProgressIndicator(),);

            case RequestState.loaded:
              return   SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.actorDetails?.name ?? "",
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            )),
                        const SizedBox(height: 8.0),

                        const ActorSocialMediaComponent(),

                        state.actorDetails!.placeOfBirth != "" ?

                        Text("Born at the ${state.actorDetails?.placeOfBirth ?? ""} in  ${state.actorDetails?.birthday ?? ""} " ?? "",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ))
                            :  Container(),
                        const SizedBox(height: 8.0),
                        state.actorDetails!.biography != "" ?
                        const Text( AppString.bio ?? " ",
                            style:  TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            )) : Container(),

                        const SizedBox(height: 8.0),

                        ReadMoreText(
                        state.actorDetails!.biography,
                          trimLines: 5,
                          style: const TextStyle(color: Colors.black),
                          colorClickableText: Colors.blue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...See more',
                          trimExpandedText: ' Collapse ',
                        ),

                        const SizedBox(height: 20.0),

                      ],
                    ),
                  ),
                ),
              );
            case RequestState.error:
            return Center(
            child:  Text("${state.actorDetailsMessage}"),
        );
          }
      });
  }
}

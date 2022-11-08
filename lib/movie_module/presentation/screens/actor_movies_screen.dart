import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/movie_module/presentation/controller/actor_movies_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entites/cast.dart';
import '../component/actor_bio_component.dart';
import '../component/actor_social_media_component.dart';
import 'movie_detail_screen.dart';

class ActorMoviesScreen extends StatelessWidget {
  final int id;
  final Cast cast;

  const ActorMoviesScreen({Key? key, required this.id, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            serviceLocator<ActorMoviesBloc>()
              ..add(ActorMoviesEvent(id))
        ..add(ActorDetailsEvent(id))
        ..add(ActorSocialMediaEvent(id)),
        child: Scaffold(
          body: BlocBuilder<ActorMoviesBloc, ActorMoviesState>(
              buildWhen: (pre, current) =>
                  pre.actorMoviesState != current.actorMoviesState,
              builder: (context, state) {
                switch (state.actorMoviesState) {
                  case RequestState.loading:
                    return SizedBox(
                        height: 400,
                        child: Center(
                          child:Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 400,
                              // width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ));

                  case RequestState.loaded:
                    return
                      CustomScrollView(
                          key: const Key('movieDetailScrollView'),
                          slivers: [

                            SliverAppBar(
                              pinned: true,
                              backgroundColor: Colors.transparent,
                              expandedHeight: 200.0,
                              flexibleSpace: FlexibleSpaceBar(
                                background: FadeIn(
                                  duration: const Duration(milliseconds: 500),
                                  child: ShaderMask(
                                    shaderCallback: (rect) {
                                      return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black,
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                        stops: [0.0, 0.5, 1.0, 1.0],
                                      ).createShader(
                                        Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                                      );
                                    },
                                    blendMode: BlendMode.dstIn,
                                    child: CachedNetworkImage(
                                      width: MediaQuery.of(context).size.width,
                                      imageUrl: ApiConstants.imageUrl(cast.image!),
                                      fit: BoxFit.cover,
                                      imageBuilder: (context, imageProvider) => Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          // shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: imageProvider, fit: BoxFit.fill),
                                        )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          //   SliverToBoxAdapter(
                          //     child: FadeInUp(
                          //   from: 20,
                          //   duration: const Duration(milliseconds: 500),
                          //   child: Text(state.actorDetails?.name ?? "",
                          //       style: GoogleFonts.poppins(
                          //         fontSize: 23,
                          //         fontWeight: FontWeight.w700,
                          //         letterSpacing: 1.2,
                          //       )),
                          // )),
                          // const ActorSocialMediaComponent(),
                            //todo: bio
                            const ActorBioComponent(),
                            //todo: MOVIES
                            SliverPadding(
                                padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                                sliver: _showActorMovies() //Recomendations()
                            ),
                          ]

                      );

                  case RequestState.error:
                    return SizedBox(
                      height: 400,
                      child: Center(child: Text(state.actorMoviesMessage)),
                    );
                }
              }),
        ));
  }

  Widget _showActorMovies() {
    return BlocBuilder<ActorMoviesBloc, ActorMoviesState>(
        builder: (context, state) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final movie = state.actorMovies[index];

                return
                  GestureDetector(
                    child: CachedNetworkImage(
                      height: 560.0,
                      imageUrl: ApiConstants.imageUrl(movie.posterPath ?? ""),
                      fit: BoxFit.cover,
                    ),
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: movie.id!)));
                    },
                  );

              },
              childCount: state.actorMovies.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
            ),
          );

        });
  }
}

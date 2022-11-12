import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/utils/api_constants.dart';
import 'package:movie_app/core/utils/app_String.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie_module/presentation/component/movie_images_component.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_details_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/utils/assets_images.dart';
import '../../domain/entites/genres.dart';
import '../component/cast_component.dart';
import '../component/movie_trailer_component.dart';
import '../component/social_media_component.dart';
import '../controller/movie_details_state.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => serviceLocator<MovieDetailsBloc>()
          ..add(GetMovieDetailsEvent(id))
          ..add(GetMovieRecomendationsEvent(id))
          ..add(GetSimilarMovieEvent(id))
          ..add(GetMovieCastEvent(id))
          ..add(GetMovieVediosEvent(id))
          ..add(GetSocialMediaEvent(id))
          ..add(GetMovieImagesEvent(id)),
        child: const Scaffold(
          body: MovieDetailContent(),
        ));
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
      switch (state.moviesDetailsState) {
        case RequestState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case RequestState.loaded:
          return CustomScrollView(
            key: const Key('movieDetailScrollView'),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(onPressed: () async {
                    final box = context.findRenderObject() as RenderBox?;
                    var movieTrailer = state.movieVedios.firstWhere((element) => element.type == "Trailer");

                    await Share.share(
                      "  _  ${AppString.appTitle} _ \nLets watch ${state.moviesDetails?.title} together\n \n"
                          "see the trailer : ${ApiConstants.youtubeTrailer(movieTrailer.key)}",



                      subject: "Watch Party",
                      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                    );
                  }, icon: const  Icon(Icons.share))
                ],
                pinned: true,
                expandedHeight: 250.0,
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
                        imageUrl: ApiConstants.imageUrl(
                            state.moviesDetails!.posterPath!),
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            SizedBox(
                                height: 100,
                                width: 150,
                                child: Image.asset(AssetsImages.moviePlaceholder)),
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(state.moviesDetails!.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                )),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                // color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                state.moviesDetails!.releaseDate.split('-')[0],
                                /*style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppConstants.titleColor,
                                ),*/
                              ),
                            ),
                            // const SizedBox(width: 16.0),
                            Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                              // color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    (state.moviesDetails!.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),


                                  // const SizedBox(width: 4.0),

                                  // Text(
                                  //   '(${state.moviesDetails!.voteAverage})',
                                  //   style: const TextStyle(
                                  //     fontSize: 1.0,
                                  //     fontWeight: FontWeight.w500,
                                  //     letterSpacing: 1.2,
                                  //     color: AppConstants.textColor,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            const SocialMediaComponent(),
                          ],
                        ),
                        const SizedBox(height: 16.0),

                        Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            // color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text(
                            _showDuration(state.moviesDetails!.runTime),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          state.moviesDetails!.overview,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Genres: ${_showGenres(state.moviesDetails!.genre)}',
                         /* style: const TextStyle(
                            color: AppConstants.titleColor,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),*/
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      AppString.cast.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(

                  child: SizedBox(

                      height: 250,
                      // width: 200,
                      child: CastComponent())
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      AppString.trailer.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              //Trailer
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver:

                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: const MovieTrailer(),
                  ),
                ),
              ),


              //similar
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      AppString.poster.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              // Images
              SliverPadding(padding: EdgeInsets.all(9.0),

              sliver:   SliverToBoxAdapter(

                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: const MovieImagesComponent(),
                ),
              ),
              ),

              //similar
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      AppString.similar.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: _showSimilar()
                  ),

              //recommendation
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      AppString.recommendation.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: _showRecommendations() //Recomendations()
                  ),
            ],
          );
        case RequestState.error:
          return Center(
            child: Text("${state.moviesDetailsMessage}"),
          );
      }
    });
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showRecommendations() {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final recommendation = state.moviesRecomendations[index];

            return GestureDetector(
              child: CachedNetworkImage(
                height: 560.0,
                imageUrl: ApiConstants.imageUrl(recommendation.path),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                  SizedBox(
                      height: 100,
                      width: 150,
                      child: Image.asset(AssetsImages.moviePlaceholder)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailScreen(id: recommendation.id)));
              },
            );
          },
          childCount: state.moviesRecomendations.length,
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

  Widget _showSimilar() {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
      return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final recommendation = state.similarMovies[index];

            return GestureDetector(
              child: CachedNetworkImage(
                height: 560.0,
                imageUrl: ApiConstants.imageUrl(recommendation.path),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    SizedBox(
                        height: 100,
                        width: 150,
                        child: Image.asset(AssetsImages.moviePlaceholder)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailScreen(id: recommendation.id)));
              },
            );
          },
          childCount: state.similarMovies.length,
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

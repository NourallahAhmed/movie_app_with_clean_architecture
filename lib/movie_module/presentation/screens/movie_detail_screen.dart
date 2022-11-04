import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/core/utils/api_constants.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie_module/domain/entites/movie_recomendation.dart';
import 'package:movie_app/movie_module/presentation/component/recommendation_component.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_details_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/dummy (1).dart';
import '../../domain/entites/genres.dart';
import '../../domain/entites/movie_details.dart';













class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => serviceLocator<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(id))
        ..add(GetMovieRecomendationsEvent(id)),
      child:
         Scaffold(
          body: MovieDetailContent(
          ),
        )

    );
  }
}

class MovieDetailContent extends StatelessWidget {


  const MovieDetailContent({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc , MovieDetailsState>(
      builder: (context , state) {
       switch (state.moviesDetailsState){

         case RequestState.loading:
            return Center(child: CircularProgressIndicator(),);
         case RequestState.loaded:
           return CustomScrollView(
             key: const Key('movieDetailScrollView'),
             slivers: [
               SliverAppBar(
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
                         imageUrl: ApiConstants.imageUrl(state.moviesDetails!.posterPath!),
                         fit: BoxFit.cover,
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
                           children: [
                             Container(
                               padding: const EdgeInsets.symmetric(
                                 vertical: 2.0,
                                 horizontal: 8.0,
                               ),
                               decoration: BoxDecoration(
                                 color: Colors.grey[800],
                                 borderRadius: BorderRadius.circular(4.0),
                               ),
                               child: Text(
                                 state.moviesDetails!.releaseDate.split('-')[0],
                                 style: const TextStyle(
                                   fontSize: 16.0,
                                   fontWeight: FontWeight.w500,
                                 ),
                               ),
                             ),
                             const SizedBox(width: 16.0),
                             Row(
                               children: [
                                 const Icon(
                                   Icons.star,
                                   color: Colors.amber,
                                   size: 20.0,
                                 ),
                                 const SizedBox(width: 4.0),
                                 Text(
                                   (state.moviesDetails!.voteAverage / 2).toStringAsFixed(1),
                                   style: const TextStyle(
                                     fontSize: 16.0,
                                     fontWeight: FontWeight.w500,
                                     letterSpacing: 1.2,
                                   ),
                                 ),
                                 const SizedBox(width: 4.0),
                                 Text(
                                   '(${state.moviesDetails!.voteAverage})',
                                   style: const TextStyle(
                                     fontSize: 1.0,
                                     fontWeight: FontWeight.w500,
                                     letterSpacing: 1.2,
                                   ),
                                 ),
                               ],
                             ),
                             const SizedBox(width: 16.0),
                             Text(
                               _showDuration(state.moviesDetails!.runTime),
                               style: const TextStyle(
                                 color: Colors.white70,
                                 fontSize: 16.0,
                                 fontWeight: FontWeight.w500,
                                 letterSpacing: 1.2,
                               ),
                             ),
                           ],
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
                           style: const TextStyle(
                             color: Colors.white70,
                             fontSize: 12.0,
                             fontWeight: FontWeight.w500,
                             letterSpacing: 1.2,
                           ),
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
                       'More like this'.toUpperCase(),
                       style: const TextStyle(
                         fontSize: 16.0,
                         fontWeight: FontWeight.w500,
                         letterSpacing: 1.2,
                       ),
                     ),
                   ),
                 ),
               ),
               // Tab(text: 'More like this'.toUpperCase()),

                SliverPadding(
                 padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                 sliver: state.moviesRecomendationsState == RequestState.loaded ?  Recomendations() : CircularProgressIndicator(),
               ),
             ],
           );
         case RequestState.error:
           return Center(
           child:  Text("${state.moviesDetailsMessage}"),
           );
       }
      }
    );
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



  //
  // Widget _showRecommendations() {
  //   return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
  //       builder: (context, state) {
  //     // switch (state.moviesRecomendationsState) {
  //     //   case RequestState.loading:
  //     //     return  Center(child: CircularProgressIndicator());
  //     //   case RequestState.loaded:
  //         print(state.moviesRecomendations);
  //         print(state.moviesRecomendationsState);
  //
  //         return SliverGrid(
  //           delegate: SliverChildBuilderDelegate(
  //             (context, index) {
  //               final recommendation = state.moviesRecomendations[index];
  //               return FadeInUp(
  //                 from: 20,
  //                 duration: const Duration(milliseconds: 500),
  //                 child: ClipRRect(
  //                   borderRadius: const BorderRadius.all(Radius.circular(4.0)),
  //                   child: CachedNetworkImage(
  //                     imageUrl: ApiConstants.imageUrl(recommendation.path),
  //                     placeholder: (context, url) => Shimmer.fromColors(
  //                       baseColor: Colors.grey[850]!,
  //                       highlightColor: Colors.grey[800]!,
  //                       child: Container(
  //                         height: 170.0,
  //                         width: 120.0,
  //                         decoration: BoxDecoration(
  //                           color: Colors.black,
  //                           borderRadius: BorderRadius.circular(8.0),
  //                         ),
  //                       ),
  //                     ),
  //                     errorWidget: (context, url, error) =>
  //                         const Icon(Icons.error),
  //                     height: 180.0,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               );
  //             },
  //             childCount: state.moviesRecomendations.length,
  //           ),
  //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //             mainAxisSpacing: 8.0,
  //             crossAxisSpacing: 8.0,
  //             childAspectRatio: 0.7,
  //             crossAxisCount: 3,
  //           ),
  //         );
  //     //   case RequestState.error:
  //     //     return SizedBox(
  //     //       height: 400,
  //     //       child: Center(child: Text(state.moviesRecomendationsMessage)),
  //     //     );
  //     // }
  //   });
  // }
}





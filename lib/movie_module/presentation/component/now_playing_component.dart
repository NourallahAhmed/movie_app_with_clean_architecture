import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';  // slide images
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/api_constants.dart';
import '../../../core/utils/enums.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MoviesBloc , MoviesState>(
      buildWhen: (pre , current) =>  pre.nowPlayingState != current.nowPlayingState,
      builder: (context , state){
        switch(state.nowPlayingState){
          case RequestState.loading:
            return SizedBox(
              height: 400,
              child: Center(
                child: Shimmer.fromColors(
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
              )
            );
          case RequestState.loaded:
           return FadeIn( // todo animate_do
             duration: const Duration(milliseconds: 500),
             child: CarouselSlider(
               options: CarouselOptions(
                 height: 400.0,
                 viewportFraction: 1.0,
                 onPageChanged: (index, reason) {},
               ),

               items: state.nowPlayingMovies.map(
                     (item) {
                   return GestureDetector(
                     key: const Key('openMovieMinimalDetail'),
                     onTap: () {
                       /// TODO : NAVIGATE TO MOVIE DETAILS
                     },
                     child: Stack(
                       children: [
                         ShaderMask(
                           shaderCallback: (rect) {
                             return const LinearGradient(
                               begin: Alignment.topCenter,
                               end: Alignment.bottomCenter,
                               colors: [
                                 // fromLTRB
                                 Colors.transparent,
                                 Colors.black,
                                 Colors.black,
                                 Colors.transparent,
                               ],
                               stops: [0, 0.3, 0.5, 1],
                             ).createShader(
                               Rect.fromLTRB(0, 0, rect.width, rect.height),
                             );
                           },
                           blendMode: BlendMode.dstIn,
                           child: Center(
                             child: CachedNetworkImage(
                               height: 560.0,
                               imageUrl: ApiConstants.imageUrl(item.posterPath!),
                               fit: BoxFit.cover,

                             ),
                           ),
                         ),
                         Align(
                           alignment: Alignment.bottomCenter,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 16.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     const Icon(
                                       Icons.circle,
                                       color: Colors.redAccent,
                                       size: 16.0,
                                     ),
                                     const SizedBox(width: 4.0),
                                     Text(
                                       'Now Playing'.toUpperCase(),
                                       style: const TextStyle(
                                         fontSize: 16.0,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 16.0),
                                 child: Text(
                                   item.title!,
                                   textAlign: TextAlign.center,
                                   style: const TextStyle(
                                     fontSize: 24,
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   );
                 },
               ).toList(),
             ),
           );
          case RequestState.error:
           return SizedBox(
              height: 400,
              child: Center(
                child: Text(state.nowPlayingMessage)
              ),
            );
        }

      },

    );
  }
}

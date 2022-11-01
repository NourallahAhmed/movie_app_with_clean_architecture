
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/api_constants.dart';
import '../../../core/utils/dummy.dart';
import '../../../core/utils/enums.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MoviesBloc , MoviesState>(
      buildWhen: (pre , current) =>  pre.topRatedState != current.topRatedState,

    builder: (context , state){
      switch(state.topRatedState){

        case RequestState.loading:
          return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                        ),

                    );
                  },
                ),
              ),
          );
        case RequestState.loaded:
          return  FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.topRatedMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstants.imageUrl(movie.posterPath!),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
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

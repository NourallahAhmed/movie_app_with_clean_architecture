
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc_state.dart';
import 'package:movie_app/movie_module/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/api_constants.dart';
import '../../../core/utils/assets_images.dart';
import '../../../core/utils/enums.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <MoviesBloc , MoviesState>(
      buildWhen: (pre , current) =>  pre.popularState != current.popularState,

      builder: (context , state){
        switch(state.popularState){

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
          return    FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.popularMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.popularMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: movie.id! )));
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstants.imageUrl(movie.posterPath ?? ""),
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
                              SizedBox(
                                  height: 100,
                                  width: 150,
                                  child: Image.asset(AssetsImages.moviePlaceholder)),

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

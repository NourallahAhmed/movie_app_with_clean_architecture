import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../controller/movie_details_bloc.dart';
import '../controller/movie_details_state.dart';

class Recomendations extends StatelessWidget {

  const Recomendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          switch (state.moviesRecomendationsState) {
            case RequestState.loading:
              return  Center(child: CircularProgressIndicator());
            case RequestState.loaded:
          print(state.moviesRecomendations);
          print(state.moviesRecomendationsState);

          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final recommendation = state.moviesRecomendations[index];
                return FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    child: CachedNetworkImage(
                      imageUrl: ApiConstants.imageUrl(recommendation.path),
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
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
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
            case RequestState.error:
              return SizedBox(
                height: 400,
                child: Center(child: Text(state.moviesRecomendationsMessage)),
              );
          }
        });
  }
}

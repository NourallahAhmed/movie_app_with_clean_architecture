import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../controller/search_bloc.dart';
import '../screens/movie_detail_screen.dart';

class search_result_component extends StatelessWidget {
  const search_result_component({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      switch (state.searchMoviesResultState) {
        case RequestState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case RequestState.loaded:
          return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final movie = state.searchMoviesResult[index];

                      return GestureDetector(
                        child: CachedNetworkImage(
                          height: 560.0,
                          imageUrl: ApiConstants.imageUrl(movie.posterPath!),
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailScreen(id: movie.id!)));
                        },
                      );
                    },
                    childCount: state.searchMoviesResult.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.7,
                    crossAxisCount: 3,
                  ),
                )
              ]);
        case RequestState.error:
          return Center(
            child: Text("${state.searchMoviesResultMessage}"),
          );
      }
    });
  }
}

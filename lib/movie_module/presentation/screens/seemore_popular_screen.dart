import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc_event.dart';
import 'package:movie_app/movie_module/presentation/controller/seemore_movies_bloc.dart';
import 'package:readmore/readmore.dart';

import '../../../core/utils/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../component/search_bar_component.dart';
import 'movie_detail_screen.dart';

class SeeMorePopularScreen extends StatelessWidget {
  const SeeMorePopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<SeemoreMoviesBloc>()
        ..add(SeeMorePopularMoviesEvents(2)),
      child: BlocBuilder<SeemoreMoviesBloc, SeeMoreMoviesState>(
        buildWhen: (pre, curr) =>
            pre.seemorePopularState != curr.seemorePopularState,
        builder: (context, state) {
          switch (state.seemorePopularState) {
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case RequestState.loaded:
              return Scaffold(
                appBar: AppBar(backgroundColor: Colors.transparent, actions: [
                  IconButton(
                    onPressed: () {
                      // method to show the search bar
                      showSearch(
                          context: context,
                          // delegate to customize the search bar
                          delegate: CustomSearchDelegate());
                    },
                    icon: const Icon(Icons.search),
                  )
                ]),
                body: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                  var movie = state.seemorePopularMovies[index];
                  return FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      margin: const EdgeInsets.all(9.0),
                      padding: const EdgeInsets.all(9.0),
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child:



                      GestureDetector(
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              height: 150.0,
                              width: 130,
                              imageUrl: ApiConstants.imageUrl(movie.posterPath!),
                              fit: BoxFit.fill,
                            ),
                            const SizedBox(width: 15,),
                            Expanded(
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [

                                  Text(
                                    movie.title!,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      // letterSpacing: 1.2,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 2,
                                  ),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        (movie.voteAverage! / 2).toStringAsFixed(1),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    width: 5,
                                  ),

                                  ReadMoreText(
                                    movie.overview!,
                                    trimLines: 3,
                                    style: const TextStyle(color: Colors.black),
                                    colorClickableText: Colors.blue,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '...See more',
                                    trimExpandedText: ' Collapse ',
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailScreen(id: movie.id!)));

                        },
                      ),
                    ),
                  );

                },
                itemCount: state.seemorePopularMovies.length,),


              );

            case RequestState.error:
              return Center(
                child: Text(state.seemorePopularMessage),
              );
          }
        },
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entites/cast.dart';
import '../controller/movie_details_bloc.dart';
import '../screens/actor_movies_screen.dart';

class CastComponent extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
  return BlocBuilder<MovieDetailsBloc , MovieDetailsState>(

      builder:(context , state){
        switch(state.creditsMoviesState){

          case RequestState.loading:
            return SizedBox(
                height: 400,
                child: Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: 100,
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

            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 150.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.creditsMovies?.cast.length ,

                  itemBuilder: (context, index) {
                    final cast = state.creditsMovies!.cast[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      // decoration:  const BoxDecoration(
                      // shape: BoxShape. circle),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ActorMoviesScreen(id: cast.id!, cast: cast, )));
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CachedNetworkImage(
                                // width: 120.0,
                                fit: BoxFit.fill,
                                imageUrl: ApiConstants.imageUrl(cast.image! ),
                                imageBuilder: (context, imageProvider) => Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.fill),
                                  ),
                                ),
                                placeholder: (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: 100.0,
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),

                              ),

                              SizedBox(height: 10,) ,

                              Text(cast.name!),
                              // Text("in"),
                              // Text(cast.character!.substring(0,[cast.character!.indexOf("\")]),
                            ],
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
                  child: Text(state.creditsMoviesMessage)
              ),
            );

        }
      }
  );
  }

}
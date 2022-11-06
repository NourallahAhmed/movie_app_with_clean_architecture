import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entites/cast.dart';
import '../controller/movie_details_bloc.dart';

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
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.creditsMovies?.cast?.length ,
                  itemBuilder: (context, index) {
                    final Cast? cast = state.creditsMovies?.cast?[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      // decoration:  const BoxDecoration(
                      // shape: BoxShape. circle),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailScreen(id: cast.id! )));
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.fill,
                            imageUrl: ApiConstants.imageUrl(cast?.image ?? "/kQh7U7kRLF9NKEMpxiGjZEIu0o3.jpg" ),
                            imageBuilder: (context, imageProvider) => Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
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
                  child: Text(state.creditsMoviesMessage)
              ),
            );

        }
      }
  );
  }

}
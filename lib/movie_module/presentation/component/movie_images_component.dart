import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_String.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/api_constants.dart';
import '../../../core/utils/assets_images.dart';
import '../../../core/utils/enums.dart';
import '../controller/movie_details_bloc.dart';
import '../controller/movie_details_state.dart';

class MovieImagesComponent extends StatelessWidget {
  const MovieImagesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
     buildWhen: (pre, current)  =>  pre.moviesImagesState != current.moviesImagesState,
     builder: (context , state){
      switch (state.moviesImagesState) {
        case RequestState.loading:

          return
            Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 350.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            );

        case RequestState.loaded:


          if (state.moviesImages!.isNotEmpty) {
            return CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),

              items: state.moviesImages?.map(
                    (item) {
                  return
                    Center(
                      child: CachedNetworkImage(
                        height: 560.0,
                        imageUrl: ApiConstants.imageUrl(
                            item.filePath),
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            SizedBox(
                                height: 100,
                                width: 150,
                                child: Image.asset(AssetsImages.moviePlaceholder)),
                      ),
                    );
                },
              ).toList(),
            );
          }
          else{
           return Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
               Text(AppString.postersError),
               Icon(Icons.error_outline , color: Colors.red,)

             ],
           );
          }
        case RequestState.error:
          return Center(child: Text(state.moviesImagesMessage!),);
      }
    }
    );

  }
}

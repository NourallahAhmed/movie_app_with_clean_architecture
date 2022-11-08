import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_details_bloc.dart';

import '../../../core/utils/api_constants.dart';
import '../../../core/utils/assets_images.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/functions.dart';

class SocialMediaComponent extends StatelessWidget {
  const SocialMediaComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc , MovieDetailsState>
    (
        buildWhen: (pre , curr) => pre.socialMediaState != curr.socialMediaState,
        builder: (context , state){
      switch (state.socialMediaState){

        case RequestState.loading:
          return Center(child: CircularProgressIndicator(),);

        case RequestState.loaded:

          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(child: Image.asset(AssetsImages.instgram , height: 30, width: 40,), onTap: (){


                print("state.socialMediaMovies!.instgramId!");
                print(state.socialMediaMovies!.instgramId.isEmpty);

                if (state.socialMediaMovies!.instgramId == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No link available"),
                      ));
                }
                else {
                  Functions.launch_Url(ApiConstants.instgramUrl( state.socialMediaMovies!.instgramId));
                  print("entered");
                }
              },) ,
              GestureDetector(child: Image.asset(AssetsImages.facebook , height: 30, width: 40,), onTap: (){



                if (state.socialMediaMovies!.facebookId == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No link available"),
                      ));
                }
                else {
                  Functions.launch_Url(ApiConstants.facebookUrl( state.socialMediaMovies!.facebookId));
                  print("entered");
                }
              },),
              GestureDetector(child: Image.asset(AssetsImages.twitter , height: 30, width: 40,), onTap: (){

                if (state.socialMediaMovies!.twitterId == "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No link available"),
                      ));
                }
                else {
                  Functions.launch_Url(ApiConstants.twitterUrl( state.socialMediaMovies!.twitterId));

                }
              },)
            ],
          );

        case RequestState.error:
         return Container(child: Text(state.socialMediaMessage),);
      }
  });
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/actor_movies_bloc.dart';

import '../../../core/utils/api_constants.dart';
import '../../../core/utils/assets_images.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/functions.dart';

class ActorSocialMediaComponent extends StatelessWidget {
  const ActorSocialMediaComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorMoviesBloc , ActorMoviesState>
      (
        buildWhen: (pre , curr) => pre.actorSocialMediaState != curr.actorSocialMediaState,
        builder: (context , state){
          switch (state.actorSocialMediaState){

            case RequestState.loading:
              print("loading");
              return const Center(child: CircularProgressIndicator(),);

            case RequestState.loaded:
              print("loaded");

              return

             /*  SliverToBoxAdapter(
                  child: */   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(child: Image.asset(AssetsImages.instgram , height: 30, width: 40,), onTap: (){

                        if (state.actorSocialMedia!.instgramId == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No link available"),
                              ));
                        }
                        else {
                          Functions.launch_Url(ApiConstants.instgramUrl( state.actorSocialMedia!.instgramId));
                          print("entered");
                        }
                      },) ,
                      GestureDetector(child: Image.asset(AssetsImages.facebook , height: 30, width: 40,), onTap: (){



                        if (state.actorSocialMedia!.facebookId == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No link available"),
                              ));
                        }
                        else {
                          Functions.launch_Url(ApiConstants.facebookUrl( state.actorSocialMedia!.facebookId));
                          print("entered");
                        }
                      },),
                      GestureDetector(child: Image.asset(AssetsImages.twitter , height: 30, width: 40,), onTap: (){

                        if (state.actorSocialMedia!.twitterId == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("No link available"),
                              ));
                        }
                        else {
                          Functions.launch_Url(ApiConstants.twitterUrl( state.actorSocialMedia!.twitterId));

                        }
                      },)
                    ],
                  );

              // );

            case RequestState.error:
              return Container(child: Text(state.actorSocialMediaMessage),);
          }
        });
  }
}

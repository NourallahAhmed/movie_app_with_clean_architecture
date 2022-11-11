import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_details_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../core/utils/enums.dart';

class MovieTrailer extends StatelessWidget {
  const MovieTrailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
      switch (state.movieVediosState) {
        case RequestState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );

        case RequestState.loaded:
          if (state.movieVedios.isNotEmpty) {
            var movieTrailer = state.movieVedios
                .firstWhere((element) => element.type == "Trailer");
            YoutubePlayerController youTubeController = YoutubePlayerController(
              initialVideoId: movieTrailer.key,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            );
            return YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: youTubeController,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
                builder: (context, player) {
                  return GestureDetector(
                    child: player,
                    onTap: () {
                      if (youTubeController.value.playerState ==
                          PlayerState.paused) {
                        youTubeController.play();
                      } else {
                        youTubeController.pause();
                      }
                      ;
                    },
                  );
                });
          } else {
            return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 Text("No supported Trailer found"),

                 Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    ),
                 )
              ],
            );
          }

        case RequestState.error:
          return Center(
            child: Text(state.movieVediosMessage),
          );
      }
    });
  }

// void listener() {
//   if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//     setState(() {
//       _playerState = _controller.value.playerState;
//       _videoMetaData = _controller.metadata;
//     });
//   }
// }
}

import 'package:flutter/material.dart';
import 'package:movie_app/movie_module/data/datasource/remote_data_source.dart';
import 'package:movie_app/movie_module/data/repository/MovieRepository.dart';
import 'package:movie_app/movie_module/domain/entites/movie.dart';
import 'package:movie_app/movie_module/domain/repository/BaseRepository.dart';
import 'package:movie_app/movie_module/domain/usecase/get_now_playing_movie_usecase.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
   List<Movie> listOfMovies = [];
  initState(){
    print("initState");
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text("${listOfMovies.first.title}")
    );
  }

  void _getData() async {

    BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
    BaseMovieRepository baseMovieRepository = MovieRepository(baseRemoteDataSource);
    GetNowPlayingMovies getNowPlayingMovies = GetNowPlayingMovies(baseMovieRepository);

    final result = await getNowPlayingMovies.getNowPlayingMovies();
   setState((){
     result.fold((l) => print(l), (r) => listOfMovies = r);
   });


  }
}

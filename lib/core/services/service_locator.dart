
import 'package:get_it/get_it.dart';
import 'package:movie_app/movie_module/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc_event.dart';

import '../../movie_module/data/datasource/remote_data_source.dart';
import '../../movie_module/data/repository/MovieRepository.dart';
import '../../movie_module/domain/repository/BaseRepository.dart';
import '../../movie_module/domain/usecase/get_now_playing_movie_usecase.dart';

GetIt serviceLocator = GetIt.instance;

class ServiceLocator{
  void init(){
    //MovieBloc

    serviceLocator.registerFactory(() => MoviesBloc(serviceLocator(),serviceLocator(),serviceLocator(),));
    //RemoteDataSource
    serviceLocator.registerLazySingleton<BaseRemoteDataSource>(() =>  RemoteDataSource());

    //MovieRepository
    serviceLocator.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(serviceLocator()));

    //GetNowPlayingMoviesUseCase
    serviceLocator.registerLazySingleton<GetNowPlayingMoviesUseCase>(() =>  GetNowPlayingMoviesUseCase(serviceLocator()));
    //GetTopRatedMoviesUseCase
    serviceLocator.registerLazySingleton<GetTopRatedMoviesUseCase>(() =>  GetTopRatedMoviesUseCase(serviceLocator()));
    //GetPopularMoviesUseCase
    serviceLocator.registerLazySingleton<GetPopularMoviesUseCase>(() =>  GetPopularMoviesUseCase(serviceLocator()));
  }

}
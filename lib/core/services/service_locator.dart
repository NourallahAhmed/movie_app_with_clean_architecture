import 'package:get_it/get_it.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_details_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_recommendations_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc.dart';
import '../../movie_module/data/datasource/remote_data_source.dart';
import '../../movie_module/data/repository/MovieRepository.dart';
import '../../movie_module/domain/repository/BaseRepository.dart';
import '../../movie_module/domain/usecase/get_now_playing_movie_usecase.dart';
import '../../movie_module/presentation/controller/movie_details_bloc.dart';

GetIt serviceLocator = GetIt.instance;

class ServiceLocator{
  void init(){
    //todo: MovieBloc
    serviceLocator.registerFactory(() => MoviesBloc(serviceLocator(),serviceLocator(),serviceLocator()));

    //todo: MovieDetailsBloc
    serviceLocator.registerFactory(() => MovieDetailsBloc(serviceLocator(),serviceLocator()));

    //todo: RemoteDataSource
    serviceLocator.registerLazySingleton<BaseRemoteDataSource>(() =>  RemoteDataSource());

    //todo: MovieRepository
    serviceLocator.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(serviceLocator()));

    //todo: GetNowPlayingMoviesUseCase
    serviceLocator.registerLazySingleton<GetNowPlayingMoviesUseCase>(() =>  GetNowPlayingMoviesUseCase(serviceLocator()));

    //todo: GetTopRatedMoviesUseCase
    serviceLocator.registerLazySingleton<GetTopRatedMoviesUseCase>(() =>  GetTopRatedMoviesUseCase(serviceLocator()));

    //todo: GetPopularMoviesUseCase
    serviceLocator.registerLazySingleton<GetPopularMoviesUseCase>(() =>  GetPopularMoviesUseCase(serviceLocator()));

    //todo: GetMoviesDetailsUseCase
    serviceLocator.registerLazySingleton<GetMovieDetailsUseCase>(() =>  GetMovieDetailsUseCase(serviceLocator()));

    //todo: GetMovieRecomendationsUseCase
    serviceLocator.registerLazySingleton<GetMovieRecomendationsUseCase>(() =>  GetMovieRecomendationsUseCase(serviceLocator()));
  }

}
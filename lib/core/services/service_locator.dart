import 'package:get_it/get_it.dart';
import 'package:movie_app/movie_module/domain/usecase/get_actor_movies_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_cast_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_details_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_recommendations_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_similar_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_social_media.dart';
import 'package:movie_app/movie_module/domain/usecase/get_person_social_media.dart';
import 'package:movie_app/movie_module/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_upcoming_movie_usecase.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movie_module/presentation/controller/movie_bloc_event.dart';
import 'package:movie_app/movie_module/presentation/controller/search_bloc.dart';
import '../../movie_module/data/datasource/remote_data_source.dart';
import '../../movie_module/data/repository/MovieRepository.dart';
import '../../movie_module/domain/repository/BaseRepository.dart';
import '../../movie_module/domain/usecase/get_actor_details_usecase.dart';
import '../../movie_module/domain/usecase/get_now_playing_movie_usecase.dart';
import '../../movie_module/domain/usecase/search_movie_usecase.dart';
import '../../movie_module/presentation/controller/actor_movies_bloc.dart';
import '../../movie_module/presentation/controller/movie_details_bloc.dart';

GetIt serviceLocator = GetIt.instance;

class ServiceLocator{
  void init(){
    //todo: MovieBloc
    serviceLocator.registerFactory(() => MoviesBloc(serviceLocator(),serviceLocator(),serviceLocator() , serviceLocator()));
 //todo: SearchBloc
    serviceLocator.registerFactory(() => SearchBloc(serviceLocator()));

    //todo: MovieDetailsBloc
    serviceLocator.registerFactory(() => MovieDetailsBloc(serviceLocator(),serviceLocator() , serviceLocator() , serviceLocator(), serviceLocator()));
    //todo: MovieDetailsBloc

    serviceLocator.registerFactory(() => ActorMoviesBloc(serviceLocator() , serviceLocator(), serviceLocator()));

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


    //todo: GetSimilarMovieUseCase
    serviceLocator.registerLazySingleton<GetMovieSimilarUseCase>(() =>  GetMovieSimilarUseCase(serviceLocator()));


    //todo: GetUpComingUseCase
    serviceLocator.registerLazySingleton<GetUpComingMovieUseCase>(() =>  GetUpComingMovieUseCase(serviceLocator()));


    //todo: GetCastUseCase
    serviceLocator.registerLazySingleton<GetMovieCastUseCase>(() =>  GetMovieCastUseCase(serviceLocator()));
    //todo: GetActorMoviesUseCase
    serviceLocator.registerLazySingleton<GetActorMoviesUseCase>(() =>  GetActorMoviesUseCase(serviceLocator()));
    //todo: GetActorDetailsUseCase

    serviceLocator.registerLazySingleton<GetActorDetailsUseCase>(() =>  GetActorDetailsUseCase(serviceLocator()));

    //todo: search movie UseCase

    serviceLocator.registerLazySingleton<SearchMoviesUseCase>(() =>  SearchMoviesUseCase(serviceLocator()));
    //todo: GetMovieSocialMediaUseCase

    serviceLocator.registerLazySingleton<GetMovieSocialMediaUseCase>(() =>  GetMovieSocialMediaUseCase(serviceLocator()));

    //todo: GetPersonSocialMediaUseCase

    serviceLocator.registerLazySingleton<GetPersonSocialMediaUseCase>(() =>  GetPersonSocialMediaUseCase(serviceLocator()));
  }

}
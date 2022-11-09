import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/core/error/Exceptions.dart';
import 'package:movie_app/core/error_message_model/Error_Message_Model.dart';
import 'package:movie_app/core/utils/api_constants.dart';
import 'package:movie_app/movie_module/data/model/actor_model.dart';
import 'package:movie_app/movie_module/data/model/credits_model.dart';
import 'package:movie_app/movie_module/data/model/movie_recomendation.dart';
import 'package:movie_app/movie_module/data/model/similar_movie_model.dart';
import 'package:movie_app/movie_module/data/model/socialMedia_model.dart';
import 'package:movie_app/movie_module/domain/entites/movie_similar.dart';
import 'package:movie_app/movie_module/domain/usecase/get_actor_movies_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_details_usecase.dart';
import 'package:movie_app/movie_module/domain/usecase/search_movie_usecase.dart';

import '../../../core/base_usecase/base_usecase.dart';
import '../../domain/entites/actor.dart';
import '../../domain/entites/movie_recomendation.dart';
import '../../domain/usecase/get_movie_recommendations_usecase.dart';
import '../../domain/usecase/get_movie_similar_usecase.dart';
import '../model/MovieModel.dart';
import '../model/movie_details.dart';

abstract class BaseRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpComingMovies();
  Future<List<MovieModel>> getActorMovies(ActorDetailsParameters actorDetailsParameters);

  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters movieDetailsParameters);
  Future<List<MovieRecomendation>> getMoviesRecomendations(MovieRecomendationParameters movieRecomendationParameters);
  Future<List<SimilarMovies>> getSimilarMovies(MovieSimilarParameters movieSimilarParameters);
  Future<CreditsModel> getMovieCast(MovieDetailsParameters movieDetailsParameters);

  Future<Actor> getActorDetails(ActorDetailsParameters actorDetailsParameters);

  Future<List<MovieModel>> searchMovie(SearchParameters searchParameters);

  Future<SocialMediaModel> getSocialMediaIds(MovieDetailsParameters movieDetailsParameters);

  Future<SocialMediaModel> getPersonSocialMediaIds(ActorDetailsParameters actorDetailsParameters);

  Future<List<MovieModel>> getSeeMorePopularMovies(MovieParameters movieParameters);

  Future<List<MovieModel>>  getSeeMoreTopRatedMovies(MovieParameters movieParameters);
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {

    // print(ApiConstants.nowPlayingMovies);
      var response =  await Dio().get(ApiConstants.nowPlayingMovies);

      if (response.statusCode == 200){

        return List<MovieModel>.from((response.data["results"]).map((e) => MovieModel.fromJson(e)));
      }
      else{
        throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
      }

  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    var response =  await Dio().get(ApiConstants.popularMovies);
    print("Popoular");
    print(ApiConstants.popularMovies);

    if (response.statusCode == 200){

      return List<MovieModel>.from((response.data["results"]).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }

  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var response =  await Dio().get(ApiConstants.topRatedMovies);

    if (response.statusCode == 200){

      return List<MovieModel>.from((response.data["results"]).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters movieDetailsParameters) async {


    final url = ApiConstants.detailsUrl(movieDetailsParameters.movieId);
    var response =  await Dio().get(url);
    if (response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data);
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieRecomendation>> getMoviesRecomendations(MovieRecomendationParameters movieRecomendationParameters) async{
    var response =  await Dio().get(ApiConstants.recommendationsUrl(movieRecomendationParameters.movieId));

    print("Recomendations: ${response.data["results"]}");
    if (response.statusCode == 200){

      return List<MovieRecomendation>.from((response.data["results"]).map((e) => MovieRecomendationModel.fromJson(e)));

    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<SimilarMovies>> getSimilarMovies(MovieSimilarParameters movieSimilarParameters) async{
    var response =  await Dio().get(ApiConstants.getSimilar(movieSimilarParameters.movieId));
    print("similar: ${response.data["results"]}");
    if (response.statusCode == 200){

      return List<SimilarMovies>.from((response.data["results"]).map((e) => SimilarMovieModel.fromJson(e)));

    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getUpComingMovies() async{
    var response =  await Dio().get(ApiConstants.upComingMovies);
    print("upComingMovies");
    print(ApiConstants.upComingMovies);

    if (response.statusCode == 200){

      return List<MovieModel>.from((response.data["results"]).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<CreditsModel> getMovieCast(MovieDetailsParameters movieDetailsParameters)async {
    var response =  await Dio().get(ApiConstants.getCast(movieDetailsParameters.movieId));
    print("getMovieCast");

    if (response.statusCode == 200){

      return CreditsModel.fromJson(response.data);
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getActorMovies(ActorDetailsParameters actorDetailsParameters) async {
    print(ApiConstants.getActorMovies(actorDetailsParameters.actorId));
    var response =  await Dio().get(ApiConstants.getActorMovies(actorDetailsParameters.actorId));

    if (response.statusCode == 200){

      return List<MovieModel>.from((response.data["cast"]).map((e) => MovieModel.fromJson(e)));
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<Actor> getActorDetails(ActorDetailsParameters actorDetailsParameters) async {
    var response =  await Dio().get(ApiConstants.getActorDetails(actorDetailsParameters.actorId));

    if (response.statusCode == 200){

      return ActorModel.fromJson( response.data);
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> searchMovie(SearchParameters searchParameters) async {
    final url = ApiConstants.searchMovie(searchParameters.movieName);
    print(url);
    var response =  await Dio().get(url);
  print("searchMovie");
  print(response);
    if (response.statusCode == 200){

      return  List<MovieModel>.from(response.data["results"].map((e)=> MovieModel.fromJson(e))) ;
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<SocialMediaModel> getSocialMediaIds(MovieDetailsParameters movieDetailsParameters)async {
    final url = ApiConstants.socialMediaMovieIds(movieDetailsParameters.movieId);
    print(url);
    var response =  await Dio().get(url);

    if (response.statusCode == 200){

      return  SocialMediaModel.fromJson( response.data) ;
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<SocialMediaModel> getPersonSocialMediaIds( ActorDetailsParameters actorDetailsParameters) async {
    final url = ApiConstants.socialPersonMovieIds(actorDetailsParameters.actorId);
    print(url);
    var response =  await Dio().get(url);

    if (response.statusCode == 200){

      return  SocialMediaModel.fromJson( response.data) ;
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getSeeMorePopularMovies(MovieParameters movieParameters) async {
    final url = ApiConstants.seeMorePopularMovies(movieParameters.page);
    print(url);
    var response =  await Dio().get(url);

    if (response.statusCode == 200){

      return List<MovieModel>.from(response.data["results"].map((e)=> MovieModel.fromJson(e))) ;
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getSeeMoreTopRatedMovies(MovieParameters movieParameters) async {
    final url = ApiConstants.seeMoreTopRatedMovies(movieParameters.page);
    print(url);
    var response =  await Dio().get(url);

    if (response.statusCode == 200){

      return List<MovieModel>.from(response.data["results"].map((e)=> MovieModel.fromJson(e))) ;
    }
    else{
      throw ServiceExceptions(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }

}

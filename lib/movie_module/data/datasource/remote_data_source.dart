import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/core/error/Exceptions.dart';
import 'package:movie_app/core/error_message_model/Error_Message_Model.dart';
import 'package:movie_app/core/utils/api_constants.dart';
import 'package:movie_app/movie_module/data/model/movie_recomendation.dart';
import 'package:movie_app/movie_module/data/model/similar_movie_model.dart';
import 'package:movie_app/movie_module/domain/entites/movie_similar.dart';
import 'package:movie_app/movie_module/domain/usecase/get_movie_details_usecase.dart';

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

  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameters movieDetailsParameters);
  Future<List<MovieRecomendation>> getMoviesRecomendations(MovieRecomendationParameters movieRecomendationParameters);
  Future<List<SimilarMovies>> getSimilarMovies(MovieSimilarParameters movieSimilarParameters);
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

}

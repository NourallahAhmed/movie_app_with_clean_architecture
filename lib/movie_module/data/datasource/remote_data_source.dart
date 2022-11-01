import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/core/error/Exceptions.dart';
import 'package:movie_app/core/error_message_model/Error_Message_Model.dart';
import 'package:movie_app/core/utils/api_constants.dart';

import '../model/MovieModel.dart';

abstract class BaseRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class RemoteDataSource implements BaseRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {

    print(ApiConstants.nowPlayingMovies);
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

}

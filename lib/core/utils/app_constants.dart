class AppConstants{

  static final baseURL = "https://api.themoviedb.org/3/";
  static final apiKey = "69ed62c020bdc2b4f93f77003d9a1e3b";
  static final nowPlayingMovies = "${AppConstants.baseURL}movie/now_playing?api_key=${AppConstants.apiKey}";
  static final popularMovies = "${AppConstants.baseURL}movie/popular?api_key=${AppConstants.apiKey}";
  static final topRatedMovies = "${AppConstants.baseURL}movie/top_rated?api_key=${AppConstants.apiKey}";

}
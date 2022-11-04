class ApiConstants{

  static final baseURL = "https://api.themoviedb.org/3/";
  static final apiKey = "69ed62c020bdc2b4f93f77003d9a1e3b";
  static final nowPlayingMovies = "${ApiConstants.baseURL}movie/now_playing?api_key=${ApiConstants.apiKey}";
  static final popularMovies = "${ApiConstants.baseURL}movie/popular?api_key=${ApiConstants.apiKey}";
  static final topRatedMovies = "${ApiConstants.baseURL}movie/top_rated?api_key=${ApiConstants.apiKey}";
  static final baseImageURL = "https://image.tmdb.org/t/p/w500";
  static final baseMovieDetailsUrl = "movie/";

  static String imageUrl(String path ) => "${baseImageURL}${path}";
  static String detailsUrl(int movieID ) => "${baseURL}${baseMovieDetailsUrl}${movieID}?api_key=${apiKey}";
  static String recommendationsUrl(int movieID ) => "${baseURL}${baseMovieDetailsUrl}${movieID}/recommendations?api_key=${apiKey}";


}
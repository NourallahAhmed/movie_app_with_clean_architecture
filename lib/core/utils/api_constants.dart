class ApiConstants{

  static final baseURL = "https://api.themoviedb.org/3/";
  static final apiKey = "69ed62c020bdc2b4f93f77003d9a1e3b";
  static final nowPlayingMovies = "${ApiConstants.baseURL}movie/now_playing?api_key=${ApiConstants.apiKey}";
  static final upComingMovies = "${ApiConstants.baseURL}movie/upcoming?api_key=${ApiConstants.apiKey}";
  static final popularMovies = "${ApiConstants.baseURL}movie/popular?api_key=${ApiConstants.apiKey}";
  static final topRatedMovies = "${ApiConstants.baseURL}movie/top_rated?api_key=${ApiConstants.apiKey}";
  static final baseImageURL = "https://image.tmdb.org/t/p/w500";
  //todo Actors
  static String getActorMovies(int actorID) => "${baseURL}person/${actorID}/movie_credits?api_key=${apiKey}";
  static String getActorDetails(int actorID) => "${baseURL}person/${actorID}?api_key=${apiKey}";

  //todo ImageURL
  static String imageUrl(String path ) => "${baseImageURL}${path}";

  //todo movie details
  static String detailsUrl(int movieID ) => "${baseURL}movie/${movieID}?api_key=${apiKey}";

  //todo movie recommendation
  static String recommendationsUrl(int movieID ) => "${baseURL}movie/${movieID}/recommendations?api_key=${apiKey}";
  static String getMovieProviders(int movieID) => "${baseURL}${movieID}/watch/providers?api_key=${apiKey}";

  //todo movie similar
  static String getSimilar(int movieID) => "${baseURL}/movie/${movieID}/similar?api_key=${apiKey}";

  //todo cast
  static String getCast(int movieID) => "${baseURL}/movie/${movieID}/credits?api_key=${apiKey}";

  //todo Search Movie
  static String searchMovie(String keyWord) =>"${baseURL}/search/movie?api_key=${apiKey}&language=en-US&query=${keyWord}&page=1&include_adult=false";
  //todo Social Media


  //todo getSocialMediaIds
  static String socialMediaMovieIds (int movieID) => "${baseURL}movie/${movieID}/external_ids?api_key=${apiKey}";

  //todo: twitter
  static String twitterUrl(String socialMediaID) =>"https://twitter.com/${socialMediaID}";

  //todo: facebook
  static String facebookUrl(String socialMediaID) =>"https://www.facebook.com/${socialMediaID}";
  //todo: instgram
  static String instgramUrl(String socialMediaID) =>"https://www.instagram.com/${socialMediaID}";



}
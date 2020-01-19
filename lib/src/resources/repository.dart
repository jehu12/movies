import 'movie_api_provider.dart';
import 'dart:async';
import '../models/movie_model.dart';
import '../models/trailer_model.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();

  Future<MovieResponse> fetchAllMovies() => movieApiProvider.fetchMovieList();

  Future<TrailerResponse> fetchAllTrailers(int movieId) =>
      movieApiProvider.fetchTrailerList(movieId);
}

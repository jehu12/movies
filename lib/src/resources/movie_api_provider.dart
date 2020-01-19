import 'package:http/http.dart' show Client;
import '../models/movie_model.dart';
import '../models/trailer_model.dart';
import 'dart:async';
import 'dart:convert';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'da77e59429c7b87fb0776156399607ac';
  final _baseUrl = 'https://api.themoviedb.org/3/movie';

  Future<MovieResponse> fetchMovieList() async {
    final res = await client.get('$_baseUrl/popular?api_key=$_apiKey');
    if (res.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load movie list');
    }
  }

  Future<TrailerResponse> fetchTrailerList(int movieId) async {
    final res = await client.get('$_baseUrl/$movieId/videos?api_key=$_apiKey');

    if (res.statusCode == 200) {
      return TrailerResponse.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}

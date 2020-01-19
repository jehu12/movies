import 'package:rxdart/rxdart.dart';
import '../models/movie_model.dart';
import '../resources/repository.dart';

class MovieBloc {
  final _repository = Repository();
  final _movieFetcher = PublishSubject<MovieResponse>();

  Observable<MovieResponse> get allMovies => _movieFetcher.stream;

  fetchAllMovies() async {
    MovieResponse movieResponse = await _repository.fetchAllMovies();
    _movieFetcher.sink.add(movieResponse);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final movieBloc = MovieBloc();

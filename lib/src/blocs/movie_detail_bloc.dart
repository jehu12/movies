import 'package:rxdart/rxdart.dart';
import '../models/trailer_model.dart';
import '../resources/repository.dart';
import 'dart:async';

class MovieDetailBloc {
  final _trailers = BehaviorSubject<Future<TrailerResponse>>();
  final _movieId = PublishSubject<int>();
  final _repository = Repository();

  Function(int) get fetchTrailersById => _movieId.sink.add;
  Observable<Future<TrailerResponse>> get allTrailers => _trailers.stream;

  MovieDetailBloc() {
    _movieId.stream.transform(_itemsTransformer()).pipe(_trailers);
  }

  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
      (Future<TrailerResponse> trailer, int id, int index) {
        trailer = _repository.fetchAllTrailers(id);
        return trailer;
      },
    );
  }
}

class MovieResponse {
  int _page;
  List<Result> _results = [];

  MovieResponse.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    List<Result> temp = [];

    for (int i = 0; i < parsedJson['results'].length; i++) {
      Result result = Result(parsedJson['results'][i]);
      temp.add(result);
    }

    _results = temp;
  }

  List<Result> get results => _results;
  int get page => _page;
}

class Result {
  int _id;
  String _vote_average;
  String _title;
  String _poster_path;
  String _backdrop_path;
  String _overview;
  String _release_date;

  Result(result) {
    _id = result['id'];
    _vote_average = result['vote_average'].toString();
    _title = result['title'];
    _poster_path = result['poster_path'];
    _backdrop_path = result['backdrop_path'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  int get id => _id;
  String get vote_average => _vote_average;
  String get title => _title;
  String get poster_path => _poster_path;
  String get backdrop_path => _backdrop_path;
  String get overview => _overview;
  String get release_date => _release_date;
}

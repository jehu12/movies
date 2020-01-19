class TrailerResponse {
  int _id;
  List<TrailerResult> _results = [];

  TrailerResponse.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];

    List<TrailerResult> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      TrailerResult trailerResult = TrailerResult(parsedJson['results'][i]);
      temp.add(trailerResult);
    }

    _results = temp;
  }

  List<TrailerResult> get results => _results;
}

class TrailerResult {
  String _id;
  String _name;

  TrailerResult(trailerResult) {
    _id = trailerResult['id'];
    _name = trailerResult['name'];
  }

  String get id => _id;
  String get name => _name;
}

class Album {
  int _userId;
  int _id;
  String _body;
  List<Album> _albuns = [];

  Album(this._id, this._userId, this._body);

  Album.fromJson(List<dynamic> parsedJson) {
    for (int i = 0; i < parsedJson.length; i++) {
      Album album = Album(
          parsedJson[i]["id"], parsedJson[i]["userId"], parsedJson[i]["title"]);

      _albuns.add(album);
    }
  }

  int get id => _id;
  int get userId => _userId;
  String get body => _body;
  List<Album> get albums => _albuns;
}

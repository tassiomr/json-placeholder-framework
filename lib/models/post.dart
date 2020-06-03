class Post {
  int _userId;
  int _id;
  String _title;
  String _body;
  List<Post> _posts = [];

  Post(this._id, this._userId, this._title, this._body);

  Post.fromJson(List<dynamic> parsedJson) {
    for (int i = 0; i < parsedJson.length; i++) {
      Post post = Post(parsedJson[i]["id"], parsedJson[i]["userId"],
          parsedJson[i]["title"], parsedJson[i]["body"]);

      _posts.add(post);
    }
  }

  int get id => _id;
  int get userId => _userId;
  String get title => _title;
  String get body => _body;
  List<Post> get posts => _posts;
}

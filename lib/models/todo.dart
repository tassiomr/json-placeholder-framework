class Todo {
  int _userId;
  int _id;
  String _title;
  bool _completed;
  List<Todo> _todos = [];

  Todo(this._id, this._userId, this._title, this._completed);

  Todo.fromJson(List<dynamic> parsedJson) {
    for (int i = 0; i < parsedJson.length; i++) {
      Todo todo = Todo(parsedJson[i]["id"], parsedJson[i]["userId"],
          parsedJson[i]["title"], parsedJson[i]["completed"]);

      _todos.add(todo);
    }
  }

  toggleCheck() {
    this._completed = !this._completed;
  }

  int get userId => _userId;
  int get id => _id;
  String get title => _title;
  bool get completed => _completed;
  List<Todo> get todos => _todos;
}

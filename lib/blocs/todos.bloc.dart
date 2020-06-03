import 'package:framework_desafio/models/todo.dart';
import 'package:framework_desafio/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc {
  final _repository = Repository();
  final _todoFetcher = PublishSubject<Todo>();

  Observable<Todo> get allTodos => _todoFetcher.stream;

  fetchAllTodos(bool refresh) async {
    Todo todo = await _repository.fetchTodos(refresh);
    _todoFetcher.sink.add(todo);
  }

  dispose() {
    _todoFetcher.close();
  }
}

final bloc = TodoBloc();

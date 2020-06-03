import 'package:flutter/material.dart';
import 'package:framework_desafio/blocs/todos.bloc.dart';
import 'package:framework_desafio/models/todo.dart';
import 'package:framework_desafio/ui/widgets/todos.widget.dart';

class TodoList extends StatefulWidget {
  TodoList();

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllTodos(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: bloc.allTodos,
      builder: (context, AsyncSnapshot<Todo> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Widget buildList(AsyncSnapshot<Todo> snapshot) {
    return RefreshIndicator(
      onRefresh: () => bloc.fetchAllTodos(true),
      child: ListView.builder(
          itemCount: snapshot.data.todos.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoWidget(snapshot.data.todos[index]);
          }),
    );
  }
}

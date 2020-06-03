import 'package:flutter/material.dart';
import 'package:framework_desafio/models/todo.dart';

class TodoWidget extends StatefulWidget {
  final Todo _todo;

  TodoWidget(this._todo);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
      height: 75,
      child: Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              widget._todo.toggleCheck();
            });
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Checkbox(
                    activeColor: Theme.of(context).primaryColor,
                    value: widget._todo.completed,
                    onChanged: (_) {
                      setState(() {
                        widget._todo.toggleCheck();
                      });
                    }),
                Expanded(
                  child: Text(
                    widget._todo.title,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

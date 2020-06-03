import 'package:flutter/material.dart';
import 'package:framework_desafio/models/post.dart';

class PostWidget extends StatelessWidget {
  final Post _post;

  PostWidget(this._post);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 4, 16, 0),
        child: Card(
          elevation: 5,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      _post.title,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Text(
                    _post.body,
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

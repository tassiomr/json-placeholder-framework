import 'package:flutter/material.dart';
import 'package:framework_desafio/models/album.dart';

class AlbumWidget extends StatelessWidget {
  final Album _album;

  AlbumWidget(this._album);

  Widget build(BuildContext context) {
    void _showDialog() {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text('Album with id: ${_album.id}'),
            content: Text(_album.body),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]),
      );
    }

    return InkWell(
      onTap: () {
        _showDialog();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
        child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this._album.body,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

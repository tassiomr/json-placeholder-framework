import 'package:flutter/material.dart';
import 'package:framework_desafio/blocs/albums.bloc.dart';
import 'package:framework_desafio/models/album.dart';
import 'package:framework_desafio/ui/widgets/albums.widget.dart';

class AlbumsList extends StatefulWidget {
  AlbumsList();

  @override
  _AlbumsListState createState() => _AlbumsListState();
}

class _AlbumsListState extends State<AlbumsList> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllAlbums(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: bloc.allAlbums,
      builder: (context, AsyncSnapshot<Album> snapshot) {
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

  Widget buildList(AsyncSnapshot<Album> snapshot) {
    return RefreshIndicator(
      onRefresh: () => bloc.fetchAllAlbums(true),
      child: ListView.builder(
          itemCount: snapshot.data.albums.length,
          itemBuilder: (BuildContext context, int index) {
            return AlbumWidget(snapshot.data.albums[index]);
          }),
    );
  }
}

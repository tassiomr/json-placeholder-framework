import 'dart:async';
import 'package:framework_desafio/models/todo.dart';

import 'api_provider.dart';
import 'package:framework_desafio/models/album.dart';
import 'package:framework_desafio/models/post.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<Album> fetchAlbums(bool refresh) =>
      apiProvider.fetchAlbuns(refresh: refresh);
  Future<Post> fetchPosts(bool refresh) =>
      apiProvider.fetchPosts(refresh: refresh);
  Future<Todo> fetchTodos(bool refresh) =>
      apiProvider.fetchTodos(refresh: refresh);
}

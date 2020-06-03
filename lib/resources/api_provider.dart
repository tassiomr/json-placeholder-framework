import 'dart:async';
import 'package:framework_desafio/models/post.dart';
import 'package:framework_desafio/models/todo.dart';
import 'package:framework_desafio/storage/storage.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:framework_desafio/models/album.dart';

class ApiProvider {
  Client client = Client();
  final String apiUrl = "https://jsonplaceholder.typicode.com/";

  final String _posts = "posts";
  final String _albums = "albums";
  final String _todos = "todos";

  Future<Album> fetchAlbuns({bool refresh: false}) async {
    if (!refresh) {
      final storageAlbum = await Storage.getValue(this._albums);

      if (storageAlbum != null) {
        return Album.fromJson(json.decode(storageAlbum));
      }
    }

    final response = await client.get(this.apiUrl + this._albums);

    if (response.statusCode == 200) {
      await Storage.setValue(response.body, this._albums);
      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load albuns');
    }
  }

  Future<Post> fetchPosts({bool refresh: false}) async {
    if (!refresh) {
      final storageAlbum = await Storage.getValue(this._posts);

      if (storageAlbum != null) {
        return Post.fromJson(json.decode(storageAlbum));
      }
    }

    final response = await client.get(this.apiUrl + this._posts);

    if (response.statusCode == 200) {
      await Storage.setValue(response.body, this._posts);
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<Todo> fetchTodos({bool refresh: false}) async {
    if (!refresh) {
      final storageTodos = await Storage.getValue(this._todos);

      if (storageTodos != null) {
        return Todo.fromJson(json.decode(storageTodos));
      }
    }

    final response = await client.get(this.apiUrl + this._todos);

    if (response.statusCode == 200) {
      await Storage.setValue(response.body, this._todos);

      return Todo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load todos');
    }
  }
}

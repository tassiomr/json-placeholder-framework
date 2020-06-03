import 'package:framework_desafio/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:framework_desafio/models/post.dart';

class PostsBloc {
  final _repository = Repository();
  final _postFetcher = PublishSubject<Post>();

  Observable<Post> get allPosts => _postFetcher.stream;

  fetchAllPosts(bool refresh) async {
    Post post = await _repository.fetchPosts(refresh);
    _postFetcher.sink.add(post);
  }

  dispose() {
    _postFetcher.close();
  }
}

final bloc = PostsBloc();

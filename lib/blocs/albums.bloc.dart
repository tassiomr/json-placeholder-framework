import 'package:framework_desafio/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:framework_desafio/models/album.dart';

class AlbunsBloc {
  final _repository = Repository();
  final _albumFetcher = PublishSubject<Album>();

  Observable<Album> get allAlbums => _albumFetcher.stream;

  fetchAllAlbums(bool refresh) async {
    Album album = await _repository.fetchAlbums(refresh);
    _albumFetcher.sink.add(album);
  }

  dispose() {
    _albumFetcher.close();
  }
}

final bloc = AlbunsBloc();

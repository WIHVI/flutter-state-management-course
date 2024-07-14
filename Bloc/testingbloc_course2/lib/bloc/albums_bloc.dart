import 'package:bloc/bloc.dart';
import 'package:testingbloc_course2/fetch_result.dart';
import 'package:testingbloc_course2/bloc/bloc_actions.dart';
import 'package:testingbloc_course2/bloc/album.dart';

class AlbumsBloc extends Bloc<LoadAction, FetchResult?> {
  final Map<String, Iterable<Album>> _cache = {};
  AlbumsBloc() : super(null) {
    on<LoadAlbumUrlAction>(
      (event, emit) async {
        final url = event.url;
        if (_cache.containsKey(url)) {
          final cachedUsers = _cache[url]!;
          final result = FetchResult(
            users: cachedUsers,
            isRetrievedFromCache: true,
          );
          emit(result);
        } else {
          final loader = event.loader;
          final users = await loader(url);
          _cache[url] = users;
          final result = FetchResult(
            users: users,
            isRetrievedFromCache: false,
          );
          emit(result);
        }
      },
    );
  }
}

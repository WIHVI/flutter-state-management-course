import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:testingbloc_course2/bloc/album.dart';
import 'package:testingbloc_course2/bloc/albums_bloc.dart';
import 'package:testingbloc_course2/bloc/bloc_actions.dart';
import 'package:testingbloc_course2/fetch_result.dart';

const mockedAlbums1 = [
  Album(id: 1, title: 'quidem molestiae enim'),
  Album(id: 2, title: 'sunt qui excepturi placeat culpa'),
];

const mockedAlbums2 = [
  Album(id: 1, title: 'quidem molestiae enim'),
  Album(id: 2, title: 'sunt qui excepturi placeat culpa'),
];

Future<Iterable<Album>> mockedGetAlbums1(String _) =>
    Future.value(mockedAlbums1);
Future<Iterable<Album>> mockedGetAlbums2(String _) =>
    Future.value(mockedAlbums2);

void main() {
  group(
    'Testing bloc',
    () {
      late AlbumsBloc bloc;

      // This function will be called before each test is run
      setUp(() => bloc = AlbumsBloc());

      blocTest<AlbumsBloc, FetchResult?>(
        'Test initial state',
        build: () => bloc,
        verify: (bloc) => expect(bloc.state, null),
      );

      // Fetch mock data(albums 1) and compare it with FetchResults
      blocTest<AlbumsBloc, FetchResult?>(
        'Mock retrieving albums from firs iterable',
        build: () => bloc,
        act: (bloc) {
          bloc.add(
            const LoadAlbumUrlAction(
              url: 'dummy_url_1',
              loader: mockedGetAlbums1,
            ),
          );
          bloc.add(
            const LoadAlbumUrlAction(
              url: 'dummy_url_1',
              loader: mockedGetAlbums1,
            ),
          );
        },
        expect: () => [
          const FetchResult(users: mockedAlbums1, isRetrievedFromCache: false),
          const FetchResult(users: mockedAlbums1, isRetrievedFromCache: true),
        ],
      );

      // Fetch mock data(albums 2) and compare it with FetchResults
      blocTest<AlbumsBloc, FetchResult?>(
        'Mock retrieving albums from second iterable',
        build: () => bloc,
        act: (bloc) {
          bloc.add(
            const LoadAlbumUrlAction(
              url: 'dummy_url_2',
              loader: mockedGetAlbums2,
            ),
          );
          bloc.add(
            const LoadAlbumUrlAction(
              url: 'dummy_url_2',
              loader: mockedGetAlbums2,
            ),
          );
        },
        expect: () => [
          const FetchResult(users: mockedAlbums2, isRetrievedFromCache: false),
          const FetchResult(users: mockedAlbums2, isRetrievedFromCache: true),
        ],
      );
    },
  );
}

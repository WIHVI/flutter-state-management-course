import 'package:flutter/material.dart';
import 'package:testingbloc_course2/bloc/album.dart';

const String albums1Url = 'https://jsonplaceholder.typicode.com/albums';
const String albums2Url = 'https://jsonplaceholder.typicode.com/albums';

typedef UsersLoader = Future<Iterable<Album>> Function(String url);

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadAlbumUrlAction implements LoadAction {
  final String url;
  final UsersLoader loader;

  const LoadAlbumUrlAction({
    required this.url,
    required this.loader,
  }) : super();
}

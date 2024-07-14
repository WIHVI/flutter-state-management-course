import 'package:testingbloc_course2/bloc/album.dart';
import 'package:testingbloc_course2/extensions.dart';

class FetchResult {
  final Iterable<Album> users;
  final bool isRetrievedFromCache;

  const FetchResult({
    required this.users,
    required this.isRetrievedFromCache,
  });

  @override
  String toString() =>
      'FetchResult (isRetrievedFromCache = $isRetrievedFromCache)';

  @override
  bool operator ==(covariant FetchResult other) =>
      users.isEqualToIgnoringOrdering(other.users) &&
      isRetrievedFromCache == other.isRetrievedFromCache;

  @override
  int get hashCode => Object.hash(users, isRetrievedFromCache);
}

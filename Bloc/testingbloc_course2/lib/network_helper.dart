import 'dart:convert';
import 'dart:io';

import 'package:testingbloc_course2/bloc/album.dart';

Future<Iterable<Album>> getUsers(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((res) => res.transform(utf8.decoder).join())
    .then((str) => json.decode(str) as List<Map<String, dynamic>>)
    .then((list) => list.map((e) => Album.fromJson(e)));

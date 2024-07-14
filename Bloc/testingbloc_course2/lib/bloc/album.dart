import 'package:flutter/material.dart' show immutable;

@immutable
class Album {
  final int id;
  final String title;

  const Album({
    required this.id,
    required this.title,
  });

  Album.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['name'] as String;
}

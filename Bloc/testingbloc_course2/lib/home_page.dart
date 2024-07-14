import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingbloc_course2/fetch_result.dart';
import 'package:testingbloc_course2/bloc/bloc_actions.dart';

import 'package:testingbloc_course2/bloc/albums_bloc.dart';
import 'package:testingbloc_course2/extensions.dart';
import 'package:testingbloc_course2/network_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () async {
                  context.read<AlbumsBloc>().add(
                        const LoadAlbumUrlAction(
                          url: albums1Url,
                          loader: getUsers,
                        ),
                      );
                },
                child: const Text('Load json #1'),
              ),
              TextButton(
                onPressed: () {
                  context.read<AlbumsBloc>().add(
                        const LoadAlbumUrlAction(
                          url: albums2Url,
                          loader: getUsers,
                        ),
                      );
                },
                child: const Text('Load json #2'),
              ),
            ],
          ),
          BlocBuilder<AlbumsBloc, FetchResult?>(
            buildWhen: (previous, current) {
              return previous?.users != current?.users;
            },
            builder: (context, fetchResult) {
              final users = fetchResult?.users;
              if (users == null) {
                return const SizedBox();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index]!;
                    return ListTile(
                      title: Text(user.title),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

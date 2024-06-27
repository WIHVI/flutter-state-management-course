import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingprovider_course/bread_crumb_provider.dart';
import 'package:testingprovider_course/home_page.dart';
import 'package:testingprovider_course/new_bread_crumb_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BreadCrumbProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          '/new': (context) => const NewBreadCrumbWidget(),
        },
      ),
    );
  }
}

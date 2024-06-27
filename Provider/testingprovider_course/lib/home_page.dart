import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingprovider_course/bread_crumb_provider.dart';
import 'package:testingprovider_course/bread_crumb_widget.dart';

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
          Consumer<BreadCrumbProvider>(
            builder: (context, value, child) {
              return BreadCrumbWidget(breadCrumbs: value.items);
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/new');
            },
            child: const Text(
              'Add a new bread crumb',
            ),
          ),
          TextButton(
            onPressed: () {
              context.read<BreadCrumbProvider>().reset();
            },
            child: const Text(
              'Reset',
            ),
          ),
        ],
      ),
    );
  }
}

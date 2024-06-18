import 'package:flutter/material.dart';
import 'package:vanillacontacts_course/contactbook.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: ContactBook(),
        builder: (context, value, child) {
          return ListView.separated(
            padding: const EdgeInsetsDirectional.all(16),
            itemCount: value.length,
            itemBuilder: (context, index) {
              final contact = value[index];
              return Dismissible(
                onDismissed: (_) => ContactBook().remove(contact: contact),
                key: ValueKey(contact.id),
                child: Material(
                  color: Colors.deepPurple[50],
                  elevation: 2,
                  child: ListTile(
                    title: Text(contact.name),
                    subtitle: Text(contact.number),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 16),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/new-contact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

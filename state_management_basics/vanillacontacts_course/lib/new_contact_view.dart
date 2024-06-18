import 'package:flutter/material.dart';
import 'package:vanillacontacts_course/contact.dart';
import 'package:vanillacontacts_course/contactbook.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  late final TextEditingController _nameController;
  late final TextEditingController _numberController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new contact'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            autocorrect: false,
            autofocus: true,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Enter new contact name',
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _numberController,
            autocorrect: false,
            autofocus: true,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: 'Enter new contact number',
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              final contact = Contact(
                name: _nameController.text,
                number: _numberController.text,
              );
              ContactBook().add(contact: contact);

              Navigator.of(context).pop();
            },
            child: const Text('Add contact'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vanillacontacts_course/contact.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._sharedInstance() : super([]);
  static final ContactBook _shared = ContactBook._sharedInstance();
  factory ContactBook() => _shared;

  final List<Contact> _contacts = [];

  int get length => value.length;

  void add({required Contact contact}) {
    _contacts.add(contact);
    value = _contacts;
    notifyListeners();
  }

  void remove({required Contact contact}) {
    if (_contacts.contains(contact)) {
      _contacts.remove(contact);
      value = _contacts;
    }
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}

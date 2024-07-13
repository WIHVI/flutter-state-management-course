import 'package:bloc/bloc.dart';
import 'package:testingbloc_course1/names.dart';

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(names.getRandomElement());
}

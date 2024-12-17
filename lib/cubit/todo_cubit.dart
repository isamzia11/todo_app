import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoCubit extends Cubit<List<ToDo>> {
  TodoCubit() : super([]);

  void addToDo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty');
      const SnackBar(content: Text('Title cannot be empty'));
      return;
    }
    final todo = ToDo(name: title, createdAt: DateTime.now());

    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<ToDo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print('ToDoCubit -  $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print('ToDoCubit - $error');
  }
}

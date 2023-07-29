import 'package:evoluir/todo_model.dart';
import 'package:evoluir/todo_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  final ValueNotifier<HomeState> state = ValueNotifier(HomeState.start);

  HomeController([TodoRepository? repository]) : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try{
      todos = await _repository.fetch();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }


}

enum HomeState { start, loading, success, error }
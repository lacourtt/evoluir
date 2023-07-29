import 'package:dio/dio.dart';
import 'package:evoluir/todo_model.dart';

class TodoRepository {
  Dio? dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<TodoModel>> fetch() async {
    final response = await dio?.get(url);
    var list = response?.data as List;

    List<TodoModel> todos = list.map((e) => TodoModel.fromJson(e)).toList();

    return todos;
  }
}
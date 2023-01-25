// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:to_do_app/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:to_do_app/cubits/todo_list/todo_list_cubit.dart';
import 'package:to_do_app/cubits/todo_search/todo_search_cubit.dart';

import '../../models/todo_model.dart';

part 'filter_todos_state.dart';

class FilterTodosCubit extends Cubit<FilterTodoState> {
  late StreamSubscription todoFilterSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoListSubscription;

  final List<Todo> initialTodos;
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;
  FilterTodosCubit({
    required this.initialTodos,
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
  }) : super(FilterTodoState(filterTodo: initialTodos)) {
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFilterdTodo();
    });
    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFilterdTodo();
    });
    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      setFilterdTodo();
    });
  }

  void setFilterdTodo() {
    List<Todo> _filterdTodo;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        _filterdTodo = todoListCubit.state.todos
            .where((Todo todo) => !todo.completed)
            .toList();
        break;

      case Filter.completed:
        _filterdTodo = todoListCubit.state.todos
            .where((Todo todo) => todo.completed)
            .toList();
        break;

      case Filter.all:
      default:
        _filterdTodo = todoListCubit.state.todos;
        break;
    }

    if (todoSearchCubit.state.searchTerms.isNotEmpty) {
      _filterdTodo = _filterdTodo
          .where((Todo todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerms))
          .toList();
    }
    emit(state.copyWith(filterTodo: _filterdTodo));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoListSubscription.cancel();
    todoSearchSubscription.cancel();
    return super.close();
  }
}


// this partt of the code works for the enum we have decleard in the model file
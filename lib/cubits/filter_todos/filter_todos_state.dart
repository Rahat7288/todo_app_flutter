// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_todos_cubit.dart';

class FilterTodoState extends Equatable {
  final List<Todo> filterTodo;
  FilterTodoState({
    required this.filterTodo,
  });

  factory FilterTodoState.initial() {
    return FilterTodoState(filterTodo: []);
  }

  @override
  List<Object> get props => [filterTodo];

  @override
  String toString() => 'FilterTodoState(filterTodo: $filterTodo)';

  FilterTodoState copyWith({
    List<Todo>? filterTodo,
  }) {
    return FilterTodoState(
      filterTodo: filterTodo ?? this.filterTodo,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';

Uuid uuid = Uuid();

enum Filter {
  all,
  active,
  completed,
}

class Todo extends Equatable {
  final String id;
  final String desc;
  final bool completed;
  Todo({
    String? id,
    required this.desc,
    this.completed = false,
  }) : id = id ?? uuid.v4();

  // generating Equitable

  @override
  List<Object> get props => [id, desc, completed];

  @override
  String toString() => 'Todo(id: $id, desc: $desc, completed: $completed)';
}

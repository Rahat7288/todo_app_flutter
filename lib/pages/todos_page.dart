import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/cubits.dart';
import 'package:to_do_app/pages/create_todo.dart';
import 'package:to_do_app/pages/search_and_filter_todo.dart';
import 'package:to_do_app/pages/show_todos.dart';
import 'package:to_do_app/pages/todos_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            TodoHeader(),
            CreateTodo(),
            const SizedBox(
              height: 20.0,
            ),
            SearchAndFilter(),
            const SizedBox(
              height: 10.0,
            ),
            ShowTodos(),
          ],
        ),
      )),
    ));
  }
}
